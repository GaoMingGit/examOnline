package cn.itcast.exam.action;


import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import cn.itcast.exam.domain.PageBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.AdminServiceDouser;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction_doUser extends ActionSupport implements
		ModelDriven<User> {
	private User user = new User();

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	// 提供当前页、每页显示条数的属性
	private Integer currentPage = 1;
	private Integer pageSize = 5;

	public void setCurrentPage(Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		this.currentPage = currentPage;
	}

	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 5;
		}
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	// 注入AdminService
	private AdminServiceDouser adminServiceDouser;

	public AdminServiceDouser getAdminServiceDouser() {
		return adminServiceDouser;
	}

	public void setAdminServiceDouser(AdminServiceDouser adminServiceDouser) {
		this.adminServiceDouser = adminServiceDouser;
	}

	// 查看所有用户列表
	public String findAllUser() {
		System.out.println("执行查询所有用户的方法");
		DetachedCriteria dtc = DetachedCriteria.forClass(User.class);
		// 如果查询用户的id账号不为空
		
		if (user.getUid() != null) {
			dtc.add(Restrictions.eq("uid", user.getUid()));
		}
		//如果查询用户的账号不为空
		if(user.getUsername() != null){
			dtc.add(Restrictions.like("username", "%"+user.getUsername()+"%"));
		}
		//如果查询用户的状态下拉列表不为空
		if(user.getState() != null){
			dtc.add(Restrictions.eq("state", user.getState()));
		}
		System.out.println("用户账号id："+user.getUid()+" 账号:"+user.getUsername()+"  用户账号状态:"+user.getState());
		PageBean<User> pageBean = adminServiceDouser.findUser(dtc, currentPage,
				pageSize);
		ServletActionContext.getRequest().getSession()
				.setAttribute("pageBean", pageBean);
		return "toUserList";
	}

}
