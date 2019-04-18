package cn.itcast.exam.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.exam.domain.User;

public interface AdmindaoDouser {

	Integer getUserTotalCount(DetachedCriteria dtc);

	List<User> findUserByPage(DetachedCriteria dtc, Integer begin,
			Integer pageSize);

}
