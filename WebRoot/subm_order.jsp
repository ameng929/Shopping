<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=GBK"
	import="com.zx.shopping.user.*,com.zx.shopping.client.*,com.zx.shopping.order.*,java.util.*"
	pageEncoding="GBK"%>


<%
	request.setCharacterEncoding("GBK");

	User u = (User) session.getAttribute("user");
	if (u == null) {
		response.sendRedirect("UserLogin.jsp");
		return;
	}

	Cart c = (Cart) session.getAttribute("cart");
	if (c == null) {
		c = new Cart();
		session.setAttribute("cart", c);
	}
	System.out.println(c.getTotalMemberPrice());

	//String addr = request.getParameter("addr");
	//u.setAddr(addr);

	int orderId = u.buy(c); 

	//session.removeAttribute("cart");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/subm_order.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
.STYLE1 {color: #FF0000}
.STYLE4 {color: #0033FF}
-->
</style></head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">
           <%if(u.getId()==0){ %> <p>���ã���ӭ����ˮ�����̳ǣ�[<a href="Register.jsp">���ע��</a>]</p> 
      <%} else{%> 
          <p>���ã���ӭ[<a href="UserAccount.jsp"><%=u.getUsername() %></a>]����ˮ�����̳ǣ�</p>
          <%} %>
        </div>
      <div id="phoneno">400-600-4008</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="����" class="b" />
            <div id="circle"></div>
        </div>
        <div id="cab"><a href="maycab.jsp"><img src="images/cab0.png" alt="���ﳵ" /></a></div>
    </div>
	<!--//top-->
    <!--path-->
   	<div id="path">
    	<div class="path1">1���ҵĹ��ﳵ</div>
        <div class="path2">2��ȷ�϶�����Ϣ</div>
        <div class="path3">3���ɹ��ύ����</div>
    </div>
    <!--//path-->
    <!--content-->
    <div id="content">
    	<div id="head">����<span class="STYLE4">������! ����:
<%=orderId%></span>���ύ��<a href="currentmyorder.jsp">�鿴����״̬</a></div>
      <p>&nbsp;</p>
        <div id="head">����<span class="STYLE4">������! ����:
<%=orderId%></span>�����ɣ�����<span class="STYLE1">������</span>������<a href="Index.jsp">���������Ʒ</a></div>
      <div id="warn">*�������ڡ�<a href="myorder.jsp">�ҵĶ���</a>���в鿴��ȡ�����Ķ���������ϵͳ��Ҫ����ԤԼ���������ܲ���������ѯ�����ύ�Ķ�����</div>
    </div>
    <%
    if(u.getId()==0){session.removeAttribute("user"); 
     session.invalidate();} %>
    <!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		
        <p>��ϵ�绰��18036095723</p>
        <p>Copyright 2013-2014 ���ݶ�����ˮ���̳�</p>
    </div>

</div>
<!--//wrap-->
</body> 
</html>
