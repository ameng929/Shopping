function checkdata() {
    var ssn=document.register.username.value.toLowerCase();
	
	if (!checkUserName(ssn)) return false;  //�û������
	if( strlen(register.password.value)<6 || strlen(form.password.value)>16 ) {
		alert("\��ȷ�ص�¼���볤��Ϊ6-16λ��������Ӣ�ġ����֡������ַ���")
		document.register.password.focus()
		return false;
	}
	
	
	if( strlen2(register.password.value) ) {
		alert("\���������а����˷Ƿ��ַ���������Ӣ�ġ����֡������ַ���")
		document.register.password.focus()
		return false;
	}
	if( register.password.value == document.register.username.value ) {
		alert("\�û��������벻����ͬ��")
		document.register.password.focus()
		return false;
	}
	if( register.password2.value =="" ) {
		alert("\����������ȷ�ϣ�")
		document.register.password2.focus()
		return false;
	}
	if( register.password2.value != document.register.password.value ) {
		alert("\�����������벻һ�£�")
		document.register.password.focus()
		return false;
	}
	
	
	
	/*
	if( form.question.value == "") {
		alert("\��������ʾ����,������������ʱ�ɸ��ݸ�������ʾ���룡")
		form.question.focus()
		return false;
	}
	if( strlen(form.answer.value)<6) {
		alert("\��������������𰸣����Ȳ�����6λ��")
		form.answer.focus()
		return false;
	}
	if( form.question.value == form.answer.value ) {
		alert("\������ʾ����ʹ𰸲�����ͬ��")
		form.answer.focus()
		return false;
	}
	if( strlen(form.pingma.value)<6 || strlen(form.pingma.value)>16 ) {
		alert("\��ȷ�İ�ȫ�볤��Ϊ6-16λ��������Ӣ�ġ����֡������ַ���")
		form.pingma.focus()
		return false;
	}
	if( strlen2(form.pingma.value) ) {
		alert("\���İ�ȫ���а����˷Ƿ��ַ���������Ӣ�ġ����֡������ַ���")
		form.pingma.focus()
		return false;
	}
	if( form.pingma.value == form.username.value ) {
		alert("\�û����Ͱ�ȫ�벻����ͬ��")
		form.pingma.focus()
		return false;
	}
	if( form.pingma2.value =="" ) {
		alert("\�����밲ȫ��ȷ�ϣ�")
		form.pingma2.focus()
		return false;
	}
	if( form.pingma.value != form.pingma2.value ) {
		alert("\���ΰ�ȫ�����벻һ�£�")
		form.pingma.focus()
		return false;
	}*/
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>18 ) {
		//alert("\��������ȷ���û���,�û�������Ϊ3-18λ��")
		document.getElementById("username").innerHTML = "<font color='red'>��������ȷ���û���,�û�������Ϊ3-18λ��</font>";
		register.username.focus()
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\��������ȷ���û���,�û����в��ܰ����ո�")
		register.username.focus()
		return false;
	}
	
	document.getElementById("username").innerHTML = "";
	
	return true;
}

function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}

function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}

function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}

function checkssn(gotoURL) {
   var ssn=register.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}