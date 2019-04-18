package cn.itcast.exam.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.exam.dao.Admindao;
import cn.itcast.exam.domain.AdminBean;
import cn.itcast.exam.domain.PageBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.AdminService;
@Transactional
public class AdminServiceImpl implements AdminService {
	//注入adminDao
	private Admindao adminDao;
	
	public void setAdminDao(Admindao adminDao) {
		this.adminDao = adminDao;
	}

	//保存试题的方法
	@Override
	public void save(QuestionBean questionBean) {
		System.out.println("service方法执行了");
		adminDao.save(questionBean);
	}

	//条件查询
	@Override
	public PageBean<QuestionBean> find(DetachedCriteria dtc,Integer currentPage, Integer pageSize) {
		PageBean<QuestionBean> pageBean = new PageBean<QuestionBean>();
		//设置当前页
		pageBean.setCurrentPage(currentPage);
		//设置每页显示的大小
		pageBean.setPageSize(pageSize);
		Integer totalCount = adminDao.getCount(dtc);
		//设置总数目
		pageBean.setTotalCount(totalCount);
		Double tc = totalCount.doubleValue();
		Double totalPage = Math.ceil(tc / pageSize);
		//设置总页数
		pageBean.setTotalPage(totalPage.intValue());
		//设置符合条件查询的集合对象
		//封装每一页的数据
		Integer begin = (currentPage - 1) * pageSize;
		List<QuestionBean> list = adminDao.findByPage(dtc,begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	//根据qid进行详细查询
	@Override
	public QuestionBean findByUUID(Integer qid) {
		return adminDao.findUUID(qid);
	}

	@Override
	public PageBean<QuestionBean> findByIma(Integer currentPage,Integer pageSize) {
		PageBean<QuestionBean> pageBean = new PageBean<QuestionBean>();
		//设置当前页
		pageBean.setCurrentPage(currentPage);
		//设置每页显示的大小
		pageBean.setPageSize(pageSize);
		
		Integer totalCount = adminDao.getImaTotalCount();
		System.out.println("查到图片的题目数量是:"+totalCount);
		//设置总数目
		pageBean.setTotalCount(totalCount);
		Double tc = totalCount.doubleValue();
		Double totalPage = Math.ceil(tc / pageSize);
		//设置总页数
		pageBean.setTotalPage(totalPage.intValue());
		Integer begin = (currentPage - 1) * pageSize;
		//设置符合条件查询的集合对象
		List<QuestionBean> list = adminDao.findByIma(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<QuestionBean> getAll(Integer currentPage, Integer pageSize) {
		PageBean<QuestionBean> pageBean = new PageBean<QuestionBean>();
		//设置当前页
		pageBean.setCurrentPage(currentPage);
		
		Integer totalCount = adminDao.getTotalCount();
		System.out.println("查到题目总数量是:"+totalCount);
		//设置每页显示的大小
		pageBean.setPageSize(pageSize);
		//设置总数目
		pageBean.setTotalCount(totalCount);
		Double tc = totalCount.doubleValue();
		Double totalPage = Math.ceil(tc / pageSize);
		//设置总页数
		pageBean.setTotalPage(totalPage.intValue());
		//设置符合条件查询的集合对象
		Integer begin = (currentPage - 1) * pageSize;
		List<QuestionBean> list = adminDao.getAll(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void delete(QuestionBean questionBean) {
		adminDao.delete(questionBean);
		
	}

	//管理员登录
	@Override
	public AdminBean adminLogin(AdminBean admin) {
		return adminDao.adminLogin(admin);
	}

	//异步请求判断管理员账号是否存在
	@Override
	public AdminBean findAdminByname(String adminname) {
		// TODO Auto-generated method stub
		return adminDao.findAdminByname(adminname);
	}

	/*@Override
	public PageBean<User> findUser(DetachedCriteria dtc, Integer currentPage,
			Integer pageSize) {
		PageBean<User> pageBean = new PageBean<User>();
		//设置当前页
		pageBean.setCurrentPage(currentPage);
		
		Integer totalCount = adminDao.getUserTotalCount(dtc);
		System.out.println("查到题目总数量是:"+totalCount);
		//设置总数目
		pageBean.setTotalCount(totalCount);
		Double tc = totalCount.doubleValue();
		Double totalPage = Math.ceil(tc / pageSize);
		// 设置总页数
		pageBean.setTotalPage(totalPage.intValue());
		// 设置符合条件查询的集合对象
		// 封装每一页的数据
		Integer begin = (currentPage - 1) * pageSize;
		List<User> list = adminDao.findUserByPage(dtc, begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}*/
}
