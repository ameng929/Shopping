<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>
<HEAD>
<TITLE>��̨����</TITLE>  
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
<script type="text/javascript" src="../../JS/mydtree.js"></script>
	<link rel="StyleSheet" type="text/css" href="../../css/dtree.css" >
	<link rel="StyleSheet" type="text/css" href="../../css/leftStyle.css" >
	 <script type='text/javascript' src='../../dwr/engine.js'></script>
    <script type='text/javascript' src='../../dwr/interface/SjzdflDAO.js'></script>  
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg_left_tr.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="25" cellSpacing=0 cellPadding=0 width="650">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="Left.files/bg_left_tl.gif"></TD>
      <TD 
    style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(../images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">�̳�-��̨����<br></TD>
      <TD width=10><IMG src="Left.files/bg_left_tr.gif"></TD>
    </TR>
    
    
  </TBODY>
</TABLE>
<p><a href="javascript: d.openAll();">��ȫ��</a> | <a href="javascript: d.closeAll();">�ر�ȫ��</a></p>	
	<script type="text/javascript">
		<!--
			var sjzdflArr;
			//����Ϊͬ��
			DWREngine.setAsync(false); 
			SjzdflDAO.findAll(load);
			//�������û��첽
			DWREngine.setAsync(true); 
			function load(data){
			
				sjzdflArr = data;
			}
		
			var d = new dTree('d');
				d.config.useCookies = false;//��ʹ��cookies
				d.config.useStatusText = true; //״̬����ʾ�ı�
				d.config.closeSameLevel = true; //�ر�ͬһ��������ڵ�
				//root
				d.add(0,-1,"ϵͳ�˵�");
				
				//һ������
				d.add(1,0,"�û�����");
				d.add(2,0,"������");
				d.add(3,0,"��Ʒ����");
				d.add(4,0,"��������");
				d.add(5,0,"����ͳ��");
				d.add(6,0,"�����ֵ�");
				d.add(7,0,"Ȩ�޹���");
				
				d.add(11,1,"�û��б�","../UserList.jsp","","mainFrame");
				d.add(12,1,"����","../qq.jsp","","mainFrame");
				
				d.add(21,2,"����б�","../CategoryList.jsp","","mainFrame");
				d.add(22,2,"������","../CategoryAdd.jsp","","mainFrame");
				
				d.add(31,3,"��Ʒ�б�","../ProductList.jsp","","mainFrame");
				d.add(32,3,"��Ʒ����","../ProductSearch.jsp","","mainFrame");
				d.add(33,3,"��Ʒ����","../ProductAdd.jsp","","mainFrame");
				
				d.add(41,4,"�����б�","../OrderList1.jsp","","mainFrame");
				
				
				d.add(51,5,"����ͳ��","../ClickSalesCount.jsp","","mainFrame");
		
				
				d.add(61,6,"�ײͷ�������","getSjzdfl.action","","mainFrame");
				var i;
				for(i = 0; i < sjzdflArr.length ;i++) {
					if(sjzdflArr[i].sjzdflmc != null && sjzdflArr[i].sjzdflmc != "" && sjzdflArr[i].qiyong == 'yes')
					d.add(62 + i,6,sjzdflArr[i].sjzdflmc,"getSjzdxx.action?sjzdflId="+sjzdflArr[i].sjzdflId,"","mainFrame");
				}
				//d.add(62 + i,6,"�ͻ�����","getKhjb.action","","mainFrame");
				
				d.add(71,7,"Ȩ�޹���","../right1.jsp","","mainFrame");
				
				document.write(d);
		-->
</script>
</body>
</html>