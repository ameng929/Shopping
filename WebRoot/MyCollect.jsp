<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.sql.*, com.zx.shopping.collect.*,com.zx.shopping.user.*, java.util.*" %>

<%
User u = (User)session.getAttribute("user");
int id=u.getId();
if(u == null) {
	response.sendRedirect("Loginin.jsp");
	return;
}

%>

<%

String action = request.getParameter("pid");
request.setCharacterEncoding("GBK");



if(action != null  ) {
    int pid = Integer.parseInt(action);
   
     new CollectMySQLDAO().delete(pid);

	
}
%>

<%

List<Collect> collects = new CollectMySQLDAO().loadByUid(id);
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
    	<div id="ttl">�ҵ��ղ�</div>
        <!--content----header-->
        <div id="header">
        	<div class="head1">��Ʒ����</div>
            <div class="head2">��Ա���ۣ�Ԫ��</div>
            <div class="head2">��ͨ�۸�</div>
            <div class="head2">����</div>
        </div>
        <!--//content----header-->
        <!--content----order1-->
        <% //��ʾ���еĶ���
		for(Iterator<Collect> it = collects.iterator(); it.hasNext(); ) {
			Collect co = it.next();
			Product p =new ProductMySQLDAO().loadById(co.getPid());
			co.setProduct(p);
		%>
		  <div id="order1">
        	<div id="no">�ɽ�ʱ�䣺<%=co.getCdate() %></div>
            <div id="prod1">
                <div class="name"><img src="upload/<%=co.getPid()%>.jpg" alt="pan" width="72" height="58"/><%=co.getProduct().getName() %></div>
                <div class="price">��<%=co.getProduct().getMemberPrice() %></div>
                <div class="amount">��<%=co.getProduct().getNormalPrice() %></div>
                <div class="amount"><a href="MyCollect.jsp?pid=<%=co.getPid() %>" >ɾ���ղ�</a></div>
         
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
