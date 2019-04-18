package cn.itcast.exam.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.UserService;
import cn.itcast.exam.utils.MD5Utils;
import cn.itcast.exam.utils.MyNumber;
import cn.itcast.exam.utils.SendMail;
import cn.itcast.exam.utils.SendMailCode;
import cn.itcast.exam.utils.UploadUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	private UserService userService;
	//定义一个数字标识，从jsp页面中传过来，其中 1 代表是科目一练习，4 代表 科目四练习
	private User user = new User();
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public UserService getUserService() {
		return userService;
	}
	
	//用户上传头像所用的属性
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

	
	
	//异步处理请求，检测用户名是否已经存在
	public String checkName() throws IOException{
		user = userService.checkUserName(user.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		if(user != null){
			//如果返回的user不为空，说明用户名已经被注册
			response.getWriter().print(2);
		}else{
			//如果返回的user为空，说明用户名没有被注册，可以用
			response.getWriter().print(1);
		}
		return NONE;
	}

	//前往注册页面
	public String toRegistUI(){
		return "toRegistUI";
	}
	//前往注册页面
	public String toLoginUI(){
		return "login";	
	}
		
	//用户注册的方法
	public String regist(){
		user.setState(0);//设置用户的账号状态为0（处于没激活状态）
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String registTime = sdf.format(new Date());
		user.setRegisttime(registTime);//设置用户注册的时间
		//为用户设置激活码
		user.setUuidcode(UUID.randomUUID().toString().replace("-", ""));
		//为用户的密码用MD5加密
		String md5 = MD5Utils.md5(user.getPassword());
		user.setPassword(md5);
		userService.registUser(user);
		this.addActionMessage("恭喜您，注册成功。待会会有一封激活账号邮件发送至您邮箱中，请接收邮件前去激活账号");
//		ServletActionContext.getRequest().setAttribute("message", "恭喜您，注册成功。待会会有一封激活账号邮件发送至您邮箱中，请接收邮件前去激活账号");
		//开启新线程给用户的邮箱发送激活码
		SendMail sendMail = new SendMail(user);
		try {
			sendMail.send(user);
		} catch (MessagingException e) {
//			ServletActionContext.getRequest().getSession().setAttribute("message", "邮件发送失败，后方正在抢修发送邮件的服务器");
			this.addActionMessage("邮件发送失败，后方正在抢修发送邮件的服务器");
			e.printStackTrace();
		}finally{
			return "toEmail";
		}
	}
	
	//判断用户输入的邮箱是否存在
	public String checkEmail() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		//得到账号输入框的账号,去数据库查找用户
		User resetPwdUser = userService.checkUserName(ServletActionContext.getRequest().getParameter("username"));
		ServletActionContext.getRequest().getSession().setAttribute("resetPwdUser", resetPwdUser);
		//得到邮箱输入框的邮箱
		String email = ServletActionContext.getRequest().getParameter("email");
		if(email.equals(resetPwdUser.getEmail())){
			//如果邮箱相等，说明邮箱存在
			response.getWriter().print(1);
		}else{
			//如果邮箱不相等，说明邮箱不存在
			response.getWriter().print(2);
		}
		return NONE;
	}
	
	//发送邮件验证码给用户修改密码
	public String sendEmailCode() throws IOException{
		//随机生成验证码
		int emaliCode = (int) (Math.random() * 10000+1);
		//得到用户存在的email
		User user1 = (User) ServletActionContext.getRequest().getSession().getAttribute("resetPwdUser");
		//记住邮箱验证码
		
		user1.setEmailcode(String.valueOf(emaliCode));
		ServletActionContext.getRequest().getSession().setAttribute("emailCode", user1.getEmailcode());
		SendMailCode sendMail = new SendMailCode(user1);
		try {
			sendMail.send(user1);
			ServletActionContext.getResponse().getWriter().print(1);
		} catch (MessagingException e) {
			//ServletActionContext.getRequest().setAttribute("message", "邮件发送失败，后方正在抢修发送邮件的服务器");
			ServletActionContext.getResponse().getWriter().print(2);
			e.printStackTrace();
		}
		return NONE;
	}
	
	//重置用户密码
	public String resetUserPwd() throws IOException{
		User resetPwdUser = userService.checkUserName(user.getUsername());
		//得到邮箱验证码
		String emaliCode = (String) ServletActionContext.getRequest().getSession().getAttribute("emailCode");
		//得到用户的用户输入的邮箱验证码
		String formEmaliCode = user.getEmailcode();
		//再次判断用户的email是否一致
		if(!resetPwdUser.getEmail().equals(user.getEmail())){
			this.addActionMessage("您的邮箱不是注册账号预留的邮箱，操作失败");
			return "toEmail";
		}
		
		if(emaliCode.equals(formEmaliCode)){
			//如果相等，允许修改密码
			resetPwdUser.setPassword(MD5Utils.md5(user.getPassword()));
			userService.updateUserPwd(resetPwdUser);
			this.addActionMessage("重置用户账号密码成功，您可以登录账号体验了!!!");
			return "toEmail";
		}else{
			this.addActionMessage("邮箱验证码错误，重置用户密码失败，请去邮箱查看邮箱验证码");
			return "toEmail";
		}
	}
	
	//用户进行激活的方法
	public String active(){
		//得到点击激活链接的激活码
		String uuidCode = user.getUuidcode();
		//根据激活码查到你唯一的用户
		User active_user = userService.findActiveUser(uuidCode);
		if(active_user != null){
			//如果根据激活码找到用户不为空，说明用户可以激活
			active_user.setUuidcode(null);
			active_user.setState(1);
			userService.updateActiveUser(active_user);
			//this.addActionMessage("恭喜您，账号激活成功。请前去登陆,下一个老司机就是您了");
//			//this.addActionError("恭喜您，账号激活成功。请前去登陆,下一个老司机就是您了");
			ServletActionContext.getRequest().setAttribute("message", "恭喜您，账号激活成功。请前去登录,下一个老司机就是您了");
			return "toEmail";
		}else{
			//如果根据激活码找到用户为空，说明用户已经激活了，此时要告知用户账号已经激活
			ServletActionContext.getRequest().setAttribute("message", "亲，您的账号先前已经激活了，现在无须再激活，请直接登录账号");
			//this.addActionMessage("亲，您的账号先前已经激活了，现在无须再激活，请直接登录账号");
			return "toEmail";
		}
	}
	
	//用户登录方法
	public String login() throws IOException{
		//校验用户登录的密码
		user.setPassword(MD5Utils.md5(user.getPassword()));
		User exitUser = userService.loginUser(user);
		//如果用户不为空，说明账号和密码正确
		if(exitUser != null && exitUser.getState() == 1){
			ServletActionContext.getRequest().getSession().setAttribute("exitUser", exitUser);
			return "toUserMsg";
		}else if(exitUser != null && exitUser.getState() == 0){
			//如果用户的状态为 0 ，说明用户的账号还没激活
			//this.addActionError("不好意思，您的账号还没激活，请点本链接前去邮箱点击激活链接激活");
			ServletActionContext.getRequest().getSession().setAttribute("jihou", "不好意思，您的账号还没激活，请前去邮箱点击激活链接激活");
			return "login";
		}else{
			//如果用户为空，说明账号或者密码错误
			//this.addActionMessage("不好意思，您的账号或者密码有误!!!");
			ServletActionContext.getRequest().getSession().setAttribute("message", "不好意思，您的账号或者密码有误!!!");
			return "login";
		}
	}
	
	//查看用户个人信息toUserMessageUI
	public String getUserMessage(){
		//查看当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		ServletActionContext.getRequest().getSession().setAttribute("exitUser", nowLoginUser);
		return "toUserMsg";
	}
	
	//跳转修改用户信息页面
	public String toUserMessageUI(){
		//查看当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		ServletActionContext.getRequest().getSession().setAttribute("exitUser", nowLoginUser);
		return "toUpdateUserUI";
	}
	
	//修改用户信息
	public String updateUser() throws IOException{
		//修改用户原则,先查找出当前用户,后修改
		System.out.println("要修改用户的id"+user.getUid());
		//查看当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		if(upload != null){
			// 如果上传文件项不为空，则设置路径
			// String path = "E://examOnline_img";
			String path = ServletActionContext.getServletContext().getRealPath(
					"/userHeader/");
			// 得到唯一文件名
			String uuidFileName = UploadUtil.getUuid(uploadFileName);
			//String realPath = UploadUtil.getPath(uuidFileName);//通过调用方法去分离目录
//			String url = path + realPath;
//			String url = path;
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			File file2 = new File(path + "/" + uuidFileName);
			FileUtils.copyFile(upload, file2);
			nowLoginUser.setImagepath("userHeader" + "/" + uuidFileName);
		}
		nowLoginUser.setSchool(user.getSchool());
		nowLoginUser.setEmail(user.getEmail());
		nowLoginUser.setPhone(user.getPhone());
		userService.updateUser(nowLoginUser);
        
       ServletActionContext.getRequest().getSession().setAttribute("message", "修改信息成功，请重新登录!!!可看到修改效果");
		//this.addActionMessage("修改信息成功，请重新登录!!!可看到修改效果");
		return "login";
	}
	//用户退出登录
	public String logout(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("exitUser");
		return "toIndex";
	}
	
	//前往修改用户密码界面
	public String toUpdatePwdUI(){
		return "updateUserPwdUI";
	}
	
	//校验用户的原始密码
	public String checkPwd() throws IOException{
		//查看当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		//得到用户输入的原始密码
		String pastPwd = ServletActionContext.getRequest().getParameter("password");
		//将密码用MD5加密后和当前用户的密码相比
		String md5Pwd = MD5Utils.md5(pastPwd);
		if(md5Pwd.equals(nowLoginUser.getPassword())){
			ServletActionContext.getResponse().getWriter().print(1);
		}else{
			ServletActionContext.getResponse().getWriter().print(2);
		}
		return NONE;
	}
	//修改用户密码
	public String updateUserPwd() throws IOException{
		//查看当前登录的用户
		User nowLoginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		//得到用户新密码输入框的值
		String pwd = ServletActionContext.getRequest().getParameter("newpassword");
		//为用户设置新的密码
		nowLoginUser.setPassword(MD5Utils.md5(pwd));
		int result = userService.updateUserPwd(nowLoginUser);
		if(result > 0 ){
			//返回数据1代表用户输入的原始数据是正确的
			ServletActionContext.getResponse().getWriter().print(1);
		}else{
			//返回数据2代表用户输入的原始数据是正确的
			ServletActionContext.getResponse().getWriter().print(2);
		}
		return NONE;
	}
	
	//用户忘记密码要重置密码的方法
	public String toResetPwd(){
		
		return "login";
	}
	// 用户查看历史成绩
	public String lookPastScore() {
		// 查询当前登录的用户
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		ArrayList<PastScoreBean> pastScoreList = userService.getAllPastScore(user);
		ServletActionContext.getRequest().getSession().setAttribute("pastScoreList", pastScoreList);
		// 当用户第一次登录注册网站时候没有历史成绩，此时要告知用户
		ServletActionContext.getRequest().getSession().setAttribute("size", pastScoreList.size());
		return "toPastScorePage";
	}
}
