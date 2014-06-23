package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.fenye.Result;
import com.zx.kuangjia.po.Comment;

public interface CommentServiceDAO {
	//查询所有的数据
	public List<Comment> getAllComment();
	
	//更新数据
	public void updateComment(Comment comment);
	
	//根据数据ID来获得数据
	public Comment findCommentByCommentId(int CommentId);
	//保存数据
    public void save(Comment comment);
    //删除数据
	public void delete(Integer commentid);
	
	public Result findAllComment(Page page);
	

}
