package com.zx.kuangjia.service;

import java.util.List;


import com.zx.kuangjia.dao.CommentDAO;
import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.fenye.PageUtil;
import com.zx.kuangjia.fenye.Result;
import com.zx.kuangjia.po.Comment;

public class CommentServiceDAOImpl implements CommentServiceDAO {

	private CommentDAO commentDAO;
	

	public CommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	@Override
	public void delete(Integer commentId) {
		Comment comment =this.findCommentByCommentId(commentId);
		commentDAO.delete(comment);

	}

	@Override
	public Result findAllComment(Page page) {
		page = PageUtil.createPage(page, commentDAO.queryConut());
		List<Comment> comment = commentDAO.findAll(page);
		Result result = new Result();
		result.setList(comment);
		result.setPage(page);
		return result;
		
	}

	@Override
	public Comment findCommentByCommentId(int CommentId) {
		return commentDAO.findById(CommentId);
	}

	@Override
	public List<Comment> getAllComment() {
		return commentDAO.findAll();
	}



	@Override
	public void save(Comment comment) {
		commentDAO.save(comment);
		}

	@Override
	public void updateComment(Comment comment) {
		commentDAO.attachDirty(comment);

	}

}
