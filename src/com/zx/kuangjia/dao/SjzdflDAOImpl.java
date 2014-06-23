package com.zx.kuangjia.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zx.kuangjia.po.Sjzdfl;

/**
 * A data access object (DAO) providing persistence and search support for
 * Sjzdfl entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Sjzdfl
 * @author MyEclipse Persistence Tools
 */

public class SjzdflDAOImpl extends HibernateDaoSupport implements SjzdflDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SjzdflDAOImpl.class);
	// property constants
	public static final String SJZDFLMC = "sjzdflmc";
	public static final String QIYONG = "qiyong";

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdflDAO#save(com.zx.kuangjia.po.Sjzdfl)
	 */
	public void save(Sjzdfl transientInstance) {
		log.debug("saving Sjzdfl instance");
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#delete(com.zx.kuangjia.po.Sjzdfl)
	 */
	public void delete(Sjzdfl persistentInstance) {
		log.debug("deleting Sjzdfl instance");
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#findById(java.lang.Integer)
	 */
	public Sjzdfl findById(java.lang.Integer id) {
		log.debug("getting Sjzdfl instance with id: " + id);
		try {
			Sjzdfl instance = (Sjzdfl) getSession().get(
					"com.zx.kuangjia.po.Sjzdfl", id);
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
	 * com.zx.kuangjia.dao.SjzdflDAO#findByExample(com.zx.kuangjia.po.Sjzdfl)
	 */
	public List findByExample(Sjzdfl instance) {
		log.debug("finding Sjzdfl instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Sjzdfl").add(Example.create(instance))
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#findByProperty(java.lang.String,
	 * java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Sjzdfl instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sjzdfl as model where model."
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#findBySjzdflmc(java.lang.Object)
	 */
	public List findBySjzdflmc(Object sjzdflmc) {
		return findByProperty(SJZDFLMC, sjzdflmc);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdflDAO#findByQiyong(java.lang.Object)
	 */
	public List findByQiyong(Object qiyong) {
		return findByProperty(QIYONG, qiyong);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.zx.kuangjia.dao.SjzdflDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Sjzdfl instances");
		try {
			String queryString = "from Sjzdfl";
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#merge(com.zx.kuangjia.po.Sjzdfl)
	 */
	public Sjzdfl merge(Sjzdfl detachedInstance) {
		log.debug("merging Sjzdfl instance");
		try {
			Sjzdfl result = (Sjzdfl) getSession().merge(detachedInstance);
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#attachDirty(com.zx.kuangjia.po.Sjzdfl)
	 */
	public void attachDirty(Sjzdfl instance) {
		log.debug("attaching dirty Sjzdfl instance");
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
	 * @see com.zx.kuangjia.dao.SjzdflDAO#attachClean(com.zx.kuangjia.po.Sjzdfl)
	 */
	public void attachClean(Sjzdfl instance) {
		log.debug("attaching clean Sjzdfl instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}