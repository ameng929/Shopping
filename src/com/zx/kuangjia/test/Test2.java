package com.zx.kuangjia.test;

import java.util.List;

import org.hibernate.Transaction;

import com.zx.kuangjia.dao.CommentDAO;
import com.zx.kuangjia.dao.CommentDAOImpl;
import com.zx.kuangjia.po.Comment;
import com.zx.kuangjia.service.CommentServiceDAO;
import com.zx.kuangjia.service.CommentServiceDAOImpl;



public class Test2 {
	public static void main(String[] args) {
		//CommentServiceDAO commentService= new CommentServiceDAOImpl();
		CommentDAO cd=new CommentDAOImpl();
		
		List<Comment> comments = cd.findAll();
		System.out.println(comments.size());
	}
}
