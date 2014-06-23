<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import=" com.zx.shopping.order.*, java.util.*" %>
<%@ page import="java.sql.*, com.zx.shopping.order.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id);

String action = request.getParameter("action");
if(action != null && action.equals("modify") ) {
	int status = Integer.parseInt(request.getParameter("status"));
	so.setStatus(status);
	so.updateStatus(); 
}
%>

<%

String statu;
double f=0;
if(so.getStatus()==0)
			{
			statu="������";
			}
			else
			{
			statu="���׳ɹ�";
			}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
        <title>���ݶ�����ˮ���̳�</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css"/>
        <script>
			<!--
				function setTab(m,n){
				var tli=document.getElementById("menu"+m).getElementsByTagName("li");
				var mli=document.getElementById("main"+m).getElementsByTagName("ul");
				for(i=0;i<tli.length;i++){
				   tli[i].className=i==n?"hover":"";
				   mli[i].style.display=i==n?"block":"none";
				}
				}
			//-->
		</script>
    </head>
    <body>
    	<div class="mainDiv">
        	<!-- logo�������� -->
        	<div class="main_top">
            	<div class="main_top_logo"></div>
                <div class="main_top_search">
                	<input class="search_input" type="text" value="" />
                    <input class="search_button" type="button" value="SEARCH" />
                </div>
                <!-- ������� -->
                <div class="clear"></div>
            </div>
            <!-- ����λ�� -->
            <div class="site">
            	����λ�ã�<a class="blue_href" href="#">��ҳ</a> &gt; <a class="blue_href" href="#">�ҵ�ˮ����</a> &gt <b>������ˮ��</b>
            </div>
            <!-- ��ǰ״̬ -->
            <div class="current_state">
            	<div class="current_state_detail">
                    <div class="indent_state">��ǰ����״̬�� <%=statu %></div>
                    <div class="indent_state">����״̬���ģ�<form name="form" action="main.jsp?id=<%=id %>" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">
		<select name="status">
			<option value="0">δ����</option>
			<option value="1" >�Ѵ���</option>
			
		</select>
		<br>
		<input type="submit" value="�ύ">
	</form>
	</div>
                  
                </div>
            </div>
            <!-- ������Ϣ -->
            <div id="tabs0">
                <ul class="menu0" id="menu0">
                   <li onclick="setTab(0,0)" class="hover">������Ϣ</li>
                   <li onclick="setTab(0,1)">�ջ���Ϣ</li>
                </ul>
                <div class="detail_infor" id="main0">
                   <ul class="block">
                       <li>
                       		<b>�����Ϣ</b><br/>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td width="50%">
                                    	<span style="letter-spacing:2em;">��</span>�ƣ�<%=so.getUser().getUsername() %>
                                    </td>
                                    <td>
                                    	��ʵ������<%=so.getUser().getUsername() %>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                    	���ڵ�����<%=so.getUser().getAddr() %>
                                    </td>
                                    <td>
                                    	��ϵ�绰��<%=so.getUser().getPhone() %>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                    	<span style="letter-spacing:2em;">��</span>�䣺<a href="#"><%=so.getUser().getEmail() %></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="#">����վ����</a>
                                    </td>
                                    <td>
                                    	<span style="letter-spacing:0.34em;">֧����</span>��
                                    </td>
                                </tr>
                            </table>
                            <table class="goods_detail" width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td class="goods_detail_tit" width="215">����</td>
                                    <td class="goods_detail_tit">��������</td>
                                    <td class="goods_detail_tit" width="80">״̬</td>
                                    <td class="goods_detail_tit" width="60">����(Ԫ��</td>
                                    <td class="goods_detail_tit" width="60">����</td>
                                    <td class="goods_detail_tit" width="80">��Ա��</td>
                                    <td class="goods_detail_tit" width="85">��Ʒ�ܼ�(Ԫ)</td>
                                    <td class="goods_detail_tit" width="70">�˷�(Ԫ)</td>
                                </tr>
                                <%
									List<SalesItem> items = OrderMgr.getInstance().getSalesItems(so);
									for(int i=0; i<items.size(); i++) {
									SalesItem si = items.get(i);
									f=f+si.getProduct().getMemberPrice();
									
								%>
                                <tr align="center">
                                
                                	<td>
                                    	<div class="goods_pic">
                                        	<a href="../../../single.jsp?id=<%=si.getProduct().getId() %>"><img src="../../upload/<%=si.getProduct().getId() %>.jpg" width="50" height="32" /></a>
                                        </div>
                                        <div class="goods_infor_intro">
                                        	<a href="../../single.jsp?id=<%=si.getProduct().getId() %>"><%=si.getProduct().getName() %></a>
                                        </div>
                                    </td>
                                    <td><%=si.getProduct().getDescr() %></td>
                                    <td><%=statu %></td>
                                    <td><%=si.getProduct().getNormalPrice() %></td>
                                    <td><%=si.getCount() %></td>
                                    <td><%=si.getProduct().getMemberPrice() %></td>
                                    <td><%=si.getUnitPrice() %></td>
                                    <td>20.00<br/>����ݣ�</td>
                                </tr><%} %>
                            </table>
                            
                            <div class="price">
                            	ʵ���<span class="price_style"><%=f %></span>&nbsp;Ԫ
                            </div>
                            <div class="hr"></div>
                            <table class="noborder_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td width="100" align="right">������ţ�</td>
                                    <td><%=so.getId() %></td>
                                </tr>
                            
                                <tr>
                                	<td align="right">�ɽ�ʱ�䣺</td>
                                    <td><%=so.getODate() %></td>
                                </tr>
                            </table>
                       </li>
                   </ul>
                   <ul>
                   		<li>
                        	<table class="border_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td width="100" align="right">�ջ���ַ��</td>
                                    <td><%=so.getAddr() %></td>
                                </tr>
                                <tr>
                                	<td align="right">���ͷ�ʽ��</td>
                                    <td>�ͻ�����</td>
                                </tr>
                                <tr>
                                	<td align="right">�������ƣ�</td>
                                    <td>����ר��������</td>
                                </tr>
                               
                            </table>
                        </li>
                   </ul>
                </div>
            </div>
        </div>
    </body>
</html>
