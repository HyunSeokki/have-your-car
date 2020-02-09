<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
    JSP Name : jspName.jsp
    Description : 설명을 기술합니다.
    author HAVE
    since 2020. 2. 10.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 10.     HAVE     	최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Junho's Test JSP for DataBase</title>
<script type="text/javaScript" language="javascript">
    
</script>
</head>
<body>

    <table width="500" border="1">
        <thead>
            <tr>
                <th>차 번호</th>
                <th>차 사이즈</th>
                <th>차 종류</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:forEach var="result" items="${resultList}"
                    varStatus="status">
                    <tr>
                        <td><c:out value="${result.carNo }" /></td>
                        <td><c:out value="${result.carSize }" /></td>
                        <td><c:out value="${result.carType }" /></td>
                    </tr>
                </c:forEach>

            </c:choose>
        </tbody>
    </table>


</body>
</html>