<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<%@ page import="com.zx.shopping.collect.*" %>
<%@ page import="com.zx.shopping.client.*" %>
<%@ page import="com.zx.shopping.product.*" %>
<%@page import="com.zx.shopping.comment.Comment"%>
<%@page import="com.zx.shopping.comment.CommentMySQLDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%


request.setCharacterEncoding("GBK");
User u = (User)session.getAttribute("user");
String action = request.getParameter("action");
String action1 = request.getParameter("action1");
System.out.println("����"+action1);

if(action != null && action.equals("col") ) {
    int id = Integer.parseInt(request.getParameter("id"));
    
   if(u == null) {
	response.sendRedirect("Loginin.jsp");
	return;
    }
    Collect co =new Collect();
    co.setPid(id);
    co.setUid(u.getId());
    co.setCdate(new Date());
     new CollectMySQLDAO().add(co);

	
}




%>


<%

String strId=request.getParameter("id");
if(strId == null || strId.trim().equals("")){
out.println("��ѡ�����Ʒ�д�");
return;
}
int id = Integer.parseInt(strId);
System.out.println(id);
String name,a,b;
%>

<%
Cart cart = (Cart)session.getAttribute("cart");
if(cart == null) {
	cart = new Cart();
}

%>
<%
ProductMySQLDAO p=new ProductMySQLDAO();
Product d=p.loadById(id);
int count=1;
int count3=0;
String count1=request.getParameter("count");

if(count1!=null){
 count3= Integer.parseInt(count1);}
if(count1==null&&count3!=1){
CartItem c =new CartItem();
c.setProduct(d);
c.setCount(count);
cart.add(c);
session.setAttribute("cart",cart);}%>




<%


if(action1 != null && action1.trim().equals("update")) {
   Cart c1 = (Cart)session.getAttribute("cart");
   count1=request.getParameter("count");
   count = Integer.parseInt(count1);
   System.out.println("����"+count);
   for(int k=1;k<count;k++){
		CartItem c =new CartItem();
        c.setProduct(d);
        c.setCount(count);
        c1.add(c);
    
	}
session.setAttribute("cart",c1);}
 %>




<%
 CommentMySQLDAO CM =new CommentMySQLDAO();
 List<Comment> list=CM.loadByPid(id);
 %>

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
          <p>���ã���ӭ������ˮ�����̳ǣ�[<a href="Register.jsp">���ע��</a>]</p>
         
      </div>
        <div id="phoneno">18036095723</div>
        <div id="search">
        	<input type="text" class="t" />
            <input type="button" value="����" class="b" />
            <div id="circle"></div>
        </div>
        <div id="cab"><a href="maycab.jsp"><img src="images/cab0.png" alt="���ﳵ" /></a></div>
    </div>
	<!--//top-->
    <!--gnb-->
    <div id="gnb">
    	<div class="ttl">���з���</div>
        <ul>
        	<li class="li1"><a href="Index.jsp">��ҳ</a></li>
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
                <%
                   List<Product> products=new ArrayList<Product>();
                   products=ProductMgr.getInstance().getRecommendProducts();                
                 %>
                  <% 
       			 for (int i = 0; i < 5; i++) {
				 Product p1 = products.get(i);
		
			
      			%>
                	<div id="prod1">
                		<div id="show"><a href="single.jsp?id=<%=p1.getId() %>"><img src="upload/<%=p1.getId() %>.jpg" alt="��Ʒ" width="54" height="54" /></a></div>
                      <div id="itd">
                        <p><a href="single.jsp?id=<%=p1.getId() %>">�����ʡ�<%=p1.getName() %></a></p>
                        <span><a href="single.jsp?id=<%=p1.getId() %>">��<%=p1.getMemberPrice() %></a></span><span class="STYLE4">0</span></div>
               	   </div>
                  <%
                  }
                   %>

                   
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
            	<div id="ttl1"><span class="STYLE1"><span class="STYLE2">��</span>����<span class="STYLE2">��</span></span>  �ز�����<%=d.getName() %></div>
                <div id="pit"><a href="#"><img src="upload/<%=id %>.jpg" alt="��Ʒ" width="318" height="318" /></a></div>
<div id="brief_itd1">
                	<div id="size">�۸�<span><%=d.getNormalPrice() %></span></div>
                	<div id="size">��Ա�۸�<span><%=d.getMemberPrice() %></span></div>
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
                    <div id="size">�ײ��Ƽ���</div>
                    <div id="size">
                   		<div class="text">
                   		  <a href="getSjzdflxx.action">�ײ�</a><br/>
                   		</div>
                  <div class="text">
                          	����
                        </div>
                    </div>
                    <div id="size">������</div>
                    <div id="size">
                      <div class="text1">
                      <form name="count" action="single.jsp?id=<%=id %>" method="post">
                      <input type="hidden" name="action1" value="update"/>
                	
                      <input class="txt1"  type="text" size=1 name="count" value="<%=count%>">
                      <a href="javascript:document.count.submit()">
                    </a>
                </form>	
                    
                    
                    </div>
                    
                    
                   		
                        �� �����200����
                    </div>
                    <div id="button">
                    <form name="panzi" action="maycab.jsp?id=<%=id %>" method="get">
                    	<div id="btn1">
                    	  <input type="submit" class="btn1" value="���빺�ﳵ" />
                    	</div>
                    	</form>
                    	<form name="action1" action="single.jsp" method="get">
                    	<input type="hidden" class="btn2" name="action" value="col" />
                    	<input type="hidden" class="btn2" name="id" value="<%=id %>" />
                        <div id="btn1">
                    	  <input type="submit" class="btn2" value="�ղظñ���" />
                    	</div>
                    	</form>
 
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
                    	<p>��Ʒ���ƣ������ز�<%=d.getName() %></p>
                      <p> ��飺<%=d.getDescr() %></p>
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
            <div id="board2">
            <div id="ttl2">
                	<div class="t2">��������</div>
            </div>
            <script type="text/javascript">
function MM_CheckFlashVersion(reqVerStr,msg){
  with(navigator){
    var isIE  = (appVersion.indexOf("MSIE") != -1 && userAgent.indexOf("Opera") == -1);
    var isWin = (appVersion.toLowerCase().indexOf("win") != -1);
    if (!isIE || !isWin){  
      var flashVer = -1;
      if (plugins && plugins.length > 0){
        var desc = plugins["Shockwave Flash"] ? plugins["Shockwave Flash"].description : "";
        desc = plugins["Shockwave Flash 2.0"] ? plugins["Shockwave Flash 2.0"].description : desc;
        if (desc == "") flashVer = -1;
        else{
          var descArr = desc.split(" ");
          var tempArrMajor = descArr[2].split(".");
          var verMajor = tempArrMajor[0];
          var tempArrMinor = (descArr[3] != "") ? descArr[3].split("r") : descArr[4].split("r");
          var verMinor = (tempArrMinor[1] > 0) ? tempArrMinor[1] : 0;
          flashVer =  parseFloat(verMajor + "." + verMinor);
        }
      }
      // WebTV has Flash Player 4 or lower -- too low for video
      else if (userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 4.0;

      var verArr = reqVerStr.split(",");
      var reqVer = parseFloat(verArr[0] + "." + verArr[2]);
  
      if (flashVer < reqVer){
        if (confirm(msg))
          window.location = "http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash";
      }
    }
  } 
}
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<body onload="MM_CheckFlashVersion('8,0,0,0','��ҳ������Ҫʹ�ý��µ� Adobe Flash Player �汾���Ƿ�������������');">
<script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0','width','400','height','220','id','FLVPlayer','src','FLVPlayer_Progressive','flashvars','&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=upload/video&autoPlay=false&autoRewind=false','quality','high','scale','noscale','name','FLVPlayer','salign','lt','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','FLVPlayer_Progressive' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="400" height="220" id="FLVPlayer">
  <param name="movie" value="FLVPlayer_Progressive.swf" />
  <param name="salign" value="lt" />
  <param name="quality" value="high" />
  <param name="scale" value="noscale" />
  <param name="FlashVars" value="&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=upload/video&autoPlay=false&autoRewind=false" />
  <embed src="FLVPlayer_Progressive.swf" flashvars="&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=upload/video&autoPlay=false&autoRewind=false" quality="high" scale="noscale" width="400" height="220" name="FLVPlayer" salign="LT" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" />
</object></noscript>
            </div><br/><br/>
            <br/><br/>
            <div></div>
            <!--content----right----board3-->
            
         	<div id="board3">
           	<div id="ttl2">
           	  <div class="t2">��������</div>
            </div>
                <%
                 
                 for(Iterator<Comment> its = list.iterator(); its.hasNext(); ) {
			     Comment co= its.next();
			     User ua= new User();
                 ua=ua.loadbyID(co.getUid());
			      
                
                 %>
                <div class="b1">
                	<dl>
                    	<dt><a href="#"><img src="upload/head<%=ua.getId()%>.jpg" alt="admin" width="54" height="54"/></a></dt>
                        <dd><a href="#"><%=ua.getUsername() %></a></dd>
                    </dl>
                    <div id="assess">
                    	<span>������<%=co.getCdate() %></span>
                        <p><%=co.getComment() %></p>
                    </div>
                </div>
                <%
                }
                 %>
                
                <div id="page"><a href="Index.jsp">��ҳ</a> <a href="#">��һҳ</a> <a href="#">1 </a>/<a href="#"> 1</a> <a href="#">��һҳ</a> <a href="#">ĩҳ</a></div>
          
            <!--//content----right----board3-->
        
        <!--//content----right-->
    
    <!--//content-->
    </div>

</div>
<!--//wrap-->



</body> 
</html>

