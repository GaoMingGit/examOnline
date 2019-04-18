package cn.itcast.exam.dao;

import java.util.ArrayList;
import java.util.Map;

import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;

public interface Examdao {

	// 科目随机抽题目练习
	ArrayList<QuestionBean> keMuLianXi(Integer number);

	//得到考试错题的集合
	ArrayList<QuestionBean> getWrongList(Map<Integer, String> wrongMap);

	// 为当前用户添加历史成绩
	void addPastScore(PastScoreBean pastScoreBean);

	// 用户将想要的错题添加到错题集合的方法
	int addWrong(User nowLoginUser, int qid);

	// 用户查看错题集合的方法
	ArrayList<QuestionBean> lookWrongQuestion(User nowLoginUser);

}
