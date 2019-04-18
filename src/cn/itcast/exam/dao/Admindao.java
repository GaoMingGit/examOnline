package cn.itcast.exam.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.exam.domain.AdminBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;

public interface Admindao {

	//保存试题的方法
	void save(QuestionBean questionBean);

	//得到符合条件的总条数
	int getCount(DetachedCriteria dtc);

	//条件查询得到的结果
	List<QuestionBean> findByPage(DetachedCriteria dtc, Integer begin,Integer pageSize);

	//通过id查找题目
	QuestionBean findUUID(Integer qid);

	//查找所有的带照片的题目
	List<QuestionBean> findByIma(Integer begin, Integer pageSize);

	//得到所有的题目
	List<QuestionBean> getAll(Integer begin, Integer pageSize);

	//拿到所有的题目总数
	Integer getTotalCount();

	//拿到带图片的所有题目的总数
	Integer getImaTotalCount();

	//删除题目
	void delete(QuestionBean questionBean);

	//管理员登录
	AdminBean adminLogin(AdminBean admin);

	//异步请求判断管理员账号是否存在
	AdminBean findAdminByname(String adminname);

	/*//查询所有用户的条数
	Integer getUserTotalCount(DetachedCriteria dtc);

	//带条件查询并分页用户的方法
	List<User> findUserByPage(DetachedCriteria dtc, Integer begin,
			Integer pageSize);*/

}
