<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.zx.shopping.user.*"%>

<%
String str=request.getParameter("id");
//int id=Integer.parseInt(request.getParameter("id"));
int[] ID=new int[20] ;

String[] s = str.split(",");//ȡ������һ���ַ�������

//ѭ��ȡ�������ַ�������
for (int i=0;i<s.length;i++)
{
ID[i] = Integer.parseInt(s[i]);
//String[] ss = null;//��ȫ�ֱ���
//int num = 0;
//String url = request.getParameter("from");
//User.delete(id);
User.delete(ID[i]);



//User.delete(id);
}
String url = request.getParameter("from");
%>

<html>
	<head>
		<title>ɾ���û�</title>
	</head>
	<body>
		<center>
			��ϲ��, ɾ���ɹ�!
			<br>
			<span id="delay" style="background:red">3</span>���Ӻ���ת����һҳ��, ����������������� �Լ���ת
			<br>
			<a href="<%=url%>"><%=url%></a>
		</center>
		<script type="text/javascript">	
			
			//var delay = 3;
			//function goBack() {
			//	document.getElementById("delay").innerHTML=delay;
			//	delay --;
			//	if(delay == 0) 
			//		document.location.href='<%=url%>';
			//	else 
			//		setTimeout(goBack, 1000);
			//}
			//goBack();
			
			parent.main.location.reload();
			
		</script>
	</body>
</html>