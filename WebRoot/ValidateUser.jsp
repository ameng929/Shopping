<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*" %>
<% request.setCharacterEncoding("gbk");
   response.setContentType("text/html;charset=gbk"); %> 
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String code = request.getParameter("code");
String rand = (String) request.getSession().getAttribute("strEnsure"); // 取得生成的验证码

		if (code == null || "".equals(code)) {
		 return;
		}
		else{
			
			if (code.equalsIgnoreCase(rand)==true) {
				try {
						User u = User.check(username, password);
						session.setAttribute("user", u);
					} catch (UserNotFoundException e) {
								out.println(e.getMessage());
								return;
					} catch (PasswordNotCorrectException e) {
								out.println(e.getMessage());
								return;
					}
			}
			else 
			return;
			}
		



String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
response.sendRedirect("Index.jsp");
%>

