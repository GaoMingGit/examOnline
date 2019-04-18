package cn.itcast.exam.domain;

import java.util.HashSet;
import java.util.Set;

public class PastScoreBean {
	private Integer pid;//历史成绩的id
	private Integer score;//一次考试的总分数
	private Integer righttotal;//一次考试做对题目的数目
	private Integer wrongtotal;//一次考试做错题目的数目
	private String examtime;//考试时间
	
	//一对多，在多的一方放置一的对象
	private User user;//考试成绩所属的用户对象
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getRighttotal() {
		return righttotal;
	}
	public void setRighttotal(Integer righttotal) {
		this.righttotal = righttotal;
	}
	public Integer getWrongtotal() {
		return wrongtotal;
	}
	public void setWrongtotal(Integer wrongtotal) {
		this.wrongtotal = wrongtotal;
	}
	public String getExamtime() {
		return examtime;
	}
	public void setExamtime(String examtime) {
		this.examtime = examtime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
