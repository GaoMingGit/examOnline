package cn.itcast.exam.service.impl;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.exam.dao.Examdao;
import cn.itcast.exam.dao.impl.ExamdaoImpl;
import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.ExamService;

@Transactional
public class ExamServiceImpl implements ExamService {

	//注入Examdao
	private Examdao examDao = new ExamdaoImpl();

	public Examdao getExamDao() {
		return examDao;
	}

	public void setExamDao(Examdao examDao) {
		this.examDao = examDao;
	}
	
	//定义科目一或者科目四的练习题目的抽题目方法
		@Override
		public ArrayList<QuestionBean> keMuLianXi(Integer number) {
			return (ArrayList<QuestionBean>) examDao.keMuLianXi(number);
		}

		//根据id去数据库查找对应的题目并以集合形式返回
		@Override
		public ArrayList<QuestionBean> getWrongList(Map<Integer, String> wrongMap) {
			return examDao.getWrongList(wrongMap);
		}
		
		//为当前用户添加历史成绩
		@Override
		public void addPastScore(PastScoreBean pastScoreBean) {
			examDao.addPastScore(pastScoreBean);
		}
		//用户将想要的错题添加到错题集合的方法
		@Override
		public int addWrong(User nowLoginUser, int qid) {
			return examDao.addWrong(nowLoginUser,qid);
			
		}

		//用户查看错题集合的方法
		@Override
		public ArrayList<QuestionBean> lookWrongQuestion(User nowLoginUser) {
			return examDao.lookWrongQuestion(nowLoginUser);
		}
}
