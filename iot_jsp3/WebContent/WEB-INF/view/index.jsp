<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp"%>
<%
if(user==null){
	
	
}
else{

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IOT_JAEYUL</title>
</head>
<body>  
	<jsp:include page="/WEB-INF/view/common/header.jspff" flush="false"/>
    <div class="container">

      <div class="starter-template">
        <h1><%=user.getUiName()%>님 환영합니다.</h1>
        <p class="lead">6:00am ~ 7:30am<br>8:00pm ~ 9:30pm</p>
      </div>

    </div><!-- /.container -->
</body>
</html>
<%

}
%>
