package cn.itcast.exam.service;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.exam.domain.PageBean;
import cn.itcast.exam.domain.User;

public interface AdminServiceDouser {

	PageBean<User> findUser(DetachedCriteria dtc, Integer currentPage,
			Integer pageSize);

}
