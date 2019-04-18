package cn.itcast.exam.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import cn.itcast.exam.domain.QuestionBean;

public class CheckAnswer {
	
	private CheckAnswer(){}

	public static Double getScore(String[] user_answer,ArrayList<QuestionBean> list) {
		String userAnswer = "";//定义变量用来表示当前某一道题目的用户答案
		String sqlAnswer = "";//定义变量用来表示当前的某一道题目的数据库正确的答案
		int index = 0;//定义集合的index
		Double score = (double) 0 ; //定义总分变量并初始化为 0 ；
		Double i = Math.ceil(100 / list.size()); //定义每一道题目的分值，总分为100分，将总分除以当前题目总量，变得每一道题目的平均分值
		for (String string : user_answer) {
			userAnswer = string;
			sqlAnswer = list.get(index).getAnswer();
			if(userAnswer.equals(sqlAnswer)){
				//如果答案一样就加分数
				score = score + i;
			}
			userAnswer = "";
			index++;
		}
		return score;
	}

	public static Map<Integer, String> getWrongMap(String[] user_answer,ArrayList<QuestionBean> list) {
		Map<Integer,String> wrongMap = new HashMap<Integer,String>();
		String userAnswer = "";//定义变量用来表示当前某一道题目的用户答案
		String sqlAnswer = "";//定义变量用来表示当前的某一道题目的数据库正确的答案
		int index = 0;//定义集合的index
		for (String string : user_answer) {
			userAnswer = string;
			sqlAnswer = list.get(index).getAnswer();
			if(userAnswer == null){
				//如果用户的答案为空，则表明用户没有答这道题目，直接把题号添加到Map集合中 其中 key值是题目的id ， value 值是用户的答案
				wrongMap.put(list.get(index).getQid(), userAnswer);
				System.out.print("答错题号是:"+list.get(index).getQid()+":  ");
				System.out.println("用户答案是:"+userAnswer);
			}else if(!userAnswer.equals(sqlAnswer)){
				wrongMap.put(list.get(index).getQid(), userAnswer);
				System.out.print("答错题号是:"+list.get(index).getQid()+":  ");
				System.out.println("用户答案是:"+userAnswer);
			}
			
		}
		return wrongMap;
	};
}
