package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.User;

public interface UserDAO {

	public abstract void save(User transientInstance);

	public abstract void delete(User persistentInstance);

	public abstract User findById(java.lang.Integer id);

	public abstract List findByExample(User instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByUsername(Object username);

	public abstract List findByPassword(Object password);

	public abstract List findByPhone(Object phone);

	public abstract List findByAddr(Object addr);

	public abstract List findByEmail(Object email);

	public abstract List findByRight(Object right);

	public abstract List findAll();
	
	public abstract List findAll(Page page);
	
	public abstract int queryConut();

	public abstract User merge(User detachedInstance);

	public abstract void attachDirty(User instance);

	public abstract void attachClean(User instance);
	
	public abstract void save1(User user);

}