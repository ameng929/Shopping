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
import com.zx.kuangjia.po.Collect;

/**
 * A data access object (DAO) providing persistence and search support for
 * Collect entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Collect
 * @author MyEclipse Persistence Tools
 */

public class CollectDAOImpl extends HibernateDaoSupport implements CollectDAO {
	private static final Logger log = LoggerFactory.getLogger(CollectDAOImpl.class);
	// property constants
	public static final String UID = "uid";
	public static final String PID = "pid";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#save(com.zx.kuangjia.po.Collect)
	 */
	public void save(Collect transientInstance) {
		log.debug("saving Collect instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#delete(com.zx.kuangjia.po.Collect)
	 */
	public void delete(Collect persistentInstance) {
		log.debug("deleting Collect instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#findById(java.lang.Integer)
	 */
	public Collect findById(java.lang.Integer id) {
		log.debug("getting Collect instance with id: " + id);
		try {
			Collect instance = (Collect) getSession().get(
					"com.zx.kuangjia.po.Collect", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#findByExample(com.zx.kuangjia.po.Collect)
	 */
	public List findByExample(Collect instance) {
		log.debug("finding Collect instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Collect").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Collect instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Collect as model where model."
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
	 * @see com.zx.kuangjia.dao.CollectDAO#findByUid(java.lang.Object)
	 */
	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#findByPid(java.lang.Object)
	 */
	public List findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Collect instances");
		try {
			String queryString = "from Collect";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#findAll()
	 */
	public List findAll(Page page) {
		log.debug("finding all Collect instances");
		try {
			String queryString = "from Collect";
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
		log.debug("finding all Collect instances");
		try {
			String queryString = "from Collect";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list().size();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#merge(com.zx.kuangjia.po.Collect)
	 */
	public Collect merge(Collect detachedInstance) {
		log.debug("merging Collect instance");
		try {
			Collect result = (Collect) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#attachDirty(com.zx.kuangjia.po.Collect)
	 */
	public void attachDirty(Collect instance) {
		log.debug("attaching dirty Collect instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CollectDAO#attachClean(com.zx.kuangjia.po.Collect)
	 */
	public void attachClean(Collect instance) {
		log.debug("attaching clean Collect instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}