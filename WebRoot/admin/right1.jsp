<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*"%>
<%


request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
String rightrole="";
if(action != null && action.equals("modify") ) {
    int id = Integer.parseInt(request.getParameter("id"));
    User u1 = new User().loadbyID(id);

	int status = Integer.parseInt(request.getParameter("statu"));
	u1.setRight(status);
	System.out.println(u1.getRight());
	System.out.println(u1.getUsername());
	System.out.println(u1.getId());
	UserMSQL um = new UserMSQL();
	um.update(u1);
}
%>


<%
	
	final int PAGE_SIZE = 5; //每页显示多少条记录
	final int PAGES_PER_TIME = 10;//每次显示多少个页码链接
	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}
	if (pageNo <= 0)
		pageNo = 1;
%>
<%
	List<User> users = new ArrayList<User>();
	int totalRecords = User.getUsers(users, pageNo, PAGE_SIZE);
	int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

	if (pageNo > totalPages)
		pageNo = totalPages;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
<script>
var  highlightcolor='#d5f4fe';
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>


</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 管理人员基本信息列表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkbox11" id="checkbox11" />
              全选      &nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> 添加   &nbsp; <img src="images/del.gif" width="10" height="10" /> 删除    &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> 编辑   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户名</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户角色</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系方式</span></div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">注册时间</span></div></td>
        <td width="27%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">地址</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">修改角色权限</span></div></td>
      </tr>
      	 <%
						for (int i = 0; i < users.size(); i++) {
						User u = users.get(i);
						if(u.getRight()==0){rightrole="普通用户";}
						if(u.getRight()==1){rightrole="超级管理员";}
						if(u.getRight()==2){rightrole="订单管理员";}
						if(u.getRight()==3){rightrole="仓库管理员";}
						if(u.getRight()==4){rightrole="用户管理员";}
				%>
      <tr>
        <td height="20" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox2" id="checkbox2" />
        </div></td>
        <td height="20" width="30" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19"><%=u.getUsername()%></span></div></td>
        <td height="20" width="30" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rightrole%></div></td>
        <td height="20" width="30" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=u.getPhone()%></div></td>
        <td height="20" width="30" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(u.getRdate())%></div></td>
        <td height="20" width="30" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=u.getAddr()%></div></td>
   
       <form name="form" action="right1.jsp" method="post">
		<input type="hidden" name="action" value="modify">
		<input type="hidden" name="id" value="<%=u.getId()%>">
        <td height="30" width="100"colspan="5" bgcolor="#FFFFFF"><div ><select name="statu" class="form-control" value=>
            <%if(u.getRight()==0){%>
            <option value="0" selected="selected">普通用户</option>
            <%}else{ %>
             <option value="0">普通用户</option>
             <%} %>
             
             <%if(u.getRight()==1){%>
            <option value="1" selected="selected">超级管理员</option>
            <%}else{ %>
             <option value="1">超级管理员</option>
             <%} %>
             
             <%if(u.getRight()==2){%>
            <option value="2" selected="selected">订单管理员</option>
            <%}else{ %>
             <option value="2">订单管理员</option>
             <%} %>
             
              <%if(u.getRight()==3){%>
            <option value="3" selected="selected">仓库管理员</option>
            <%}else{ %>
             <option value="3">仓库管理员</option>
             <%} %>
             
             <%if(u.getRight()==4){%>
            <option value="4" selected="selected">用户管理员</option>
            <%}else{ %>
             <option value="4">用户管理员</option>
             <%} %>
             
        </select><input type="submit" value="修改"></div>
        </td>
       
        </form></tr>
      <%}
		%>
				
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>&lt;<%=totalRecords %>&gt;</strong> 条记录，当前第<strong> &lt;<%=pageNo %>&gt;</strong>页，共 <strong><%=totalPages %></strong> 页</span></div></td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
        <%
													int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
													for(int i=start; i<start+PAGES_PER_TIME; i++) {
														if(i > totalPages) break;
														if(pageNo == i) {
													 %>
          <tr>
            <td width="49"><div align="center"><img src="images/main_54.gif" width="40" height="15" /></div></td>
            <td width="49"><div align="center"><a href="right1.jsp?pageNo=<%=i%>"><img src="images/main_56.gif" width="45" height="15" /></a></div></td>
            <%
			}
				}
			 %>
            <td width="49"><div align="center"><a href="right1.jsp?pageNo=<%=pageNo+1%>"><img src="images/main_58.gif" width="45" height="15" /></a></div></td>
            <td width="49"><div align="center"><a href="right1.jsp?pageNo=<%=totalPages%>"><img src="images/main_60.gif" width="40" height="15" /></a></div></td>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="35"><img src="images/main_62.gif" width="26" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
