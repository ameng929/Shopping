<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<%@ page import="com.zx.shopping.client.*" %>
<%@ page import="com.zx.shopping.product.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
ProductMySQLDAO p=new ProductMySQLDAO();
Product d=p.loadById(19);
Cart cart=new Cart();
CartItem c =new CartItem();
c.setProduct(d);
cart.add(c);
session.setAttribute("cart",cart);%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="css/single.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
.STYLE1 {
	color: #0033FF;
	font-weight: bold;
}
.STYLE2 {color: #000000}
.STYLE4 {color: #FF0000}
-->
</style></head>
<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome">
          <p>���ã���ӭ����ˮ�����̳ǣ�</p>
          <p>[<a href="Longinin.jsp">��¼</a>][<a href="Register.jsp">���ע��</a>]</p>
      </div>
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
    	<div class="ttl">���з���</div>
        <ul>
        	<li class="li1">��ҳ</li>
            <li>�ػ�ר��</li>
            <li>����ˮ��</li>
            <li>����ˮ��</li>
            <li>ˮ����Ʒ</li>
            <li>ˮ���ײ�</li>
          <li><a href="#">���߰���</a></li>
        </ul>
    </div>
    <!--//gnb-->
    <!--content-->
    <div id="content">
        <!--content----left-->
        <div id="left">
        	<!--content----left----board-->
        	<div id="board">
            	<div id="ttl">�Ƽ���Ʒ</div>
                <!--content----left----board----thum-->
                <div id="thum">
                	<div id="prod1">
                		<div id="show"><a href="#"><img src="images/nanfeicheng1.jpg" alt="��Ʒ" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">���Ϸǡ��Ϸǳ�</a></p>
                        <span><a href="#">��29.9</a></span><span class="STYLE4">0</span></div>
               	  </div>
                    <div id="prod1">
                		<div id="show"><a href="#"><img src="images/apple1.jpg" alt="��Ʒ" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">���½���������ƻ��</a></p>
                        <span><a href="#">��39.30</a></span></div>
                  	</div>
                    <div id="prod1">
                		<div id="show"><a href="#"><img src="images/qiyiguo1.jpg" alt="��Ʒ" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">�����ڡ������</a></p>
                      <span><a href="#">��28.90</a></span></div>
                  	</div>
                    <div id="prod1">
                		<div id="show"><a href="#"><img src="images/huolongguo1.jpg" alt="��Ʒ" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="#">�������ġ����Ȼ�����</a></p>
                        <p><span><a href="#">��58.00</a></span>
                          </p>                    
                        </p>
                        </div>
                  	</div>
<div id="prod1">
                		<div id="show"><a href="#"><img src="images/AmericaHongti.jpg" alt="��Ʒ" width="54" height="54" /></a></div>
            <div id="itd">
              <p><a href="#">����������������</a></p>
              <span><a href="#">��88.00</a></span></div>
                  	</div>
                   
                </div>
                <!--//content----left----board----thum-->
            </div>
        	<!--//content----left----board-->
        </div>
        <!--//content----left-->
        <!--content----right-->
        <div id="right">
        	<!--content----right----board1-->
            <div id="board1">
            	<div id="ttl1"><span class="STYLE1"><span class="STYLE2">��</span>����<span class="STYLE2">��</span></span>  �ز������㽶</div>
                <div id="pit"><a href="#"><img src="images/banana1.jpg" alt="��Ʒ" width="318" height="318" /></a></div>
<div id="brief_itd1">
                	<div id="size">�۸�<span>220.00</span></div>
                    <div id="size">
                    	��
                    	  <select name="select" id="select" >
                    	    <option>������</option>
                    	    <option>������</option>
                    	    <option>�������߽���</option>
                    	    <option>԰��</option>
                    	    <option>������</option>
                    	    <option>��ɽ��</option>
                          </select>
                    	  ��ݣ�<span>8</span>Ԫ
                    	  <form id="form1" name="form1" method="post" action="">
                    	    <label></label>
                  	    ���۳���<span>0</span>��
                    	  </form>
       	  </div><div>&nbsp;&nbsp;</div></br>
          <div id="size">���ۣ�<img src="images/star.jpg" alt="star" /><span> 5.0</span>�֣�����0�����ۣ�</div>
                    <div id="size">֧����ʽ��<span>ȫ���</span></div>
                    <div id="size">��а�װ��</div>
                    <div id="size">
                   		<div class="text">
                   		  <input type="text" value="��װ" class="txt" />
                   		</div>
                  <div class="text">
                          	<input type="text" value="ɢװ" class="txt" />
                        </div>
                    </div>
                    <div id="size">������</div>
                    <div id="size">
                   		<div class="text1">
                   			<input type="text" value="1" class="txt1" />
                      	</div>
                        �� �����200����
                    </div>
                    <div id="button">
                    <form name="panzi" action="Buy.jsp" method="get">
                    	<div id="btn1">
                    	  <input type="submit" class="btn1" value="��������" />
                    	</div>
                    	</form>
                        <div id="btn1">
                    	  <input type="button" class="btn2" value="���빺�ﳵ" />
                    	</div>

                    </div>
	
                </div>
            </div>
        	<!--//content----right----board1-->
            <!--content----right----board2-->
            <div id="board2">
            	<div id="ttl2">
                	<div class="t2">��Ʒ����</div>
                </div>
                <div id="brief_itd2">
                	<div class="itd1">
                    	<p>��Ʒ���ƣ������ز������㽶</p>
                      <p> ���أ����Ϻ���</p>
                        <p>��Ʒ���ͣ��㽶��</p>
                        <p>��Ʒ��С��3����</p>
                      <p>��Ʒ���������Ա�����</p>
                        <p>ͬ�Ƿ���:ͬ������ͻ�����</p>
                    </div>
                    <div class="itd2">
                        <p>��Ʒ��Ч����������</p>
                  </div>
                </div>
            </div>
            <!--//content----right----board2-->
            <!--content----right----board3-->
         	<div id="board3">
           	<div id="ttl2">
           	  <div class="t2">��������</div>
                </div>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="images/admin.jpg" alt="admin" /></a></dt>
                        <dd><a href="#">���ǳ��û�</a></dd>
                    </dl>
                    <div id="assess">
                    	<span>������2012-12-14 13:14:15</span>
                        <p>��ͬѧ�����������ܺóԣ����Ǻ�ϲ����һ�����������</p>
                  </div>
                </div>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="images/admin.jpg" alt="admin" /></a></dt>
                        <dd><a href="#">���ǳ��û�</a></dd>
                    </dl>
                    <div id="assess">
                    	<span>������2012-12-14 13:14:15</span>
                        <p>��ͬѧ��������������ܺóԣ����Ǻ�ϲ����һ�����������</p>
                    </div>
                </div>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="images/admin.jpg" alt="admin" /></a></dt>
                        <dd><a href="#">���ǳ��û�</a></dd>
                    </dl>
                    <div id="assess">
                    	<span>������2012-12-14 13:14:15</span>
                        <p>��ϲ����һ�����������</p>
                  </div>
                </div>
                <div id="page"><a href="#">��ҳ</a> <a href="#">��һҳ</a> <a href="#">5 </a>/<a href="#"> 10</a> <a href="#">��һҳ</a> <a href="#">ĩҳ</a></div>
          </div>
            <!--//content----right----board3-->
        </div>
        <!--//content----right-->
    </div>
    <!--//content-->
    <!--ads-->
    <div id="ads"></div>
    <!--//ads-->
    <!--bottom-->
    <div id="bottom">
   		<p class="STYLE2">�ĺ����ƹɷ����޹�˾</p>
        <p class="STYLE2">��ϵ�绰��0000-00000000</p>
        <p class="STYLE2">Copyright 2010-2013 Vanvl.com All Rights��ICP֤100557��</p>
  </div>
  <!--//bottom-->
</div>
<!--//wrap-->
</body> 
</html>
