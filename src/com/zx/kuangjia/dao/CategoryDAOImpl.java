package com.zx.kuangjia.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Category;

/**
 * A data access object (DAO) providing persistence and search support for
 * Category entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Category
 * @author MyEclipse Persistence Tools
 */

public class CategoryDAOImpl extends HibernateDaoSupport implements CategoryDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CategoryDAOImpl.class);
	// property constants
	public static final String PID = "pid";
	public static final String NAME = "name";
	public static final String DESCR = "descr";
	public static final String CNO = "cno";
	public static final String GRADE = "grade";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#save(com.zx.kuangjia.po.Category)
	 */
	public void save(Category transientInstance) {
		log.debug("saving Category instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#delete(com.zx.kuangjia.po.Category)
	 */
	public void delete(Category persistentInstance) {
		log.debug("deleting Category instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findById(java.lang.Integer)
	 */
	public Category findById(java.lang.Integer id) {
		log.debug("getting Category instance with id: " + id);
		try {
			Category instance = (Category) getSession().get(
					"com.zx.kuangjia.po.Category", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByExample(com.zx.kuangjia.po.Category)
	 */
	public List findByExample(Category instance) {
		log.debug("finding Category instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Category")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Category instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Category as model where model."
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
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByPid(java.lang.Object)
	 */
	public List findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByName(java.lang.Object)
	 */
	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByDescr(java.lang.Object)
	 */
	public List findByDescr(Object descr) {
		return findByProperty(DESCR, descr);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByCno(java.lang.Object)
	 */
	public List findByCno(Object cno) {
		return findByProperty(CNO, cno);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findByGrade(java.lang.Object)
	 */
	public List findByGrade(Object grade) {
		return findByProperty(GRADE, grade);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Category instances");
		try {
			String queryString = "from Category";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#findAll()
	 */
	public List findAll(Page page) {
		log.debug("finding all Category instances");
		try {
			String queryString = "from Category";
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
		log.debug("finding all  CategoryDAO instances");
		try {
			String queryString = "from CategoryDAO";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list().size();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#merge(com.zx.kuangjia.po.Category)
	 */
	public Category merge(Category detachedInstance) {
		log.debug("merging Category instance");
		try {
			Category result = (Category) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#attachDirty(com.zx.kuangjia.po.Category)
	 */
	public void attachDirty(Category instance) {
		log.debug("attaching dirty Category instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CategoryDAO#attachClean(com.zx.kuangjia.po.Category)
	 */
	public void attachClean(Category instance) {
		log.debug("attaching clean Category instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}