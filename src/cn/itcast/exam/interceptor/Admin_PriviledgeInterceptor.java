package cn.itcast.exam.interceptor;

import org.apache.struts2.ServletActionContext;

import cn.itcast.exam.domain.AdminBean;
import cn.itcast.exam.domain.User;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class Admin_PriviledgeInterceptor extends MethodFilterInterceptor {
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//判断session中是否存在用户
		AdminBean admin = (AdminBean)ServletActionContext.getRequest().getSession().getAttribute("exitAdmin");
		if(admin == null){
			//没有登录
			//给出提示信息
			//跳转登录页面
			ActionSupport action = (ActionSupport) invocation.getAction();
			ServletActionContext.getRequest().getSession().setAttribute("message1", "不好意思，您还没登录，没有访问权限!!!");
			//action.addActionMessage("不好意思，您没有访问权限!!!请用管理员账号登录!!!");
			return action.LOGIN;
		}else{
			return invocation.invoke();
		}
	}

}
