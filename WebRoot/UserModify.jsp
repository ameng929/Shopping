<%@ page language="java" import="com.zx.shopping.user.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>

<%
//���session���鿴�û��Ƿ��½
User u = (User)session.getAttribute("user");
if(u == null) {
	response.sendRedirect("Index.jsp");
	return;
}
 %>

<%

request.setCharacterEncoding("GBK");
String action = request.getParameter("action");

if(action != null && action.trim().equals("modify")) {
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);
	u.update();
	out.println("���ĳɹ�!��ϲ!");
	return;
}
 %>
<DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
        <title>���ݶ�����ˮ���̳ǻ�Ա��Ϣ�޸�</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css"/>
	</head>
    <body>
    	<div class="user">
        	<div class="user_box">
            	<div class="user_box_title"><span>�û���Ϣ�޸�</span>&nbsp;&nbsp;<cite>Personal Information</cite></div>
                <form method="post" name="register" action="UserModify.jsp" onSubmit="this.regsubmit.disabled=true;">
                <input type="hidden" name="action" value="modify"/>
                <table class="noborder_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                	<tr>
                    	<td width="100" align="right">
                        	�û�����
                        </td>
                        <td>
                            <input class="input_text" name="username"  type="text" readonly value="<%=u.getUsername()%>">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	��ϵ�绰��
                        </td>
                        <td>
                            <input class="input_text" name="phone" type="text" id="phone"  value="<%=u.getPhone()%>">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	�ͻ���ַ��
                        </td>
                        <td>
                         <textarea class="input_text" name="addr" style="width:100%;height:60px;overflow:auto;"><%=u.getAddr()%></textarea>
                        </td>
                    </tr>
                    <tr>
               	    	<td colspan="2" align="center">
                        	<input "regsubmit" class="buttonStyle" type="submit" value="����" onMouseOver="this.className='buttonStyle_hover'" onMouseOut="this.className='buttonStyle'"/>
                        </td>
                    </tr>
                </table>
                </form>
            
            </div>
        </div>
    </body>
</html>
