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
	 Ȩ�޹���
	<form name="form" action="setright.jsp" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">
		<select name="statu">
			<option value="0">��ͨ�û�</option>
			<option value="1" >��������Ա</option>
			<option value="2" >��������Ա</option>
			<option value="3" >�ֿ����Ա</option>
			<option value="4" >�û�����Ա</option>
		</select>
		<br>
		<input type="submit" value="�ύ">
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