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
import com.zx.kuangjia.po.Product;

/**
 * A data access object (DAO) providing persistence and search support for
 * Product entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Product
 * @author MyEclipse Persistence Tools
 */

public class ProductDAOImpl extends HibernateDaoSupport implements ProductDAO {
	private static final Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);
	// property constants
	public static final String NAME = "name";
	public static final String DESCR = "descr";
	public static final String NORMALPRICE = "normalprice";
	public static final String MEMBERPRICE = "memberprice";
	public static final String CATEGORYID = "categoryid";
	public static final String RECOMMEND = "recommend";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#save(com.zx.kuangjia.po.Product)
	 */
	public void save(Product transientInstance) {
		log.debug("saving Product instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#delete(com.zx.kuangjia.po.Product)
	 */
	public void delete(Product persistentInstance) {
		log.debug("deleting Product instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findById(java.lang.Integer)
	 */
	public Product findById(java.lang.Integer id) {
		log.debug("getting Product instance with id: " + id);
		try {
			Product instance = (Product) getSession().get(
					"com.zx.kuangjia.po.Product", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findByExample(com.zx.kuangjia.po.Product)
	 */
	public List findByExample(Product instance) {
		log.debug("finding Product instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Product").add(Example.create(instance))
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
	 * @see com.zx.kuangjia.dao.ProductDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Product instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Product as model where model."
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
	 * @see com.zx.kuangjia.dao.ProductDAO#findByName(java.lang.Object)
	 */
	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findByDescr(java.lang.Object)
	 */
	public List findByDescr(Object descr) {
		return findByProperty(DESCR, descr);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findByNormalprice(java.lang.Object)
	 */
	public List findByNormalprice(Object normalprice) {
		return findByProperty(NORMALPRICE, normalprice);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findByMemberprice(java.lang.Object)
	 */
	public List findByMemberprice(Object memberprice) {
		return findByProperty(MEMBERPRICE, memberprice);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findByCategoryid(java.lang.Object)
	 */
	public List findByCategoryid(Object categoryid) {
		return findByProperty(CATEGORYID, categoryid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findByRecommend(java.lang.Object)
	 */
	public List findByRecommend(Object recommend) {
		return findByProperty(RECOMMEND, recommend);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Product instances");
		try {
			String queryString = "from Product";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#findAll()
	 */
	 public List findAll(Page page) {
		log.debug("finding all Product instances");
		try {
			String queryString = "from Product";
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
			log.debug("finding all Product instances");
			try {
				String queryString = "from Product";
				Query queryObject = getSession().createQuery(queryString);
				return queryObject.list().size();
			} catch (RuntimeException re) {
				log.error("find all failed", re);
				throw re;
			}
		}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#merge(com.zx.kuangjia.po.Product)
	 */
	public Product merge(Product detachedInstance) {
		log.debug("merging Product instance");
		try {
			Product result = (Product) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#attachDirty(com.zx.kuangjia.po.Product)
	 */
	public void attachDirty(Product instance) {
		log.debug("attaching dirty Product instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.ProductDAO#attachClean(com.zx.kuangjia.po.Product)
	 */
	public void attachClean(Product instance) {
		log.debug("attaching clean Product instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}