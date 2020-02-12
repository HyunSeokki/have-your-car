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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javaScript" language="javascript">
var rentNo = "${rentInfo.rentNo }";
function makeData() {
    window.open("makeData.do?rentNo="+rentNo,"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}
</script>
</head>
<body>
<div align="right" style="margin: 5px;"><em>
<a href="javascript:makeData();"> Make Data </a> 
</em></div>
<div id="map" style="width:100%;height:500px;"></div>

<p>Trip 확인</p> 
<div>
<h3>Rent data Check</h3>
<tr>
    <td>rentNo     :  ${rentInfo.rentNo }</td>
    <td>carNo      :  ${rentInfo.carNo }</td>
    <td>userID     :  ${rentInfo.userID }</td>
    <td>rentDate   : ${rentInfo.rentDate }</td>
    <td>returnDate : ${rentInfo.returnDate }</td>
</tr>

<h3>CarData Cost Check</h3>
<tr>
    <td>Cost : ${cost }</td>
</tr>

<h3>Driving Data Check</h3>
<c:forEach var="drv" items="${drivingInfo }">
<tr>
    <td>rentNo    : <c:out value="${drv.rentNo}" /> </td>
    <td>latitude  : <c:out value="${drv.latitude}" /> </td>
    <td>longitude : <c:out value="${drv.longitude}" /> </td>
    <td>timestamp : <c:out value="${drv.timeStamp}" /> </td>
</tr>
<br>
</c:forEach>
</div>







<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ec55985aa8acb748cd1f62c730db1a4"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.507150, 127.058639), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

</script>

</body>
</html>