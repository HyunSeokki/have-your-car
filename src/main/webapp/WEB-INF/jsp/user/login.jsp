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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
<div class="container-fluid">
    <div class="row align-items-center justify-content-center"  style="height:100vh;">
        <div class="col-10 pb-5">
            <div class="d-flex justify-content-center">
                <img src="https://imgur.com/JIINNf7.png" alt="logo"/>
            </div>
            <form:form commandName="userVO" id="loginForm" name="loginForm" class="form-horizontal" role="form">
                <div class="form-group">
                    <label>아이디</label>
                    <form:input path="userID" name="userID" type="text" class="form-control"/>
                    <form:errors path="userID" />
                </div>
                <div class="form-group">
                    <label>비밀번호</label>
                    <form:input path="userPWD" name="userPWD" type="password" class="form-control"/>
                    <form:errors path="userPWD" />
                </div>    
            </form:form>
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-primary" onclick="login()">로그인</button>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>