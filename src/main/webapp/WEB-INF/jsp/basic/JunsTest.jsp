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
    반납 버튼을 클릭 시, 차 번호를 전송하는 부분
    <br>

    <form action="return.do" method="post">
        <input type="text" name="carNo" placeholder="차 번호 입력">
        <br>
        <input type="submit" value="gogo">
    </form>


</body>
</html>