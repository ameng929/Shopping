package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.fenye.Result;
import com.zx.kuangjia.po.User;


public interface UserService {
	//��ѯ���е�����
	public List<User> getAllUser();
	public User check(String username, String password);
	
	//��������
	public void updateUser(User user);
	
	//��������ID���������
	public User findUserByUserId(int UserId);
	//��������
    public void save(User user);
    //ɾ������
	public void delete(Integer Userid);
	
	public Result findAllUser(Page page);
	
	public Boolean isExit(String name);
}
