<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.client.*, com.zx.shopping.user.*,com.zx.shopping.product.*" %>





<%

Cart c = (Cart)session.getAttribute("cart");
if(c == null) {
	c = new Cart();
	session.setAttribute("cart", c);
}

%>
<%
User u = (User)session.getAttribute("user");
//String addr=u.getAddr();
if(u == null) {
	//response.sendRedirect("Loginin.jsp");
	u=new User();
	String na="�����û�";
	u.setUsername(na);
	u.setRdate(new Date());
	//u.save();
	session.setAttribute("user",u);
	}
	//��Ҫ�ҵ����Ӧ���û�id
	//List<User> ar=new ArrayList<User>();
	//ar=u.getUsers1("�����û�");
	//if(ar.size()>0){
	//Iterator<User> it = ar.iterator(); 
  //  u=it.next();
	//session.setAttribute("user",u);
//	System.out.println("�����û�idΪ"+u.getId());
	
	//return;
//}

%>




<%
request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
if(action != null && action.trim().equals("add")) {
	int id = Integer.parseInt(request.getParameter("id"));
	Product p = ProductMgr.getInstance().loadById(id);
	CartItem ci = new CartItem();
	ci.setProduct(p);
	ci.setCount(1);
	c.add(ci);
}

if(action != null && action.trim().equals("delete")) {
	int id = Integer.parseInt(request.getParameter("id"));
	c.deleteItemById(id);
}

if(action != null && action.trim().equals("update")) {
	for(int i=0; i<c.getItems().size(); i++) {
		CartItem ci = c.getItems().get(i);
		//String pp1=request.getParameter("pp"+ci.getProduct().getId());
		//int pp=Integer.parseInt(pp1);
		///if(pp==ci.getProduct().getId()){
		int count = Integer.parseInt(request.getParameter("p" + ci.getProduct().getId()));
		ci.setCount(count);//}
	}
}
 %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
List<CartItem> items = c.getItems();
String pname;
int count;
double price;
double total;
int pid;
double f=0;
%>



	
	
<%
//����Ϊ���������û���������չ
	//Iterator<CartItem> it = items.iterator();
	//	CartItem ci = it.next();
	//	ci.getProduct().getId();
	//	ci.getProduct().getName();	
		//ci.getProduct().getNormalPrice();
//	double f=ci.getProduct().getNormalPrice()*ci.getCount();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/mycab.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
    	<%if(u.getId()==0){ %><div id="welcome">���ã���ӭ��������ˮ���̳�![<a href="Register.jsp">���ע��</a>]</div>
      <%} else{%>
        <div id="welcome">���ã���ӭ[<a href="UserAccount.jsp"><%=u.getUsername() %></a>]�����̳ǣ�</div>
        <%} %>
        <div id="phoneno">18036095723</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="����" class="b" />
            <div id="circle"></div>
        </div>
        <div id="cab"><a href="#this"><img src="images/cab0.png" alt="���ﳵ" /></a></div>
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
    	<div id="header">
        	<div class="head1">��Ʒ����</div>
            <div class="head2">�۸�</div>
            <div class="head2">����</div>
            <div class="head2">����</div>
        </div>
        <!--content----prod1-->
        <%
	for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
		
		CartItem ci = it.next();
		
			 pid =ci.getProduct().getId(); 
			 pname=ci.getProduct().getName();
			 count=ci.getCount();
			 price=ci.getProduct().getMemberPrice();
			 total=ci.getProduct().getMemberPrice()*ci.getCount();
			 f=total+f;
		
			
		
	
	%>
        <div id="prod1">
        	<div class="name">
            	<a href="#"><img  src="upload/<%=pid %>.jpg" alt="ͼƬ" width="72" height="58"/>�ز�<%=pname %></a>
            </div>
            <div class="price"><%=price%></div>
            <div class="price">
            	<div class="center">
                <form name="<%="ud"+pid %>" action="maycab.jsp" method="get">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="<%="pp"+pid %>" value=""<%=pid %>/>
                	<%=count%>&nbsp;��
                    
                </form>	
              <div class="pd">
                    	<br />&nbsp;
                        
                    </div>
                </div>
            </div>
            <div class="action"><a href="maycab.jsp?action=delete&id=<%=pid %>">ɾ��</a></div>
        </div>
     <%      total=ci.getProduct().getMemberPrice()*ci.getCount();
			 f=total+f;
	
	%>
        
      <%}
	 %>
        <!--//content----prod2-->
        
        <div id="amount">
            <input type="hidden" name="action" value="update"/>
    		<p>�ܼƣ������˷ѣ���<span><%=c.getTotalMemberPrice()%>Ԫ</span><input type="button" value="��������" class="btn" onclick="javascript:location='Index.jsp';"/></p>
         <input type="button" value="����" class="btn" onclick="javascript:location='verify_order.jsp';" />
          
        </div>
    </div>
     
    <!--//content-->
    <!--ads--><!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p>���ݶ�����ˮ���̳�</p>
        <p>��ϵ�绰��0000-00000000</p>
        <p>Copyright 2010-2013 Vanvl.com All Rights��ICP֤100557��</p>
    </div>
    <!--//bottom-->
</div>
<!--//wrap-->
</body> 
</html>
