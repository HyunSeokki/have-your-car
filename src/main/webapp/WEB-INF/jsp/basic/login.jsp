<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>

<%-- 
    JSP Name : jspName.jsp
    Description : 설명을 기술합니다.
    author 6800410
    since 2020. 2. 12.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 12.     6800410     	최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javaScript" language="javascript">
function login() {
    var id = document.getElementById("userID").value;
    var pw = document.getElementById("userPWD").value;
    
    $.ajax({
        type : "POST", //전송방식을 지정한다 (POST,GET)
        url : "verifyLogin.do",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data : {"userID" : id, "userPWD" : pw},
        dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        contentType : "application/json; charset=utf-8",
        error : function(){
            console.log("통신실패~!");
        },
        success : function(response){
            if(response == false) {
                alert("비밀번호가 틀렸습니다.");
                document.loginForm.reset();
            } else {
                document.loginForm.action = "<c:url value='/basic/login.do'/>";
                document.loginForm.submit();
            }
        }
    })
}
</script>
</head>
<body>

<form:form commandName="userVO" id="loginForm" name="loginForm" class="form-horizontal" role="form">
<table border="1">
    <tr>
        <td> 아이디 </td>
        <td>
            <form:input path="userID" name="userID" type="text"/>
            <form:errors path="userID" />
        </td>
    </tr>
    <tr>
        <td> 비밀번호 </td>
        <td>
            <form:input path="userPWD" name="userPWD" type="password"/>
            <form:errors path="userPWD" />
        </td>
    </tr>
</table>
</form:form>
<button onclick="login()">로그인</button>
	
</body>
</html>