package com.zx.kuangjia.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Salesorder;

/**
 * A data access object (DAO) providing persistence and search support for
 * Salesorder entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Salesorder
 * @author MyEclipse Persistence Tools
 */

public class SalesorderDAOImpl extends HibernateDaoSupport implements SalesorderDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SalesorderDAOImpl.class);
	// property constants
	public static final String USERID = "userid";
	public static final String ADDR = "addr";
	public static final String STATUS = "status";
	public static final String PHONE = "phone";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#save(com.zx.kuangjia.po.Salesorder)
	 */
	public void save(Salesorder transientInstance) {
		log.debug("saving Salesorder instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#delete(com.zx.kuangjia.po.Salesorder)
	 */
	public void delete(Salesorder persistentInstance) {
		log.debug("deleting Salesorder instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findById(java.lang.Integer)
	 */
	public Salesorder findById(java.lang.Integer id) {
		log.debug("getting Salesorder instance with id: " + id);
		try {
			Salesorder instance = (Salesorder) getSession().get(
					"com.zx.kuangjia.po.Salesorder", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findByExample(com.zx.kuangjia.po.Salesorder)
	 */
	public List findByExample(Salesorder instance) {
		log.debug("finding Salesorder instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Salesorder").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Salesorder instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Salesorder as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findByUserid(java.lang.Object)
	 */
	public List findByUserid(Object userid) {
		return findByProperty(USERID, userid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findByAddr(java.lang.Object)
	 */
	public List findByAddr(Object addr) {
		return findByProperty(ADDR, addr);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findByStatus(java.lang.Object)
	 */
	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findByPhone(java.lang.Object)
	 */
	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Salesorder instances");
		try {
			String queryString = "from Salesorder";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findAll(Page page) {
		log.debug("finding all Salesorder instances");
		try {
			String queryString = "from Salesorder";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setFirstResult(page.getBeginIndex());
			queryObject.setMaxResults(page.getEveryPage());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public int queryConut() {
		log.debug("finding all Salesorder instances");
		try {
			String queryString = "from Salesorderitem";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list().size();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#merge(com.zx.kuangjia.po.Salesorder)
	 */
	public Salesorder merge(Salesorder detachedInstance) {
		log.debug("merging Salesorder instance");
		try {
			Salesorder result = (Salesorder) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#attachDirty(com.zx.kuangjia.po.Salesorder)
	 */
	public void attachDirty(Salesorder instance) {
		log.debug("attaching dirty Salesorder instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesorderDAO#attachClean(com.zx.kuangjia.po.Salesorder)
	 */
	public void attachClean(Salesorder instance) {
		log.debug("attaching clean Salesorder instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}