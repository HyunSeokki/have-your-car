<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Basic Sample</title>

<script>
	function goView(seq) {
		document.listForm.selectedSeq.value = seq;
		document.listForm.action = "<c:url value='/basic/selectItemById.do'/>";
		document.listForm.submit();
	}

	function goRegister() {
		document.listForm.action = "<c:url value='/basic/insertItemForm.do'/>";
		document.listForm.submit();
	}

	function goSearch() {
		document.listForm.action = "<c:url value='/basic/selectItemList.do'/>";
		document.listForm.submit();
	}
</script>

</head>
<body>

<h1>Basic Sample</h1><br>

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
						<td><c:out value="${result.userID }" /></td>
						<td><c:out value="${result.userPWD }" /></td>
				</c:forEach>

			</c:otherwise>
		</c:choose>
	</tbody>
</table>

</body>
</html>