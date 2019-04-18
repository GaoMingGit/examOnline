package cn.itcast.exam.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.exam.dao.Userdao;
import cn.itcast.exam.domain.PastScoreBean;
import cn.itcast.exam.domain.QuestionBean;
import cn.itcast.exam.domain.User;
import cn.itcast.exam.service.UserService;
@Transactional
public class UserServiceImpl implements UserService {
	private Userdao userDao;

	public void setUserDao(Userdao userDao) {
		this.userDao = userDao;
	}
	
	public Userdao getUserDao() {
		return userDao;
	}


	//异步处理请求，检测用户名是否已经存在
	@Override
	public User checkUserName(String username) {
		return userDao.checkUserName(username);
	}
	//用户注册的方法
	@Override
	public void registUser(User user) {
		userDao.registUser(user);
		
	}

	//用户进行激活的方法
	@Override
	public User findActiveUser(String uuidCode) {
		return userDao.findActiveUser(uuidCode);
	}

	//更改激活后的用户信息
	@Override
	public void updateActiveUser(User active_user) {
		userDao.updateActiveUser(active_user);
	}

	//用户登录的方法
	@Override
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}


	//查询用户的历史成绩
	@Override
	public ArrayList<PastScoreBean> getAllPastScore(User user) {
		return userDao.getAllPastScore(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public User findUser(Integer uid) {
		return userDao.findUser(uid);
	}

	//修改用户密码
	@Override
	public int updateUserPwd(User nowLoginUser) {
		return userDao.updateUserPwd(nowLoginUser);
	}
}
