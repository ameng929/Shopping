<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" contentType="text/html;charset=gbk" pageEncoding="GB18030"%>
<%@ page import="com.zx.shopping.product.*"%>

<%
	String keyword = new String(request.getParameter("keyword").getBytes("8859_1"), "GBK");
	
	final int PAGE_SIZE = 20; //ÿҳ��ʾ��������¼
	final int PAGES_PER_TIME = 20;//ÿ����ʾ���ٸ�ҳ������
	int pageNo = 1;
	
	
%>
<%
	List<Product> products = new ArrayList<Product>();
	int totalRecords = ProductMgr.getInstance().find(products, pageNo, PAGE_SIZE, keyword);
	int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

	if (pageNo > totalPages)
		pageNo = totalPages;
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
        <div id="phoneno">400-600-4008</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="����" class="b" />
            <div id="circle"></div>
        </div>
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
        <select name="price" class="s1">
        	<option selected="selected"><span>���۸�����</span></option>	
        </select>
        <select name="price" class="s1">
        	<option selected="selected"><span>����������</span></option>	
        </select>
        <select name="price" class="s1">
        	<option selected="selected"><span>����������</span></option>	
        </select>
    </div>
    <!--//path-->
    <!--product_gallery-->
    <div id="prodgal">
      <% 
        for (int i = 0; i < products.size(); i++) {
			Product p = products.get(i);
		
			
      %>
      <%
       	if((i+1)%5!=0){
      %>
    	<dl>
        	<dt><a href="single.jsp?id=<%=p.getId()%>"><img src="upload/<%=p.getId()%>.jpg" alt="ˮ��" width="189" height="199"/></a></dt>
            <dd><a href="single.jsp?id=<%=p.getId()%>"><%=p.getName()%></a></dd>
            <dd><span><a href="single.jsp?id=<%=p.getId()%>">��Ա�ۣ���<%=p.getMemberPrice()%></a></span></dd>
            <p align="center">��ͨ�ۣ���<%=p.getNormalPrice()%></p> 
        </dl>
        <%
        }
        else{
         %>
       
       <dl class="dl5">
       		<dt><a href="single.jsp?id=<%=p.getId()%>"><img src="upload/<%=p.getId()%>.jpg" alt="ˮ��" width="189" height="199"/></a></dt>
            <dd><a href="single.jsp?id=<%=p.getId()%>"><%=p.getName()%></a></dd>
            <dd><span><a href="single.jsp?id=<%=p.getId()%>">��Ա�ۣ���<%=p.getMemberPrice()%></a></span></dd>
                                                                   <p align="center">��ͨ�ۣ���<%=p.getNormalPrice()%></p> 
        </dl>
          
       <%} %>
     
       <% }%>
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
