package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.po.Sjzdfl;

public interface SjzdflDAO {

	public abstract void save(Sjzdfl transientInstance);

	public abstract void delete(Sjzdfl persistentInstance);

	public abstract Sjzdfl findById(java.lang.Integer id);

	public abstract List findByExample(Sjzdfl instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findBySjzdflmc(Object sjzdflmc);

	public abstract List findByQiyong(Object qiyong);

	public abstract List findAll();

	public abstract Sjzdfl merge(Sjzdfl detachedInstance);

	public abstract void attachDirty(Sjzdfl instance);

	public abstract void attachClean(Sjzdfl instance);

}