package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.fenye.Result;
import com.zx.kuangjia.po.User;


public interface UserService {
	//查询所有的数据
	public List<User> getAllUser();
	public User check(String username, String password);
	
	//更新数据
	public void updateUser(User user);
	
	//根据数据ID来获得数据
	public User findUserByUserId(int UserId);
	//保存数据
    public void save(User user);
    //删除数据
	public void delete(Integer Userid);
	
	public Result findAllUser(Page page);
	
	public Boolean isExit(String name);
}
