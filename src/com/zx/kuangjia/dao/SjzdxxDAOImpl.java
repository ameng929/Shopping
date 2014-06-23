package com.zx.kuangjia.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zx.kuangjia.po.Sjzdxx;

/**
 * A data access object (DAO) providing persistence and search support for
 * Sjzdxx entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Sjzdxx
 * @author MyEclipse Persistence Tools
 */

public class SjzdxxDAOImpl extends HibernateDaoSupport implements SjzdxxDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SjzdxxDAOImpl.class);
	// property constants
	public static final String SJZZXXMC = "sjzzxxmc";
	public static final String QIYONG = "qiyong";

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#save(com.zx.kuangjia.po.Sjzdxx)
	 */
	public void save(Sjzdxx transientInstance) {
		log.debug("saving Sjzdxx instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#delete(com.zx.kuangjia.po.Sjzdxx)
	 */
	public void delete(Sjzdxx persistentInstance) {
		log.debug("deleting Sjzdxx instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#findById(java.lang.Integer)
	 */
	public Sjzdxx findById(java.lang.Integer id) {
		log.debug("getting Sjzdxx instance with id: " + id);
		try {
			Sjzdxx instance = (Sjzdxx) getSession().get(
					"com.zx.kuangjia.po.Sjzdxx", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.zx.kuangjia.dao.SjzdxxDAO#findByExample(com.zx.kuangjia.po.Sjzdxx)
	 */
	public List findByExample(Sjzdxx instance) {
		log.debug("finding Sjzdxx instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Sjzdxx").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#findByProperty(java.lang.String,
	 * java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Sjzdxx instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sjzdxx as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#findBySjzzxxmc(java.lang.Object)
	 */
	public List findBySjzzxxmc(Object sjzzxxmc) {
		return findByProperty(SJZZXXMC, sjzzxxmc);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#findByQiyong(java.lang.Object)
	 */
	public List findByQiyong(Object qiyong) {
		return findByProperty(QIYONG, qiyong);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Sjzdxx instances");
		try {
			String queryString = "from Sjzdxx";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#merge(com.zx.kuangjia.po.Sjzdxx)
	 */
	public Sjzdxx merge(Sjzdxx detachedInstance) {
		log.debug("merging Sjzdxx instance");
		try {
			Sjzdxx result = (Sjzdxx) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#attachDirty(com.zx.kuangjia.po.Sjzdxx)
	 */
	public void attachDirty(Sjzdxx instance) {
		log.debug("attaching dirty Sjzdxx instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdxxDAO#attachClean(com.zx.kuangjia.po.Sjzdxx)
	 */
	public void attachClean(Sjzdxx instance) {
		log.debug("attaching clean Sjzdxx instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}