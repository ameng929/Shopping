package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.po.Sjzdxx;

public interface SjzdxxDAO {

	public abstract void save(Sjzdxx transientInstance);

	public abstract void delete(Sjzdxx persistentInstance);

	public abstract Sjzdxx findById(java.lang.Integer id);

	public abstract List findByExample(Sjzdxx instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findBySjzzxxmc(Object sjzzxxmc);

	public abstract List findByQiyong(Object qiyong);

	public abstract List findAll();

	public abstract Sjzdxx merge(Sjzdxx detachedInstance);

	public abstract void attachDirty(Sjzdxx instance);

	public abstract void attachClean(Sjzdxx instance);

}