package cn.itcast.exam.domain;

public class AdminBean {
	private Integer id;
	private String adminname;
	private String adminpassword;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}
	
	public AdminBean() {
		super();
		
	}
	public AdminBean(String adminname, String adminpassword) {
		this.adminname = adminname;
		this.adminpassword = adminpassword;
	}
}
