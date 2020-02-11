<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
    JSP Name : trip.jsp
    Description : 설명을 기술합니다.
    author HAVE
    since 2020. 2. 10.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 10.     HAVE     	최초 생성
--%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javaScript" language="javascript">
    
</script>
</head>
<body>
    come here
    <c:forEach var="rent" items="${rentInfo}" varStatus="status">
        <tr>
            <td><c:out value="${rent.rentNo }" /></td>
            <td><c:out value="${rent.carNo }" /></td>
            <td><c:out value="${rent.userID }" /></td>
            <td><c:out value="${rent.rentDate }" /></td>
            <td><c:out value="${rent.returnDate }" /></td>
        </tr>
    </c:forEach>


</body>
</html>