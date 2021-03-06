<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/sign.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<div class="result_div"></div>
	<div class="container">
		<div class="starter-template">
		
			<form class="form-signin">
				<h2 id="hText2" class="form-signin-heading">로그인</h2>
				
				<label for="userId" class="sr-only">ID</label> 
				<input type="text" name="userId" id="userId" class="form-control"
					placeholder="ID" autofocus>
					
				<label for="userPwd" class="sr-only">Password</label> 
				<input type="password" name="userPwd" id="userPwd" class="form-control"
					placeholder="Password">
					
				<input class="btn btn-primary btn-lg btn-block" type="button"
					id="loginBtn" value="Login" onclick="checkValue()">
							
				<a href="/view/user/signin"><h6>회원가입</h6></a>
			</form>
		</div>
	</div>
</body>
<script>

function checkValue(){
	var objs = $(".container");
	var userId = $("#userId").val().trim();
	var userPwd = $("#userPwd").val().trim();
	if(userId.length<3){
		alert("유저아이디 확인해!!");
		$("#userId").focus();
		return;
	}
	if(userPwd.length<3){
		alert("비밀번호 확인해!!");
		$("#userPwd").focus();
		return;
	}
	var param = {uiId:userId, uiPwd:userPwd};
	
	param = "param=" + encodeURIComponent(JSON.stringify(param));
	$.ajax({
		url : '<%=rootPath%>/user/login',
		data : param,
		type :'get',
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.login=="ok"){
				location.href="<%=rootPath%>/";
			}
		}
	})
}
</script>
</html>