<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.product.*"%>
<%@ page import="com.zx.shopping.category.*"%>
<%@ page import="com.zx.shopping.stat.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String action = request.getParameter("action");
int status=2;
if(action != null && action.equals("modify") ) {
	status = Integer.parseInt(request.getParameter("status"));
	
}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>����</title>
<link href="css/category.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">���ã���ӭ����ˮ�����̳ǣ�[��¼][���ע��]</div>
        <div id="phoneno">18036095723</div>
         <form name="simple" action="LikeSearch.jsp" method="get">
        <div id="search">
        
        	<input type="text" size="10" name="keyword" class="t"/>
            <input type="submit" value="����" class="b" />
            
            <div id="circle"></div>
        </div>
        </form>
        <div id="cab"><a href="#this"><img src="images/cab0.png" alt="���ﳵ" /></a></div>
    </div>
	<!--//top-->
    <!--gnb-->
    <div id="gnb">
    	<div class="ttl">��Ʒ����</div>
        <ul>
        	<li class="li1"><a href="Index.jsp"><span>��ҳ</span></a></li>
            <li><a href="#">�ػ�ר��</a></li>
            <li><a href="#">����ˮ��</a></li>
            <li><a href="#">����ˮ��</a></li>
            <li><a href="#">ˮ����Ʒ</a></li>
            <li><a href="#">ˮ���ײ�</a></li>
            <li><a href="#">���߰���</a></li>
        </ul>
    </div>
    <!--//gnb-->
    <!--catlist-->
    <div id="catlist"> 
    	<div id="size"><span>ȫ�����ࣺ�� 11��</span></div>
    
        <div id="size">
        	<ul>
            	<li><span>��װ��</span></li>
            	<li><span><a href="#">ȫ��</a></span></li>
                <li><a href="#">���</a></li>
                <li><a href="#">����</a></li>
                <li><a href="#">�ؼ�</a></li>
            </ul>
        </div>
        <div id="size">
        	<ul>
            	<li><span>����/������</span></li>
            	<li><span><a href="#">ȫ��</a></span></li>
                <li><a href="#">����</a></li>
                <li><a href="#">����</a></li>
            </ul>
        </div>
        <div id="size">
        	<ul>
            	<li><span>�۸�</span></li>
            	<li><span><a href="#">ȫ��</a></span></li>
                <li><a href="#">0-30Ԫ</a></li>
                <li><a href="#">30-60Ԫ</a></li>
                <li><a href="#">60-120Ԫ</a></li>
                <li><a href="#">120-200Ԫ</a></li>
                <li><a href="#">200Ԫ����</a></li>
            </ul>
        </div>
        
    </div>
    <!--//catlist-->
    <!--path-->
    <div id="path">
    
    	����ѡ��
        <select name="status" onchange="window.location.href='More.jsp?status='+this.value;" class="s1">
        	<option value="2" ><span>����������</span></option>	
        	<option value="0" selected="selected">����������</option>
        </select>
        <br>
        </form>
    </div>
    <!--//path-->
    <!--product_gallery-->
    <div id="prodgal">
    <%
    Product pro =new Product();
    ProductMySQLDAO pr =new ProductMySQLDAO();
    if (status==2){
	
        
        	List<ProductStatItem> items = StatService.getProductsBySaleCount();
			for (int i = 0; i < items.size(); i++) {
			ProductStatItem p = items.get(i);
			pro=pr.loadById(p.getProductId());
			
			
		
        
		
 
     %>
      
      <%
       	if((i+1)%5!=0){
      %>
    	<dl>
        	<dt><a href="single.jsp?id=<%=p.getProductId()%>"><img src="upload/<%=p.getProductId()%>.jpg" alt="ˮ��" width="189" height="199"/></a></dt>
            <dd><a href="single.jsp?id=<%=p.getProductId()%>" ><%=p.getProductName()%></a></dd>
            <dd><span><a href="single.jsp?id=<%=p.getProductId()%>">��Ա�ۣ���<%=pro.getMemberPrice() %></a></span></dd>
            <p align="center">��ͨ�ۣ���<%=pro.getNormalPrice() %></p> 
        </dl>
        <%
        }
        else{
         %>
       
       <dl class="dl5">
       		<dt><a href="single.jsp?id=<%=p.getProductId()%>"><img src="upload/<%=p.getProductId()%>.jpg" alt="ˮ��" width="189" height="199"/></a></dt>
            <dd><a href="single.jsp?id=<%=p.getProductId()%>"><%=pro.getName()%></a></dd>
            <dd><span><a href="single.jsp?id=<%=p.getProductId()%>">��Ա�ۣ���<%=pro.getMemberPrice()%></a></span></dd>
                                                                   <p align="center">��ͨ�ۣ���<%=pro.getNormalPrice()%></p> 
        </dl>
          
       <%} %>
     
       <% }%>
       <%
       }
        %>
       
     </div> 
      
    <!--//product_gallery-->
    <!--bottom-->
    <div id="bottom">
   		<p>�ĺ����ƹɷ����޹�˾</p>
        <p>��ϵ�绰��0000-00000000</p>
        <p>Copyright 2010-2013 Vanvl.com All Rights��ICP֤100557��</p>
    </div>
    <!--//bottom-->
</div>
<!--//wrap-->
</body> 
</html>
