<%@ page language="java" import="com.zx.shopping.user.*" pageEncoding="gbk"%>
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
String username=u.getUsername();
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");

if(action != null && action.trim().equals("modifysecret")) {
    String password = request.getParameter("password");
    String password2= request.getParameter("password2");
    String password3= request.getParameter("password3");
    if(u.checkPassword(username,password)){
    
 		if(password2.equals(password3)){
 			u.setPassword(password2);
			u.updatesecret();
			out.println("<script>alert('���ĳɹ�!��ϲ!');</script>");
			response.setHeader("refresh", "0;URL=myorder.jsp");//�����3,����Ҫȷ����ʱ����URL��Ҫ��ת�ĵ�ַ
		}
    }
    else
    out.println("����������벻һ�»��߾���������������������룡");
 }
	
	//response.sendRedirect("ChangePassword.jsp");


	
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
            	<div class="user_box_title"><span>�����޸� </span>&nbsp;&nbsp;<cite>��������</cite></div>
                <form method="post" name="register" action="UpdatePassword.jsp" onSubmit="this.regsubmit.disabled=true;">
                <input type="hidden" name="action" value="modifysecret"/>
                <table class="noborder_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                	<tr>
                    	<td width="100" align="right">
                        	ԭʼ���룺
                        </td>
                        <td>
                            <input class="input_text" name="password"  type="password" >
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	�����룺
                        </td>
                        <td>
                            <input class="input_text" name="password2" type="password" >
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        	ȷ�����룺
                        </td>
                        <td>
                         <input class="input_text" name="password3" type="password" >
                        </td>
                    </tr>
                    <tr>
               	    	<td colspan="2" align="center">
                        	<input "regsubmit" class="buttonStyle" type="submit" value="�ύ" onMouseOver="this.className='buttonStyle_hover'" onMouseOut="this.className='buttonStyle'"/>
                        </td>
                    </tr>
                </table>
                </form>
            
            </div>
        </div>
    </body>
</html>
