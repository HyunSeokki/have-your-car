<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Sample</title>

<script>
	function goList() {
		document.detailForm.action = "<c:url value='/basic/selectItemList.do'/>";
		document.detailForm.submit();

	}

	function goDelete(seq) {
		if (confirm('삭제 하시겠습니까?')) {
			document.detailForm.selectedSeq.value = seq;
			document.detailForm.action = "<c:url value='/basic/deleteItem.do'/>";
			document.detailForm.submit();
		} else {
			return false;
		}
	}

	function goModify(seq) {
		document.detailForm.selectedSeq.value = seq;
		document.detailForm.action = "<c:url value='/basic/updateItemForm.do'/>";
		document.detailForm.submit();
	}
</script>
</head>
<body>

<h1 class="page-header">조회</h1>
<form:form commandName="basicSampleVO" id="detailForm"
	name="detailForm">
	<input type="hidden" name="selectedSeq" />
	<table border="1">
		<tr>
			<th>분류</th>
			<td>${result.category}</td>
			<th>작성자</th>
			<td>${result.regUser}</td>
			<th>작성일</th>
			<td>${result.regDate}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5">${result.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<%-- <td colspan="5">${result.description}</td> --%>
			<td colspan="5"><textarea name="content" rows="10" cols="100" style="border:0;" readOnly>${result.description}</textarea></td> 
		</tr>
	</table>
</form:form>


<a href="javascript:goList();"> 목록 </a> 
<a href="javascript:goModify('<c:out value="${result.seq}"/>')"> 수정 </a> 
<a href="javascript:goDelete('<c:out value="${result.seq}"/>')"> 삭제 </a>

</body>
</html>