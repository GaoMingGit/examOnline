package cn.itcast.exam.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import cn.itcast.exam.domain.AdminBean;
import cn.itcast.exam.domain.PageBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.AdminService;
import cn.itcast.exam.utils.MysubString;
import cn.itcast.exam.utils.UploadUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<QuestionBean> {
	private QuestionBean questionBean = new QuestionBean();
	
	public void setQuestionBean(QuestionBean questionBean) {
		this.questionBean = questionBean;
	}

	@Override
	public QuestionBean getModel() {
		// TODO Auto-generated method stub
		return questionBean;
	}
	
	private String uploadFileName;
	private File upload;
	private String uploadContentType;

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	//提供当前页、每页显示条数的属性
	private Integer currentPage = 1;
	private Integer pageSize = 5;
	
	public void setCurrentPage(Integer currentPage) {
		if(currentPage == null){
			currentPage = 1 ;
		}
		this.currentPage = currentPage;
	}

	public void setPageSize(Integer pageSize) {
		if(pageSize == null){
			pageSize = 5 ;
		}
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	//注入AdminService
	private AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	//前往后台管理登录的页面
	public String toAdminLoginUI(){
		return "toAdminLoginUI";
	}
	
	//异步请求判断管理员账号是否存在
	public String checkName() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String adminname = request.getParameter("adminname");
		AdminBean admin = adminService.findAdminByname(adminname);
		if(admin != null){
			//说明管理员账号存在
			ServletActionContext.getResponse().getWriter().print(1);
		}else{
			ServletActionContext.getResponse().getWriter().print(2);
		}
		return NONE;
	}
	//管理员登录的方法
	public String adminLogin() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String adminname = request.getParameter("adminname");
		String adminpassword = request.getParameter("adminpassword");
		AdminBean admin = new AdminBean(adminname,adminpassword);
		AdminBean loginAdmin = adminService.adminLogin(admin);
		if(loginAdmin != null){
			//登陆成功
			ServletActionContext.getResponse().getWriter().print(1);
		}else{
			ServletActionContext.getResponse().getWriter().print(2);
		}
		ServletActionContext.getRequest().getSession().setAttribute("exitAdmin", loginAdmin);
		return NONE;
	}
	//用户退出登录
	public String logout(){
		ServletActionContext.getRequest().getSession().removeAttribute("exitAdmin");
		return "toIndexUI";
	}
	//管理员登录成功跳转后台管理页面的首页
	public String toIndexUI(){
		return "toIndexUI";
	}
	//跳转添加试题的界面
	public String toAddQuestionUI(){
		return "toAddQuestionUI";
	}
	//添加试题的方法
	public String save() throws IOException{
		if(upload != null){
			//如果上传文件项不为空，则设置路径
//			String path = "E://examOnline_img";
			String path = ServletActionContext.getServletContext().getRealPath("/examOnline_img/");
			//得到唯一文件名
			String uuidFileName = UploadUtil.getUuid(uploadFileName);
			String realPath = UploadUtil.getPath(uuidFileName);
			String url = path+realPath;
			File file = new File(url);
			if(!file.exists()){
				file.mkdirs();
			}
			File file2 = new File(url+"/"+uuidFileName);
			FileUtils.copyFile(upload, file2);
			questionBean.setImagepath("examOnline_img"+realPath+"/"+uuidFileName);
			System.out.println("上传成功");
		}
		System.out.println("图片上传的路径是:"+questionBean.getImagepath());
		String daAn = questionBean.getAnswer().toString().replace(", ", "");//将答案改为字符串
		questionBean.setAnswer(daAn);
		//设置添加题目的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		questionBean.setAddTime(sdf.format(new Date()));
		adminService.save(questionBean);
		return "toFindAll";
	}
	
	//条件查询
	public String findByPage(){
		
		DetachedCriteria dtc = DetachedCriteria.forClass(QuestionBean.class);
		
		//查看所有单选题或者判断题或者多选题
		if(questionBean.getCid() != null ){
			if(!questionBean.getCid().equals("")){
				dtc.add(Restrictions.eq("cid", questionBean.getCid()));
				ServletActionContext.getRequest().getSession().setAttribute("cid", questionBean.getCid());
			}
		}
		
		PageBean<QuestionBean> pageBean = adminService.find(dtc,currentPage,pageSize);
		List<QuestionBean> list2 = pageBean.getList();
		
		//截取字符串,将题目试题内容长度过大的文字以...的形式展现
		List<QuestionBean> list = MysubString.subStringWord(pageBean.getList());
		
		pageBean.setList(list);
		//将pageBean存入值栈中
		//ActionContext.getContext().getValueStack().push(pageBean);
		
		ServletActionContext.getRequest().getSession().setAttribute("pageBean", pageBean);
		return "findAll";
	}
	//详细查询
	public String findByUUID(){
		questionBean = adminService.findByUUID(questionBean.getQid());
		ServletActionContext.getRequest().getSession().setAttribute("questionBean", questionBean);
		return "findByUUID";
	}
	
	//查看所有图片
	public String findByIma(){
		PageBean<QuestionBean> pageBean = adminService.findByIma(currentPage,pageSize);
		//截取字符串,将题目试题内容长度过大的文字以...的形式展现
		List<QuestionBean> list = MysubString.subStringWord(pageBean.getList());
				
		pageBean.setList(list);
		ServletActionContext.getRequest().getSession().setAttribute("pageBean", pageBean);
		return "findAll";
		
	}
	
	//查看所有图片
		public String getAll(){
			System.out.println("getAll方法执行了");
			PageBean<QuestionBean> pageBean = adminService.getAll(currentPage,pageSize);
			//截取字符串,将题目试题内容长度过大的文字以...的形式展现
			List<QuestionBean> list = MysubString.subStringWord(pageBean.getList());
			
			pageBean.setList(list);
			ServletActionContext.getRequest().getSession().setAttribute("pageBean", pageBean);
			return "theAll";
			
		}
	//删除题目
	public String delete(){
		questionBean = adminService.findByUUID(questionBean.getQid());
		adminService.delete(questionBean);
		return "toFindAll";
	}
	
	/*//修改题目
	public String toEdictPage(){
		System.out.println("修改的id是:"+questionBean.getQid());
		questionBean = adminService.findByUUID(questionBean.getQid());
		String[] s = questionBean.getAnswer().split("");
		List<String> list = new ArrayList<String>();
		for (String string : s) {
			string = "\""+string+"\"";
			list.add(string);
		}
		String[] strings = list.toArray(questionBean.getS());
		questionBean.setS(strings);
		System.out.println(questionBean);
		ServletActionContext.getRequest().getSession().setAttribute("questionBean", questionBean);
		return "edictPage";
	}*/
	
	/*//查看所有用户列表
	public String findAllUser(){
		System.out.println("执行查询所有用户的方法");
		HttpServletRequest request = ServletActionContext.getRequest();
		DetachedCriteria dtc = DetachedCriteria.forClass(User.class);
		String uid = request.getParameter("uid");
		String username = request.getParameter("username");
		//如果查询用户的id账号不为空
		if(uid != null){
			
		}
		PageBean<User> pageBean = adminService.findUser(dtc,currentPage,pageSize);
		ServletActionContext.getRequest().getSession().setAttribute("pageBean", pageBean);
		return "toUserList";
	}*/
}
