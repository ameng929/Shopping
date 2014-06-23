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
import com.zx.kuangjia.po.User;

/**
 * A data access object (DAO) providing persistence and search support for User
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.zx.kuangjia.po.User
 * @author MyEclipse Persistence Tools
 */

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String PHONE = "phone";
	public static final String ADDR = "addr";
	public static final String EMAIL = "email";
	public static final String RIGHT = "right";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#save(com.zx.kuangjia.po.User)
	 */
	public void save(User transientInstance) {
		log.debug("saving User instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#delete(com.zx.kuangjia.po.User)
	 */
	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findById(java.lang.Integer)
	 */
	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) getSession().get("com.zx.kuangjia.po.User",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByExample(com.zx.kuangjia.po.User)
	 */
	public List findByExample(User instance) {
		log.debug("finding User instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.User").add(Example.create(instance))
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
	 * @see com.zx.kuangjia.dao.UserDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding User instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from User as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public void save1(User user) {
		
		try {
			String queryString = "insert into user values (null, ?, ?, ?, ?, ?, ?,?)";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, user.getUsername());
			queryObject.setParameter(1, user.getPassword());
			queryObject.setParameter(2, user.getPhone());
			queryObject.setParameter(3, user.getAddr());
			queryObject.setParameter(4, user.getRdate());
			queryObject.setParameter(0, user.getEmail());
			queryObject.setParameter(0, user.getRight());
			
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByUsername(java.lang.Object)
	 */
	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByPassword(java.lang.Object)
	 */
	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByPhone(java.lang.Object)
	 */
	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByAddr(java.lang.Object)
	 */
	public List findByAddr(Object addr) {
		return findByProperty(ADDR, addr);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByEmail(java.lang.Object)
	 */
	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findByRight(java.lang.Object)
	 */
	public List findByRight(Object right) {
		return findByProperty(RIGHT, right);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll(Page page) {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
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
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list().size();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#merge(com.zx.kuangjia.po.User)
	 */
	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
			User result = (User) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#attachDirty(com.zx.kuangjia.po.User)
	 */
	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.UserDAO#attachClean(com.zx.kuangjia.po.User)
	 */
	public void attachClean(User instance) {
		log.debug("attaching clean User instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}