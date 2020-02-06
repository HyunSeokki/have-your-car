<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Basic Sample</title>
</head>
<body>

<h1>Basic Sample</h1><br>
<form:form commandName="basicSampleVO" id="listForm" name="listForm" method="post">
<input type="hidden" name="selectedSeq" />
<table>
    <tr>
        <td>
            <form:select path="searchCondition">
                <form:option value="2" label="작성자" />
                <form:option value="1" label="제목" />
                <form:option value="0" label="분류" />
            </form:select>
            <form:input path="searchKeyword" />
            <a href="javascript:goSearch();"> 검색</a> 
            <a href="javascript:goRegister();"> 등록  </a>
        </td>
    </tr>   
</table>
<br>
<table width="500" border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>분류</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty resultList}">
                <tr>
                    <td colspan="6" align="center">검색된 결과가 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="result" items="${resultList}"
                    varStatus="status">
                    <tr onclick="javascript:goView('${result.seq }')">
                        <td><c:out value="${result.seq }" /></td>
                        <td><c:out value="${result.category }" /></td>
                        <td><c:out value="${result.title }" /></td>
                        <td><c:out value="${result.regUser }" /></td>
                        <td><c:out value="${result.regDate }" /></td>
                        <td><c:out value="${result.viewCount }" /></td>
                    </tr>
                </c:forEach>

            </c:otherwise>
        </c:choose>
    </tbody>
</table>
</form:form>

</body>
</html>
</body>
</html>