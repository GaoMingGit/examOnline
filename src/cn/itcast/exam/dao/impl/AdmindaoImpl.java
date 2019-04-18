package cn.itcast.exam.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.exam.dao.Admindao;
import cn.itcast.exam.domain.AdminBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.utils.HibernateUtils;

public class AdmindaoImpl extends HibernateDaoSupport implements Admindao {

	//管理员登录
	@Override
	public AdminBean adminLogin(AdminBean admin) {
		String hql = "from AdminBean where adminname = ? and adminpassword = ?" ; 
		System.out.println(admin.getAdminname()+"  "+admin.getAdminpassword());
		List<AdminBean> list = (List<AdminBean>) this.getHibernateTemplate().find(hql, new String[]{admin.getAdminname(),admin.getAdminpassword()});
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null ;
		}
	}
	
	
	//保存试题的方法
	@Override
	public void save(QuestionBean questionBean) {
		this.getHibernateTemplate().save(questionBean);
	}

	//得到总数
	@Override
	public int getCount(DetachedCriteria dtc) {
		dtc.setProjection(Projections.rowCount());
		List<Long> count = (List<Long>) this.getHibernateTemplate().findByCriteria(dtc);
		if(count.size() > 0){
			return count.get(0).intValue();
		}
		return 0;
	}

	//得到条件查询的对象集合
	@Override
	public List<QuestionBean> findByPage(DetachedCriteria dtc,Integer begin, Integer pageSize) {
		dtc.setProjection(null);
		List<QuestionBean> list = (List<QuestionBean>) this.getHibernateTemplate().findByCriteria(dtc, begin, pageSize);
		
//		Session session = HibernateUtils.openSession();
//		Transaction tr = session.beginTransaction();
//		String hql = "from QuestionBean order by addTime desc";
//		Query query = session.createQuery(hql);
//		query.setFirstResult(currentPage);
//		query.setMaxResults(pageSize);
//		List<QuestionBean> list =query.list();
		
		
//		Criteria c = session.createCriteria(QuestionBean.class);
//		c.setProjection(null);
////		c.add((Criterion) dtc);
//		c.setFirstResult(currentPage);
//		c.setMaxResults(pageSize);
//		c.addOrder(Order.desc("addTime"));
//		List<QuestionBean> list = c.list();
//		tr.commit();
//		session.close();
		return list;
	}

	//根据qid进行详细查询
	@Override
	public QuestionBean findUUID(Integer qid) {
		return this.getHibernateTemplate().get(QuestionBean.class, qid);
	}


	//统计所有带有图片的题目的总记录数
	@Override
	public Integer getImaTotalCount() {
		String sql = "from QuestionBean where imagepath is not null";
		Session session = HibernateUtils.openSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createQuery(sql);
		List<QuestionBean> list =  query.list();
		tr.commit();
		session.close();
		return list.size();
	}
	
	//查询所有带图片的题目并以集合返回
	@Override
	public List<QuestionBean> findByIma(Integer begin, Integer pageSize) {
		String sql = "from QuestionBean where imagepath is not null";
		Session session = HibernateUtils.openSession();
		Transaction tr = session.beginTransaction();
		Query query = session.createQuery(sql);
		query.setFirstResult(begin);
		query.setMaxResults(pageSize);
		List<QuestionBean> list =  query.list();
		tr.commit();
		session.close();
		return list;
	}

	//得到按题目添加时间从晚到早的顺序排序的集合
	@Override
	public List<QuestionBean> getAll(Integer begin, Integer pageSize) {
		Session session = HibernateUtils.openSession();
		Transaction tr = session.beginTransaction();
		String hql = "from QuestionBean order by addTime desc";
		Query query = session.createQuery(hql);
		query.setFirstResult(begin);
		query.setMaxResults(pageSize);
		List<QuestionBean> list =query.list();
		tr.commit();
		session.close();
		return list;
	}

	//拿到所有的题目总数
	@Override
	public Integer getTotalCount() {
		Session session = HibernateUtils.openSession();
		Transaction tr = session.beginTransaction();
		String hql = "from QuestionBean";
		Query query = session.createQuery(hql);
		List<QuestionBean> list =query.list();
		tr.commit();
		session.close();
		return list.size();
	}

	//删除方法
	@Override
	public void delete(QuestionBean questionBean) {
		this.getHibernateTemplate().delete(questionBean);
		
	}


	//异步请求判断管理员账号是否存在
	@Override
	public AdminBean findAdminByname(String adminname) {
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		String sql = "select * from admintable where adminname = ?";
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, adminname);
		sqlQuery.addEntity(AdminBean.class);
		List<AdminBean> list = sqlQuery.list();
		
		transaction.commit();//提交事务
		
		if(list.size() > 0){
			return list.get(0);
		}
		
		session.close();//关闭session
		return null;
	}

	/*//得到所有用户的总记录数
	@Override
	public Integer getUserTotalCount(DetachedCriteria dtc) {
		dtc.setProjection(Projections.rowCount());
		List<Long> count = (List<Long>) this.getHibernateTemplate().findByCriteria(dtc);
		if(count.size() > 0){
			return count.get(0).intValue();
		}
		return 0;
	}

	//带条件查询并分页用户的方法
	@Override
	public List<User> findUserByPage(DetachedCriteria dtc,
			Integer begin, Integer pageSize) {
		dtc.setProjection(null);
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(dtc, begin, pageSize);
		return list;
	}*/
}
