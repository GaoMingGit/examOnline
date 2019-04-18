package cn.itcast.exam.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.exam.dao.Userdao;
import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.utils.HibernateUtils;

public class UserdaoImpl extends HibernateDaoSupport implements Userdao {

	//异步处理请求，检测用户名是否已经存在
	@Override
	public User checkUserName(String username) {
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		String sql = "select * from user where username = ?";
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, username);
		sqlQuery.addEntity(User.class);
		List<User> list = sqlQuery.list();
		
		transaction.commit();//提交事务
		
		if(list.size() > 0){
			return list.get(0);
		}
		
		session.close();//关闭session
		return null;
	}

	//用户注册的方法
	@Override
	public void registUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	//用户激活
	@Override
	public User findActiveUser(String uuidCode) {
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		String sql = "select * from user where uuidcode = ?";
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, uuidCode);
		sqlQuery.addEntity(User.class);
		List<User> list = sqlQuery.list();

		transaction.commit();//提交事务
		session.close();//关闭session
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	//更改激活后的用户信息
	@Override
	public void updateActiveUser(User active_user) {
		this.getHibernateTemplate().update(active_user);
	}

	//用户登录的信息
	@Override
	public User loginUser(User user) {
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		String sql = "select * from user where username= ? and password = ?" ;
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, user.getUsername());
		sqlQuery.setParameter(1, user.getPassword());
		sqlQuery.addEntity(User.class);
		List<User> list = sqlQuery.list();
		
		transaction.commit();//提交事务
		session.close();//关闭session
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	
	//查询用户的历史成绩
	@Override
	public ArrayList<PastScoreBean> getAllPastScore(User user) {
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		User getPastScoreUser = session.get(User.class, user.getUid());
		//根据用户拿到用户的历史成绩的set集合
		Set<PastScoreBean> pastScoreSet = getPastScoreUser.getPastScoreSet();
		//定义一个新集合用来装用户最近10条的考试成绩记录
		ArrayList<PastScoreBean> newList = new ArrayList<PastScoreBean>();
		ArrayList<PastScoreBean> newList2 = new ArrayList<PastScoreBean>();
		for (PastScoreBean pastScoreBean : pastScoreSet) {
			System.out.println("pastScoreSet"+pastScoreBean.getExamtime());
			newList.add(pastScoreBean);
		}
		for(int index = newList.size();index > 0 ;index --){
			//逆序添加给newList2，目的是让考试时间在后成绩排列在前
			System.out.println("newList"+newList.get(index-1).getExamtime());
			newList2.add(newList.get(index-1));
		}
		for (PastScoreBean pastScoreBean : newList2) {
			System.out.println(pastScoreBean.getExamtime());
		}
		transaction.commit();//提交事务
		session.close();//关闭session
		return newList2;
	}

	//修改用户的信息
	@Override
	public void updateUser(User user) {
		this.getHibernateTemplate().update(user);
	}

	@Override
	public User findUser(Integer uid) {
		
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		User user = session.get(User.class, uid);
		transaction.commit();//提交事务
		session.close();//关闭session
		return user;
	}

	//修改用户密码
	@Override
	public int updateUserPwd(User nowLoginUser) {
		
		//this.getHibernateTemplate().update(nowLoginUser);
		
		Session session = HibernateUtils.openSession();//获取session
		Transaction transaction = session.beginTransaction();//开启事务
		
		String sql = "update user set password = ? where uid = ?" ;
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, nowLoginUser.getPassword());
		sqlQuery.setParameter(1, nowLoginUser.getUid());
		int result = sqlQuery.executeUpdate();
		transaction.commit();//提交事务
		session.close();//关闭session
		return result;
	}
}
