<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.sql.*, com.zx.shopping.comment.*,com.zx.shopping.user.*, java.util.*" %>

<%
User u = (User)session.getAttribute("user");
int id=u.getId();
if(u == null) {
	response.sendRedirect("Loginin.jsp");
	return;
}

%>

<%

String action = request.getParameter("cid");
request.setCharacterEncoding("GBK");



if(action != null  ) {
    int cid = Integer.parseInt(action);
   System.out.println("ɾ������"+cid);
     new CommentMySQLDAO().delete(cid);

	
}
%>

<%
List<Comment> comments = new CommentMySQLDAO().loadByUid(id);
//List<Collect> collects = new CollectMySQLDAO().loadByUid(id);
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/myorder.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	
    <!--content-->
    <div id="content">
    	<div id="ttl">�ҵ�����</div>
        <!--content----header-->
        <div id="header">
        	<div class="head1">��Ʒ����</div>
            <div class="head2">��Ա���ۣ�Ԫ��</div>
            <div class="head1">����</div>
            <div class="head2">����</div>
        </div>
        <!--//content----header-->
        <!--content----order1-->
        <% //��ʾ���еĶ���
		for(Iterator<Comment> it = comments.iterator(); it.hasNext(); ) {
			Comment co = it.next();
			Product p =new ProductMySQLDAO().loadById(co.getPid());
			System.out.println("ɾ������"+co.getItemid());
			
		%>
		  <div id="order1">
        	<div id="no">����ʱ�䣺<%=co.getCdate() %></div>
            <div id="prod1">
                <div class="name"><img src="upload/<%=co.getPid()%>.jpg" alt="pan" width="72" height="58"/><%=p.getName() %></div>
                <div class="price">��<%=p.getMemberPrice() %></div>
                <div class="name"><%=co.getComment() %></div>
                <div class="amount"><a href="MyComment.jsp?cid=<%=co.getItemid()%>" >ɾ������</a></div>
                  
            </div>
                  <%
        }
        %>
          
      </div>
       
        
         
         
        <!--//content----order1-->
        
    </div>
	<!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>�������߽���ˮ���̳�</p>
        <p>��ϵ�绰��18036095723</p>
        <p>Copyright 2010-2013 Vanvl.com All Rights��ICP֤100557��</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
