package cn.itcast.exam.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;

public interface UserService {

	//异步处理请求，检测用户名是否已经存在
	User checkUserName(String username);

	//用户注册的方法
	void registUser(User user);
	
	//用户进行激活的方法
	User findActiveUser(String uuidCode);

	//更改激活后的用户信息
	void updateActiveUser(User active_user);

	//用户登录方法
	User loginUser(User user);

	//查询用户的历史成绩
	ArrayList<PastScoreBean> getAllPastScore(User use);


	//修改用户信息
	void updateUser(User user);

	//查询用户
	User findUser(Integer uid);

	//修改用户密码
	int updateUserPwd(User nowLoginUser);

}
