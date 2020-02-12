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
<div style="text-align: center;">
<!-- Rent 정보  -->
<h3>Rent data Check</h3>
<tr>
    <td>rentNo     :  ${rentInfo.rentNo }</td>
    <td>carNo      :  ${rentInfo.carNo }</td>
    <td>userID     :  ${rentInfo.userID }</td>
    <td>rentDate   :  ${rentInfo.rentDate }</td>
    <td>returnDate :  ${rentInfo.returnDate }</td>
</tr>

<!-- 결제 시에 필요한 비용 돈/거리 -->
<h3>CarData Cost Check</h3>
<tr>
    <td>Cost : ${cost }</td>
</tr>


<!-- 지도에 표시될 좌표 리스트 -->
<h3>Driving Data Check</h3>
<c:forEach var="dr" items="${drv }">
<tr>
    <td>rentNo    : <c:out value="${dr.rentNo}" /> </td>
    <td>latitude  : <c:out value="${dr.latitude}" /> </td>
    <td>longitude : <c:out value="${dr.longitude}" /> </td>
    <td>timestamp : <c:out value="${dr.timeStamp}" /> </td>
</tr>
<br>
</c:forEach>
</div>


<!-- 카카오 지도 그리는 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ec55985aa8acb748cd1f62c730db1a4"></script>
<script type="text/javascript">

var linePath = new Array();
var sumLa = 0;
var sumLo = 0;

<c:forEach var="dr" items="${drv }">
linePath.push(new kakao.maps.LatLng("${dr.latitude}", "${dr.longitude}"));
sumLa += "${dr.latitude}"*1;
sumLo += "${dr.longitude}"*1;
</c:forEach>

// 지도 초기값 보여주기
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(sumLa/"${drv.size()}", sumLo/"${drv.size()}"), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

// 지도 그리기
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 선 그리기
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#FFAE00', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

polyline.setMap(map);  


</script>

</body>
</html>






