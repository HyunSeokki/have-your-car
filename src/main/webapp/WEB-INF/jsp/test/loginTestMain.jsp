<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>

<!-- 로그인 후 리다이렉트 테스트 페이지입니다. -->
<!-- 세션에 관련하여 user 정보를 사용해야할 경우, 아래 태그를 추가한 후, -->
<%@ page session="true" %>

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
<script type="text/javaScript" language="javascript">

</script>
</head>
<body>

<!-- 아래와 같이 사용하면 됩니다. -->
<h1> Hello, <%= session.getAttribute("user") %> </h1>
	
</body>
</html>