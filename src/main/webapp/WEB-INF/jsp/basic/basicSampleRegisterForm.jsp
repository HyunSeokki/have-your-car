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

	function goRegister() {
		document.detailForm.action = "<c:url value='/basic/insertItem.do'/>";
		document.detailForm.submit();

	}

	function goRefresh() {
		document.detailForm.reset();
	}
</script>
</head>
<body>

<h1>등록</h1>
<form:form commandName="basicSampleVO" id="detailForm"
	name="detailForm" class="form-horizontal" role="form">
<table border="1">
	<tr>
		<td>
		분류  *
		</td>
		<td>
			<form:select path="category">
				<form:option value="전체공지" label="전체공지" />
				<form:option value="부분공지" label="부분공지" />
			</form:select>
		</td>
	</tr>
	<tr>
		<td>
		제목 *
		</td>
		<td>
			<form:input path="title" name="title"
				type="text" placeholder="제목을 입력하세요." />
			<form:errors path="title" />
		</td>
	</tr>
	<tr>
		<td>
		내용  *
		</td>
		<td>
			<form:textarea path="description" rows="5" cols="60"
				type="text" placeholder="내용을 입력하세요." />
			<form:errors path="description" />
		</td>
	</tr>
	<tr>
		<td>
		작성자 *
		</td>
		<td>
			<form:input path="regUser" type="text"
				placeholder="작성자를 입력하세요." />
			<form:errors path="regUser" />
		</td>
	</tr>
</table>
</form:form>

<a href="javascript:goList();"> 목록 </a> 
<a href="javascript:goRegister();">	등록 </a> 
<a href="javascript:goRefresh();">	재설정 </a>
</body>
</html>