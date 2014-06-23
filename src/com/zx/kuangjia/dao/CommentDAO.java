package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Comment;

public interface CommentDAO {

	public abstract void save(Comment transientInstance);

	public abstract void delete(Comment persistentInstance);

	public abstract Comment findById(java.lang.Integer id);

	public abstract List findByExample(Comment instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByUid(Object uid);

	public abstract List findByPid(Object pid);

	public abstract List findByComment(Object comment);

	public abstract List findByItemid(Object itemid);

	public abstract List findAll();
	public abstract List findAll(Page page);
	public abstract int queryConut();

	public abstract Comment merge(Comment detachedInstance);

	public abstract void attachDirty(Comment instance);

	public abstract void attachClean(Comment instance);

}