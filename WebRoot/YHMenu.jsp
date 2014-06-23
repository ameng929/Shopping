<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD id=Head1><TITLE>导航</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #ffffff
}
BODY {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
TD {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
DIV {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
P {
	FONT-SIZE: 11px; COLOR: #003366; FONT-FAMILY: Verdana
}
.mainMenu {
	FONT-WEIGHT: bold; FONT-SIZE: 18px; CURSOR: hand; COLOR: #000000
}
A.style2:link {
	PADDING-LEFT: 4px; COLOR: #0055bb; TEXT-DECORATION: none 
}
A.style2:visited {
	PADDING-LEFT: 4px; COLOR: #0055bb; TEXT-DECORATION: none
}
A.style2:hover {
	PADDING-LEFT: 4px; COLOR: #ff0000; TEXT-DECORATION: none
}
A.active {
	PADDING-LEFT: 4px; COLOR: #ff0000; TEXT-DECORATION: none
}
.span {
	COLOR: #ff0000; font-size:11px
}
.style2{
font-size:16px
}
</STYLE>

<SCRIPT language=javascript>
		function MenuDisplay(obj)
		{
		    for(var i=1;i<=5;i++)
		    {
		        document.getElementById('table_'+i).style.display='yes';
				document.getElementById('table_'+i+'Span').innerText='＋';
		    }
			if(document.getElementById(obj).style.display=='none')
			{
				document.getElementById(obj).style.display='block';
				document.getElementById(obj+'Span').innerText='－';
			}
			else
			{
				document.getElementById(obj).style.display='none';
				document.getElementById(obj+'Span').innerText='＋';
			}
		}
    </SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>
<FORM id=form1 name=form1 action=YHMenu.aspx method=post>
<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <TBODY>
  <TR>
   
    <TD align=middle width=180 
      height=15><B></B> </TD>
    </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <TBODY>
  <TR>
    
    <TD vAlign=top width=180 bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=3 width=165 align=center border=0>
        <TBODY>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN 
            class=span id=table_1Span>＋</SPAN> 订单管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_1 style="DISPLAY: yes" cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
              <TR>
                <TD class=menuSmall><A class=style2
                  href="myorder.jsp" target="main">－ 我的订单</A></TD></TR>
             </TBODY></TABLE></TD></TR>
        <TR>
          <TD background=images/YHMenu.files/new_027.jpg width=1 height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_2');"><SPAN 
            class=span id=table_2Span>＋</SPAN> 评论收藏</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_2 style="DISPLAY: yes" cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="MyComment.jsp" target="main">－ 我的评论</A></TD></TR>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="MyCollect.jsp" target="main">－ 我的收藏</A></TD></TR>
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD background=images/YHMenu.files/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN 
            class=span id=table_3Span>＋</SPAN> 商家推荐</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_3 style="DISPLAY: yes" cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="recommend.jsp" 
                  target="main">－ 推荐商品</A></TD></TR>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="getSjzdflxx.action" target="main">－ 水果套餐 <br></A></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=images/YHMenu.files/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_4');"><SPAN 
            class=span id=table_4Span>＋</SPAN> 个人设置</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_4 style="DISPLAY: yes" cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="UserModify.jsp" target="main">－ 修改信息</A></TD></TR>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="UpdateHead.jsp" target="main">－ 修改图像</A></TD></TR>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="UpdatePassword.jsp" target="main">－ 修改密码</A></TD></TR>
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD background=images/YHMenu.files/new_027.jpg height=1 ></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_5');"><SPAN 
            class=span id=table_5Span>＋</SPAN> 系统管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_5 style="DISPLAY:yes" cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
              <TR>
                <TD class=menuSmall><A class=style2 
                  href="Logout.jsp" 
                  target=dmMain>－ 退出</A></TD></TR>
              <TR>
              
                </TBODY></TABLE></TD></TR>
         <TR>
          <TD background=images/YHMenu.files/new_027.jpg width=1 height=1></TD></TR>
        </TBODY></TABLE></TD>
    <TD width=15 background=images/YHMenu.files/new_009.jpg></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <TBODY>
  <TR>
    <TD width=15></TD>
    <TD align=middle width=180 background=YHMenu.files/new_011.jpg 
    height=15></TD>
    <TD width=15></TD></TR></TBODY></TABLE></FORM></BODY></HTML>
