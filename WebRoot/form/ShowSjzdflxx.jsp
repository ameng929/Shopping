<%@ page language="java" contentType="text/html; charset=gb2312" 
    pageEncoding="gb2312"%>
   <%@ page import="com.zx.shopping.product.*, java.util.*"%>
<%@taglib  prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ShowSjzdxx</title>
</head>
<%int j=1; %>
<body>
	<form action="updateSjzdxx.action" method="post">
	
	
	<center><img src="image/user.gif"> <font size="2">商品套餐</font></center>
	
	<s:iterator value="#request.allSjzdfl" id="sjzdfl">
	
			<table align="center" border="1"  cellspacing="0">
			<tr bgcolor="#666666" height="27">
				<td align="center"><font color="#FFFFFF" size="2">序号</font></td>
				<td align="center"><font color="#FFFFFF" size="2">启用</font></td>
				<td align="center"><font color="#FFFFFF" size="2">选项内容</font></td>
			</tr>
			<%j++; %>
			<s:iterator value="'#request.allSjzdxx'+j" id="sjzdxx">
				<tr bgcolor="#E3E3E3">
				<td align="center"><s:property value="%{#sjzdxx.sjzzId % 10 != 0 ? #sjzdxx.sjzzId % 10 : #sjzdxx.sjzzId % 10 + 10}"/></td>
				<s:hidden name="sjzzIds" value="%{#sjzdxx.sjzzId}"></s:hidden>
				<td align="center"><input type="checkbox"
				 <s:if test="#sjzdxx.qiyong == 'yes'"> checked="checked" </s:if>
				  name="checks" value='qiyong<s:property value="%{#sjzdxx.sjzzId % 10 != 0 ? #sjzdxx.sjzzId % 10 : #sjzdxx.sjzzId % 10 + 10}"/>'> </td>
				<td align="center">
				
			
				
				
		       <select name="statu" class="form-control" value="">
				<option  selected="selected"><s:property value="#sjzdxx.sjzzxxmc"/></option>
				<%
	             List<Product> products =new ArrayList<Product>();
	             products=new ProductMySQLDAO().getProducts();
	             for (int i = 0; i < products.size(); i++) {
			     Product p = products.get(i);%>
						
			   
            <option value="<%=p.getId()%>-<%=p.getName()%> "><%=p.getName() %></option>
           
						
						
				<% } %>
				</select>
				
				<Input type="text" name="sjzdxxmcs" value='<s:property value="#sjzdxx.sjzzxxmc"/>'>
				</td>
			</tr>
			</s:iterator>
		</table><br>
		
	</s:iterator>
			<center><input type="submit" value="提交"></center>
		</form>
</body>
</html>