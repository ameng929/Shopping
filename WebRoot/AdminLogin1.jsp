
<%@ page language="java" contentType="text/html; charset=GB18030" import="com.zx.shopping.user.*,java.util.*"
    pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>


<script language=Javascript>

    
      function show(o){
 //������֤��
 var timenow = new Date().getTime();
 o.src="image.action?d="+timenow;
 
}

function tijiao(){
if(document.admin.username.value=="")
{	alert('�û�������Ϊ��');
	return false;
}


if(document.admin.password.value=="")
{
	alert('���벻��Ϊ��');
	return false;
}

if(document.admin.code.value=="")
{
alert('��֤�벻��Ϊ��');
return false;
}
 

document.admin.submit();

}
</script>


<title> �̳Ǻ�̨����</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK 
href="images/public.css" type=text/css rel=stylesheet>
<LINK 
href="images/login.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY>
<DIV id=div1><div align="right"> 
  </div><TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800 
align=center>
    <TBODY>
      <TR id=main>
        <TD><div align="right"> 
          </div><TABLE height="229" cellSpacing=0 cellPadding=0 width="818">
            <TBODY>
              <TR>
                <TD height="197" colSpan=4><blockquote><div align="right"> 
                  </div><h1 style="font-size:34px" align="right"><font size="7" color="#ffffff"><em><strong>���ݶ�����ˮ���̳Ǻ�̨ϵͳ</strong></em></font></h1>
                </blockquote></TD>
              </TR>
              <TR height=30>
                <TD width=376>&nbsp;</TD>
                <TD width="57">&nbsp;</TD>
                <TD width="182">&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <form name="admin" action="adminLogin.action" method="post">
			 <input type="hidden" name="action" value="login"/>
              <TR height=40>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>�û�����</TD>
                <TD>
                  <INPUT name="username" class=textbox id=txtUserName >                </TD>
                <TD width=117>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>�ܡ��룺</TD>
                <TD>
                  <INPUT class=textbox id=txtUserPassword type=password 
            name="password">                </TD>
                <TD width=117>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>��֤�룺</TD>
                <TD vAlign=center colSpan=2>
                  <INPUT id=txtSN size=4 name="code" type=text value="">
                  &nbsp; <img alt="��֤��"  border="0" height="20" name="random"  src="image.action" width="55" id="random" align="absmiddle"/><a href="javascript:show(document.getElementById('random'))" class="STYLE5">������</a></TD>
              </TR>
              <TR height=40>
                <TD height="21"></TD>
                <TD align=left><input id=btnLogin type=button value=" �� ¼ " name=btnLogin onclick="tijiao()"> &nbsp;&nbsp;&nbsp;&nbsp;
                   <input id=btnLogin type=reset value=" ���� " name=btnLogin> </TD>
                <TD width=117>&nbsp;</TD>
              </TR>
              <TR height=110>
                <TD height="15" colSpan=4>&nbsp;</TD>
              </TR>
              </form>
            </TBODY>
          </TABLE>
        </TD>
      </TR>
      <TR id=root height=104>
        <TD>&nbsp;</TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</CONTENTTEMPLATE>
</BODY>
</HTML>
