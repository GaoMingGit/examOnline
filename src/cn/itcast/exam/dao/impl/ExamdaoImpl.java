package cn.itcast.exam.dao.impl;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.exam.dao.Examdao;
import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.utils.HibernateUtils;

public class ExamdaoImpl extends HibernateDaoSupport implements Examdao {

	// 科目随机抽题目练习
	@Override
	public ArrayList<QuestionBean> keMuLianXi(Integer number) {
		// 随机抽取题目
		Session session = HibernateUtils.openSession();// 获取session
		Transaction transaction = session.beginTransaction();// 开启事务

		String sql = null;
		// 事务代码
		if (number == 1) {
			int i = 1;
			// 科目一的题目类型是:单选题和判断题
			sql = "select * from questions where cid = '1' or cid = '2' order by rand() limit 20";
			// addEntity(QuestionBean.class);作用是将返回值类型指定为QuestionBean对象类型
			Query query = session.createSQLQuery(sql).addEntity(
					QuestionBean.class);
			ArrayList<QuestionBean> list = (ArrayList<QuestionBean>) query.list();
			transaction.commit();// 提交事务
			session.close();// 关闭session
			return list;
		} else {
			// 科目四的题目类型是:单选题、判断题和多选题
			sql = "select * from questions order by rand() limit 20";
			Query query = session.createSQLQuery(sql).addEntity(
					QuestionBean.class);
			ArrayList<QuestionBean> list = (ArrayList<QuestionBean>) query.list();
			transaction.commit();// 提交事务
			session.close();// 关闭session
			return list;
		}
	}

	//得到考试错题的集合
	@Override
	public ArrayList<QuestionBean> getWrongList(Map<Integer, String> wrongMap) {
		ArrayList<QuestionBean> wrongList = new ArrayList<QuestionBean>();
		int number = 1;
		for (Integer qid : wrongMap.keySet()) {
			QuestionBean questionBean = this.getHibernateTemplate().get(QuestionBean.class, qid);
			// 给题目设置顺序题号
			questionBean.setNumber(String.valueOf(number));
			// 给集合添加用户错误的答案
			questionBean.setUserWrongAnswer(wrongMap.get(qid));
			wrongList.add(questionBean);
			number++;
		}
		return wrongList;
	}

	// 为当前用户添加历史成绩
	@Override
	public void addPastScore(PastScoreBean pastScoreBean) {
		Session session = HibernateUtils.openSession();// 获取session
		Transaction transaction = session.beginTransaction();// 开启事务

		String sql = "insert into pastscore values(null,?,?,?,?,?)";

		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, pastScoreBean.getUser().getUid());
		sqlQuery.setParameter(1, pastScoreBean.getScore());
		sqlQuery.setParameter(2, pastScoreBean.getRighttotal());
		sqlQuery.setParameter(3, pastScoreBean.getWrongtotal());
		sqlQuery.setParameter(4, pastScoreBean.getExamtime());
		sqlQuery.executeUpdate();

		transaction.commit();// 提交事务
		session.close();// 关闭session
	}

	// 用户将想要的错题添加到错题集合的方法
	@Override
	public int addWrong(User nowLoginUser, int qid) {
		Session session = HibernateUtils.openSession();// 获取session
		Transaction transaction = session.beginTransaction();// 开启事务

		String sql = "insert into wrongquestion values(null,?,?)";
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.setParameter(0, nowLoginUser.getUid());
		sqlQuery.setParameter(1, qid);
		// 成功更新的结果是1
		int result = sqlQuery.executeUpdate();
		transaction.commit();// 提交事务
		session.close();// 关闭session
		return result;
	}

	// 用户查看错题集合的方法
	@Override
	public ArrayList<QuestionBean> lookWrongQuestion(User nowLoginUser) {
		Session session = HibernateUtils.openSession();// 获取session
		Transaction transaction = session.beginTransaction();// 开启事务

		User user = session.get(User.class, nowLoginUser.getUid());
		Set<QuestionBean> questionBeanSet = user.getQuestionBeanSet();
		ArrayList<QuestionBean> list = new ArrayList<QuestionBean>();
		if (questionBeanSet != null) {
			for (QuestionBean questionBean : questionBeanSet) {
				list.add(questionBean);
			}
			transaction.commit();// 提交事务
			session.close();// 关闭session
			return list;
		} else {
			transaction.commit();// 提交事务
			session.close();// 关闭session
			return null;
		}
	}
}
