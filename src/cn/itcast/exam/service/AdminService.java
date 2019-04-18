package cn.itcast.exam.service;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.exam.domain.AdminBean;
import cn.itcast.exam.domain.PageBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;

public interface AdminService {

	//保存试题的方法
	void save(QuestionBean questionBean);

	//条件chaxun
	PageBean<QuestionBean> find(DetachedCriteria dtc, Integer begin,Integer pageSize);

	QuestionBean findByUUID(Integer qid);

	PageBean<QuestionBean> findByIma(Integer begin, Integer pageSize);

	PageBean<QuestionBean> getAll(Integer begin, Integer pageSize);

	void delete(QuestionBean questionBean);

	//管理员登录
	AdminBean adminLogin(AdminBean admin);

	//异步请求判断管理员账号是否存在
	AdminBean findAdminByname(String adminname);

	//PageBean<User> findUser(DetachedCriteria dtc, Integer currentPage,Integer pageSize);

}
