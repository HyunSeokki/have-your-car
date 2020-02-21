<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<%@ page session="true"%>
<%
    String id = (String) session.getAttribute("user");
%>
<%-- 
    JSP Name : register.jsp
    Description : 설명을 기술합니다.
    author 6800410
    since 2020. 2. 10.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 10.     6800410     	최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous">

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"
    type="text/javascript"></script>
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>carRegister</title>
<style>
#title {
    text-align: center;
}

thead {
    background-color: #013469;
    color: white;
    width: calc( 100% - 1em )/* scrollbar is average 1em/16px width, remove it from thead width */
}

tbody {
    display:block;
    height:520px;
    overflow:auto;
}

thead, tbody tr {
    display:table;
    width:100%;
    table-layout:fixed;
}
</style>
</head>

<body>
    <div class="container-fluid" style="height: 100vh";>
        <h1 id="title">차량등록</h1>
        
        <!-- 차량등록 테이블 -->
        <table id="carTable" width="90%"
            class="table table-hover text-center">
            <thead>
                <tr>
                    <th>추가 차량 선택</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="carList" items="${resultList}" varStatus="status">
                      <tr>
                        <td id="car">
                            <div id = "carImage">
                                <img src="<c:url value="/${carList.imgSrc}"/>" width="100">
                            </div>
                            <div id = "carInfo">
                                <c:out value="${carList.carType }" />
                                <c:out value="${carList.carSize }" />
                                <c:out value="${carList.birth }" />
                                <c:out value="${carList.capacity }" />
                                <c:out value="${carList.cost }" />
                            </div>   
                        </td>
                      </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>