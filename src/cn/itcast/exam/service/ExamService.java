package cn.itcast.exam.service;

import java.util.ArrayList;
import java.util.Map;

import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;

public interface ExamService {

	ArrayList<QuestionBean> keMuLianXi(Integer leiCode);

	void addPastScore(PastScoreBean pastScoreBean);

	ArrayList<QuestionBean> getWrongList(Map<Integer, String> wrongMap);

	ArrayList<QuestionBean> lookWrongQuestion(User nowLoginUser);

	int addWrong(User nowLoginUser, int qid);

}
