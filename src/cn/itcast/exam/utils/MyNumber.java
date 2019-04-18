package cn.itcast.exam.utils;

import java.util.ArrayList;

import cn.itcast.exam.domain.QuestionBean;

public class MyNumber {
	private MyNumber(){};
	public static ArrayList<QuestionBean> toNumber(ArrayList<QuestionBean> list){
		ArrayList<QuestionBean> questionList = new ArrayList<QuestionBean>();
		int i = 1 ; 
		for (QuestionBean questionBean : list) {
			questionBean.setNumber(String.valueOf(i));
			questionList.add(questionBean);
			i++;
		}
		return questionList;
		
	}
}
