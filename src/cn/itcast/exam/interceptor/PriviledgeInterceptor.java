package cn.itcast.exam.interceptor;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import cn.itcast.exam.domain.User;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class PriviledgeInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//判断session中是否存在用户
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("exitUser");
		if(user == null){
			//没有登录
			//给出提示信息
			//跳转登录页面
			ActionSupport action = (ActionSupport) invocation.getAction();
			ServletActionContext.getRequest().getSession().setAttribute("message", "不好意思，您还没登录，没有访问权限!!!");
			action.addActionError("不好意思，您还没登录，没有访问权限!!!");
			return action.LOGIN;
		}else{
			return invocation.invoke();
		}
	}

}
