<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.zx.shopping.product.*, com.zx.shopping.user.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
User u1 = new User().loadbyID(id);


String action = request.getParameter("action");
if(action != null && action.equals("modify") ) {
	int status = Integer.parseInt(request.getParameter("statu"));
	u1.setRight(status);
	System.out.println(u1.getRight());
	System.out.println(u1.getUsername());
	System.out.println(u1.getId());
	UserMSQL um = new UserMSQL();
	um.update(u1);
}
%>



<center>
	 权限管理：
	<form name="form" action="setright.jsp" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">
		<select name="statu">
			<option value="0">普通用户</option>
			<option value="1" >超级管理员</option>
			<option value="2" >订单管理员</option>
			<option value="3" >仓库管理员</option>
			<option value="4" >用户管理员</option>
		</select>
		<br>
		<input type="submit" value="提交">
	</form>
</center>


<script type="text/javascript">
	//alert(document.forms("form").status.options.length);
	for(i=0; i<document.forms("form").status.options.length; i++) {

		if(document.forms("form").status.options[i].value == <%=u1.getRight()%>) {
			document.forms("form").status.selectedIndex = i;
		}
		
	}
</script>