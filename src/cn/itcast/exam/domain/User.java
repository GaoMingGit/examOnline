package cn.itcast.exam.domain;

import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer uid;//用户的id
	private String username;//用户的账号
	private String password;//用户密码
	private String email;//用户邮箱
	private String school;//用户的报考驾校
	private String phone;//用户的联系电话
	private String registtime;//用户注册的时间
	private Integer state;//用户的状态 其中 0 代表账号没激活，1代表账号激活
	private String uuidcode;//用户的激活码
	private String imagepath;//用户的头像路径
	private String emailcode;//用户修改账号时候的邮箱验证码
	//表示该用户下面所有的错题集  一对多的关系，在一的一方放置多的一方的集合
	private Set<PastScoreBean> pastScoreSet = new HashSet<PastScoreBean>();
	//多对多的关系  一个用户可以有多条错题 ，一条错题可以被多个用户拥有
	private Set<QuestionBean> questionBeanSet = new HashSet<QuestionBean>();
	
	public Set<QuestionBean> getQuestionBeanSet() {
		return questionBeanSet;
	}
	public void setQuestionBeanSet(Set<QuestionBean> questionBeanSet) {
		this.questionBeanSet = questionBeanSet;
	}
	public Set<PastScoreBean> getPastScoreSet() {
		return pastScoreSet;
	}
	public void setPastScoreSet(Set<PastScoreBean> pastScoreSet) {
		this.pastScoreSet = pastScoreSet;
	}
	
	
	public String getEmailcode() {
		return emailcode;
	}
	public void setEmailcode(String emailcode) {
		this.emailcode = emailcode;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getRegisttime() {
		return registtime;
	}
	public void setRegisttime(String registtime) {
		this.registtime = registtime;
	}
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public String getUuidcode() {
		return uuidcode;
	}
	public void setUuidcode(String uuidcode) {
		this.uuidcode = uuidcode;
	}
	
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", email=" + email + ", school=" + school
				+ ", registtime=" + registtime + "]";
	}
	
}
