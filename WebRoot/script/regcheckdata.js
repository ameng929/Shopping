function checkdata() {
    var ssn=document.register.username.value.toLowerCase();
	
	if (!checkUserName(ssn)) return false;  //用户名检查
	if( strlen(register.password.value)<6 || strlen(form.password.value)>16 ) {
		alert("\正确地登录密码长度为6-16位，仅可用英文、数字、特殊字符！")
		document.register.password.focus()
		return false;
	}
	
	
	if( strlen2(register.password.value) ) {
		alert("\您的密码中包含了非法字符，仅可用英文、数字、特殊字符！")
		document.register.password.focus()
		return false;
	}
	if( register.password.value == document.register.username.value ) {
		alert("\用户名和密码不能相同！")
		document.register.password.focus()
		return false;
	}
	if( register.password2.value =="" ) {
		alert("\请输入密码确认！")
		document.register.password2.focus()
		return false;
	}
	if( register.password2.value != document.register.password.value ) {
		alert("\两次密码输入不一致！")
		document.register.password.focus()
		return false;
	}
	
	
	
	/*
	if( form.question.value == "") {
		alert("\请输入提示问题,当您忘记密码时可根据该问题提示密码！")
		form.question.focus()
		return false;
	}
	if( strlen(form.answer.value)<6) {
		alert("\请重新输入问题答案，长度不少于6位！")
		form.answer.focus()
		return false;
	}
	if( form.question.value == form.answer.value ) {
		alert("\密码提示问题和答案不能相同！")
		form.answer.focus()
		return false;
	}
	if( strlen(form.pingma.value)<6 || strlen(form.pingma.value)>16 ) {
		alert("\正确的安全码长度为6-16位，仅可用英文、数字、特殊字符！")
		form.pingma.focus()
		return false;
	}
	if( strlen2(form.pingma.value) ) {
		alert("\您的安全码中包含了非法字符，仅可用英文、数字、特殊字符！")
		form.pingma.focus()
		return false;
	}
	if( form.pingma.value == form.username.value ) {
		alert("\用户名和安全码不能相同！")
		form.pingma.focus()
		return false;
	}
	if( form.pingma2.value =="" ) {
		alert("\请输入安全码确认！")
		form.pingma2.focus()
		return false;
	}
	if( form.pingma.value != form.pingma2.value ) {
		alert("\两次安全码输入不一致！")
		form.pingma.focus()
		return false;
	}*/
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>18 ) {
		//alert("\请输入正确的用户名,用户名长度为3-18位！")
		document.getElementById("username").innerHTML = "<font color='red'>请输入正确的用户名,用户名长度为3-18位！</font>";
		register.username.focus()
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\请输入正确的用户名,用户名中不能包含空格！")
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