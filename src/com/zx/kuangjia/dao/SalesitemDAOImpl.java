package com.zx.kuangjia.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Salesitem;

/**
 * A data access object (DAO) providing persistence and search support for
 * Salesitem entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Salesitem
 * @author MyEclipse Persistence Tools
 */

public class SalesitemDAOImpl extends HibernateDaoSupport implements SalesitemDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SalesitemDAOImpl.class);
	// property constants
	public static final String PRODUCTID = "productid";
	public static final String UNITPRICE = "unitprice";
	public static final String PCOUNT = "pcount";
	public static final String ORDERID = "orderid";
	public static final String JUDGEC = "judgec";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#save(com.zx.kuangjia.po.Salesitem)
	 */
	public void save(Salesitem transientInstance) {
		log.debug("saving Salesitem instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#delete(com.zx.kuangjia.po.Salesitem)
	 */
	public void delete(Salesitem persistentInstance) {
		log.debug("deleting Salesitem instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findById(java.lang.Integer)
	 */
	public Salesitem findById(java.lang.Integer id) {
		log.debug("getting Salesitem instance with id: " + id);
		try {
			Salesitem instance = (Salesitem) getSession().get(
					"com.zx.kuangjia.po.Salesitem", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByExample(com.zx.kuangjia.po.Salesitem)
	 */
	public List findByExample(Salesitem instance) {
		log.debug("finding Salesitem instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Salesitem").add(
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
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Salesitem instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Salesitem as model where model."
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
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByProductid(java.lang.Object)
	 */
	public List findByProductid(Object productid) {
		return findByProperty(PRODUCTID, productid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByUnitprice(java.lang.Object)
	 */
	public List findByUnitprice(Object unitprice) {
		return findByProperty(UNITPRICE, unitprice);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByPcount(java.lang.Object)
	 */
	public List findByPcount(Object pcount) {
		return findByProperty(PCOUNT, pcount);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByOrderid(java.lang.Object)
	 */
	public List findByOrderid(Object orderid) {
		return findByProperty(ORDERID, orderid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findByJudgec(java.lang.Object)
	 */
	public List findByJudgec(Object judgec) {
		return findByProperty(JUDGEC, judgec);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Salesitem instances");
		try {
			String queryString = "from Salesitem";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public List findAll(Page page) {
		log.debug("finding all Salesitem instances");
		try {
			String queryString = "from Salesitem";
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
			log.debug("finding all Salesitem instances");
			try {
				String queryString = "from Salesitem";
				Query queryObject = getSession().createQuery(queryString);
				return queryObject.list().size();
			} catch (RuntimeException re) {
				log.error("find all failed", re);
				throw re;
			}
		}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#merge(com.zx.kuangjia.po.Salesitem)
	 */
	public Salesitem merge(Salesitem detachedInstance) {
		log.debug("merging Salesitem instance");
		try {
			Salesitem result = (Salesitem) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#attachDirty(com.zx.kuangjia.po.Salesitem)
	 */
	public void attachDirty(Salesitem instance) {
		log.debug("attaching dirty Salesitem instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.SalesitemDAO#attachClean(com.zx.kuangjia.po.Salesitem)
	 */
	public void attachClean(Salesitem instance) {
		log.debug("attaching clean Salesitem instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}