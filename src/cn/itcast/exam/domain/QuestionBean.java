package cn.itcast.exam.domain;

import java.util.HashSet;
import java.util.Set;

public class QuestionBean {
	private String number;//考试或者练习的题目顺序序号
	private Integer qid;//试题对应数据库的id
	private String question;//试题题目
	private String select_a;//试题选项A内容
	private String select_b;//试题选项B内容
	private String select_c;//试题选项C内容
	private String select_d;//试题选项D内容
	private String imagepath;//试题的图片路径
	private String answer;//试题的正确答案
	private String descc;//试题答案的官方解释
	private String cid;//试题的类型，其中1代表单项选择，2代表判断题，3代表是多选题
	private String addTime;//代表添加管理员添加试题到数据库中的时间
	private String userWrongAnswer;//用户作答错误的答案
	
	//多对多的关系 一个用户可以有多条错题 ，一条错题可以被多个用户拥有
	private Set<User> userSet = new HashSet<User>();

	public Set<User> getUserSet() {
		return userSet;
	}

	public void setUserSet(Set<User> userSet) {
		this.userSet = userSet;
	}
	
	public QuestionBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Integer getQid() {
		return qid;
	}
	public void setQid(Integer qid) {
		this.qid = qid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getSelect_a() {
		return select_a;
	}
	public void setSelect_a(String select_a) {
		this.select_a = select_a;
	}
	public String getSelect_b() {
		return select_b;
	}
	public void setSelect_b(String select_b) {
		this.select_b = select_b;
	}
	public String getSelect_c() {
		return select_c;
	}
	public void setSelect_c(String select_c) {
		this.select_c = select_c;
	}
	public String getSelect_d() {
		return select_d;
	}
	public void setSelect_d(String select_d) {
		this.select_d = select_d;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getDescc() {
		return descc;
	}
	public void setDescc(String descc) {
		this.descc = descc;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public String getUserWrongAnswer() {
		return userWrongAnswer;
	}
	public void setUserWrongAnswer(String userWrongAnswer) {
		this.userWrongAnswer = userWrongAnswer;
	}
	
}
