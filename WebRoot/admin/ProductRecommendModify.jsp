<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.zx.shopping.product.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
Product p = new ProductMySQLDAO().loadById(id);

String action = request.getParameter("action");
if(action != null && action.equals("modify") ) {
	int status = Integer.parseInt(request.getParameter("statu"));
	p.setRecommend(status);
	System.out.println(p.getRecommend());
	ProductMySQLDAO pm=new ProductMySQLDAO();
	pm.updateStatus(p) ;
}
%>



<center>
	推荐宝贝：<%=p.getName() %>
	<form name="form" action="ProductRecommendModify.jsp" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=id %>">
		<select name="statu">
			<option value="1">推荐</option>
			<option value="0" >不推荐</option>
		</select>
		<br>
		<input type="submit" value="提交">
	</form>
</center>


<script type="text/javascript">
	//alert(document.forms("form").status.options.length);
	for(i=0; i<document.forms("form").status.options.length; i++) {

		if(document.forms("form").status.options[i].value == <%=p.getRecommend()%>) {
			document.forms("form").status.selectedIndex = i;
		}
		
	}
</script>