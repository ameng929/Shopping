<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>������</title>
	<script type="text/javascript" src="JS/mydtree.js"></script>
	<link rel="StyleSheet" type="text/css" href="css/dtree.css" >
	<link rel="StyleSheet" type="text/css" href="css/leftStyle.css" >
	 <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/interface/SjzdflDAO.js'></script>  
</head>
<body>
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
				alert(sjzdflArr.size());
			}
		
			var d = new dTree('d');
				d.config.useCookies = false;//��ʹ��cookies
				d.config.useStatusText = true; //״̬����ʾ�ı�
				d.config.closeSameLevel = true; //�ر�ͬһ��������ڵ�
				//root
				d.add(0,-1,"�������ͻ���ϵ����ϵͳ");
				
				//һ������
				d.add(1,0,"�ͻ���Ϣ");
				d.add(2,0,"�ͻ�����");
				d.add(3,0,"�ճ�/����");
				d.add(4,0,"��Ŀ����");
				d.add(5,0,"ϵͳ����");
				d.add(6,0,"�����ֵ�");
				d.add(7,0,"��Ϣ����");
				
				d.add(11,1,"�ͻ�","form/KhxxJZ.jsp","","main");
				d.add(12,1,"��ϵ��","form/LxrJZ.jsp","","main");
				
				d.add(21,2,"�ͻ�Ͷ��");
				d.add(22,2,"Ͷ�߱���");
				
				d.add(31,3,"�ճ�");
				d.add(32,3,"����");
				
				d.add(41,4,"��Ŀ����");
				d.add(42,4,"��Ŀ����");
				d.add(43,4,"��Ŀ����");
				d.add(44,4,"��Ŀ�ܽ�");
				d.add(45,4,"��Ŀ����");
				
				d.add(51,5,"�û�");
				d.add(52,5,"��ɫ");
				
				d.add(61,6,"�����ֵ����","getSjzdfl.action","","main");
				var i;
				for(i = 0; i < sjzdflArr.length ;i++) {
					if(sjzdflArr[i].sjzdflmc != null && sjzdflArr[i].sjzdflmc != "" && sjzdflArr[i].qiyong == 'yes')
					d.add(62 + i,6,sjzdflArr[i].sjzdflmc,"getSjzdxx.action?sjzdflId="+sjzdflArr[i].sjzdflId,"","main");
				}
				d.add(62 + i,6,"�ͻ�����","getKhjb.action","","main");
				
				d.add(71,7,"����Ϣ");
				
				document.write(d);
		-->
	</script>
</body>
</html>