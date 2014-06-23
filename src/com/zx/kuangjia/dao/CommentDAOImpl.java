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
import com.zx.kuangjia.po.Comment;

/**
 * A data access object (DAO) providing persistence and search support for
 * Comment entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.zx.kuangjia.po.Comment
 * @author MyEclipse Persistence Tools
 */

public class CommentDAOImpl extends HibernateDaoSupport implements CommentDAO {
	private static final Logger log = LoggerFactory.getLogger(CommentDAOImpl.class);
	// property constants
	public static final String UID = "uid";
	public static final String PID = "pid";
	public static final String COMMENT = "comment";
	public static final String ITEMID = "itemid";

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#save(com.zx.kuangjia.po.Comment)
	 */
	public void save(Comment transientInstance) {
		log.debug("saving Comment instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#delete(com.zx.kuangjia.po.Comment)
	 */
	public void delete(Comment persistentInstance) {
		log.debug("deleting Comment instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findById(java.lang.Integer)
	 */
	public Comment findById(java.lang.Integer id) {
		log.debug("getting Comment instance with id: " + id);
		try {
			Comment instance = (Comment) getSession().get(
					"com.zx.kuangjia.po.Comment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findByExample(com.zx.kuangjia.po.Comment)
	 */
	public List findByExample(Comment instance) {
		log.debug("finding Comment instance by example");
		try {
			List results = getSession().createCriteria(
					"com.zx.kuangjia.po.Comment").add(Example.create(instance))
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
	 * @see com.zx.kuangjia.dao.CommentDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Comment instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comment as model where model."
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
	 * @see com.zx.kuangjia.dao.CommentDAO#findByUid(java.lang.Object)
	 */
	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findByPid(java.lang.Object)
	 */
	public List findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findByComment(java.lang.Object)
	 */
	public List findByComment(Object comment) {
		return findByProperty(COMMENT, comment);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findByItemid(java.lang.Object)
	 */
	public List findByItemid(Object itemid) {
		return findByProperty(ITEMID, itemid);
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findAll()
	 */
	public List findAll() {
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#findAll()
	 */
	public List findAll(Page page) {
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
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
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list().size();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#merge(com.zx.kuangjia.po.Comment)
	 */
	public Comment merge(Comment detachedInstance) {
		log.debug("merging Comment instance");
		try {
			Comment result = (Comment) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#attachDirty(com.zx.kuangjia.po.Comment)
	 */
	public void attachDirty(Comment instance) {
		log.debug("attaching dirty Comment instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.zx.kuangjia.dao.CommentDAO#attachClean(com.zx.kuangjia.po.Comment)
	 */
	public void attachClean(Comment instance) {
		log.debug("attaching clean Comment instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}