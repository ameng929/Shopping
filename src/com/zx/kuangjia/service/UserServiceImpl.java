package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.dao.UserDAO;
import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.fenye.PageUtil;
import com.zx.kuangjia.fenye.Result;
import com.zx.kuangjia.po.Comment;
import com.zx.kuangjia.po.User;

public class UserServiceImpl implements UserService  {

	private UserDAO userDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public User check(String username, String password) {
		User u=(User) userDAO.findByUsername(username).get(0);
		if(password.equals(u.getPassword())==true)
		return u;
		else{
			u=null;
			return u;
		}
	}

	@Override
	public void delete(Integer Userid) {
		User u =userDAO.findById(Userid);
		userDAO.delete(u);
	}

	@Override
	public Result findAllUser(Page page) {
		page = PageUtil.createPage(page, userDAO.queryConut());
		List<User> user = userDAO.findAll(page);
		Result result = new Result();
		result.setList(user);
		result.setPage(page);
		return result;
	}

	@Override
	public User findUserByUserId(int UserId) {
		return userDAO.findById(UserId);
	}

	@Override
	public List<User> getAllUser() {
		return userDAO.findAll();
	}

	@Override
	public void save(User user) {
		userDAO.save(user);
	}

	@Override
	public void updateUser(User user) {
		userDAO.attachDirty(user);
	}

	@Override
	public Boolean isExit(String name) {
		System.out.println(name);
		User u=(User) userDAO.findByUsername(name).get(0);
		if(u==null){
			return false;
		}

		return true;
	}

}
