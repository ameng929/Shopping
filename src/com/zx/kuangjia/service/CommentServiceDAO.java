package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.fenye.Result;
import com.zx.kuangjia.po.Comment;

public interface CommentServiceDAO {
	//��ѯ���е�����
	public List<Comment> getAllComment();
	
	//��������
	public void updateComment(Comment comment);
	
	//��������ID���������
	public Comment findCommentByCommentId(int CommentId);
	//��������
    public void save(Comment comment);
    //ɾ������
	public void delete(Integer commentid);
	
	public Result findAllComment(Page page);
	

}
