<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="java.sql.*, com.zx.shopping.order.*,com.zx.shopping.user.*, java.util.*" %>

<%
User u = (User)session.getAttribute("user");
int id=u.getId();
if(u == null) {
	response.sendRedirect("Loginin.jsp");
	return;
}

%>



<%

List<SalesOrder> orders = new OrderMySQLDAO().loadByUId(id);


String statu;
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
    	<div id="ttl">�ҵĶ���</div>
        <!--content----header-->
        <div id="header">
        	<div class="head1">��Ʒ����</div>
            <div class="head2">���ۣ�Ԫ��</div>
            <div class="head2">����</div>
            <div class="head2">ʵ���Ԫ��</div>
            <div class="head2">����״̬</div>
            <div class="head2">���ײ���</div>
        </div>
        <!--//content----header-->
        <!--content----order1-->
        <% //��ʾ���еĶ���
		for(Iterator<SalesOrder> it = orders.iterator(); it.hasNext(); ) {
			SalesOrder so = it.next();
			if(so.getStatus()==0)
			{
			statu="������";
			}
			else
			{
			statu="���׳ɹ�";
			}
			System.out.println(so.getId());
		%>
        <div id="order1">
        	<div id="no">������ţ�<%=so.getId()%> �ɽ�ʱ�䣺<%=so.getODate() %></div>
        	
        <%//�õ����������ÿһ��
        List<SalesItem> items = new OrderMySQLDAO().getSalesItems(so.getId());
        for(Iterator<SalesItem> its = items.iterator(); its.hasNext(); ) {
			SalesItem si = its.next();
		%>
            <div id="prod1">
                <div class="name"><img src="upload/<%=si.getProduct().getId() %>.jpg" alt="pan" width="72" height="58"/><%=si.getProduct().getName() %></div>
                <div class="price">��<%=si.getProduct().getMemberPrice() %></div>
                <div class="amount"><%=si.getCount() %></div>
                <div class="amount">��<%=si.getCount()*si.getProduct().getMemberPrice() %></div>
                <div class="amount"><%=statu %></div>
                <%
                OrderMySQLDAO OM=new OrderMySQLDAO();
                
                if(OM.judge(si)==0){
                
                %>
                <div class="price"><a href="Comment.jsp?oid=<%=si.getOrderId() %>&pid=<%=si.getProduct().getId() %>&siid=<%=si.getId() %>" target="main">׷������</a></div>
            <%}else{ %>
            <div class="price"><a href="#" target="main">������</a></div>
            <%} %>
            </div>
             <%
        }
        %>
        </div>
        
        
         
         <%
        }
        %>
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
        <p>Copyright 2013-2014 ˮ����</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
