package cn.itcast.exam.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.exam.dao.AdmindaoDouser;
import cn.itcast.exam.domain.User;

public class AdmindaoDouserImpl extends HibernateDaoSupport implements AdmindaoDouser {

	@Override
	public Integer getUserTotalCount(DetachedCriteria dtc) {
		dtc.setProjection(Projections.rowCount());
		List<Long> count = (List<Long>) this.getHibernateTemplate().findByCriteria(dtc);
		if(count.size() > 0){
			return count.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<User> findUserByPage(DetachedCriteria dtc, Integer begin,
			Integer pageSize) {
		dtc.setProjection(null);
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(dtc, begin, pageSize);
		return list;
	}

}
