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

	function goUpdate() {
		document.detailForm.action = "<c:url value='/basic/updateItem.do'/>";
		document.detailForm.submit();
	}

	function goRefresh() {
		document.detailForm.reset();
	}
</script>
</head>
<body>

<h1>수정</h1>
<form:form commandName="basicSampleVO" id="detailForm"
	name="detailForm" role="form">
	<form:input type="hidden" path="seq"/>
	<table border="1">
	<tr>
		<td>
		분류 *
		</td>
		<td>
			<form:select path="category" >
				<form:option value="전체공지" label="전체공지" />
				<form:option value="부분공지" label="부분공지" />
			</form:select>
		</td>
	</tr>
	<tr>
		<td>제목 *
		</td>
		<td>
			<form:input path="title" type="text" />
			<form:errors path="title" />
		</td>
	</tr>
	<tr>
		<td>
		내용 *
		</td>
		<td>
			<form:textarea path="description" rows="5" cols="60"
				type="text" />
			<form:errors path="description" />	
		</td>
	</tr>
	<tr>
		<td> 작성자 </td>
		<td>
			<form:input path="regUser" type="text" readonly="true" />
			<form:errors path="regUser" />	
		</td>
	</tr>
	</table>
</form:form>
<a href="javascript:goList();"> 목록 </a>
<a href="javascript:goUpdate();">수정</a> 

</body>
</html>