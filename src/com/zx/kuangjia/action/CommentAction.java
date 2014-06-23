package com.zx.kuangjia.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.po.Comment;
import com.zx.kuangjia.service.CommentServiceDAO;

public class CommentAction extends ActionSupport {

	private CommentServiceDAO commentServiceDAO;
	
	public CommentServiceDAO getCommentServiceDAO() {
		return commentServiceDAO;
	}

	public void setCommentServiceDAO(CommentServiceDAO commentServiceDAO) {
		this.commentServiceDAO = commentServiceDAO;
	}

	public String execute() throws Exception {
		List<Comment> comments=commentServiceDAO.getAllComment();
		System.out.println(comments.size());
		return this.SUCCESS;
	}

}
