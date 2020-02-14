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
<h2 style="text-align: center;">주행 기록 확인</h2>
<div align="right" style="margin: 5px;"><em>
<a href="javascript:makeData();"> Make Data </a> 
</em></div>
<div id="map" style="width:70%;height:500px; left: 15%;"></div>

<div style="text-align: left; margin-left: 15%; margin-right: 15%;">
<!-- Rent 정보  -->
<h3>주행 정보</h3>
<tr>
    <td>사용자 ID&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:&nbsp;${rentInfo.userID }</td> <hr>
    <td>빌린 시간&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:&nbsp;<span id="rentDate"></span></td> <hr>
    <td>총 주행 거리&nbsp; &nbsp;&nbsp;:&nbsp;<span id="rentDistance"></span></td> <hr>
</tr>

<div style="text-align: right;">
<button id="payBtn" type="button" onclick=""></button>
</div>

<!-- 지도에 표시될 좌표 리스트 -->
<!-- 
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
 -->
</div>


<!-- 카카오 지도 그리는 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ec55985aa8acb748cd1f62c730db1a4"></script>
<script type="text/javascript">
/*
 * String Data 재조립
 */

var rentDate = "${rentInfo.rentDate }";
var splitDate = function(date) {
    console.log(date);
    return date.substring(0,4)+"년 "+date.substring(4,6)+"월 "
    +date.substring(6,8)+"일 "+date.substring(8,10)+"시 "
    +date.substring(10,12)+"분 "+date.substring(12,14)+"초";
}
console.log(splitDate(rentDate));
document.getElementById('rentDate').innerHTML = splitDate(rentDate);

/*
 * 카카오 맵
 */

var bounds = new kakao.maps.LatLngBounds();
var linePath = new Array();

<c:forEach var="dr" items="${drv }">
var temp = new kakao.maps.LatLng("${dr.latitude}", "${dr.longitude}");
linePath.push(temp);
bounds.extend(temp);
</c:forEach>

// 지도 초기값 보여주기
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.507381428880635, 127.05895942121612), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

// 지도 그리기
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 선 그리기
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#6633FF', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 움직인 거리(단위: m), km단위로 반올림
var distance = Math.round(polyline.getLength());
document.getElementById("rentDistance").innerHTML = distance + "m";
distance = Math.round(distance / 1000 );
var cost = "${cost}"*1; // rent 정보에 저장된 비용
cost = distance * cost;
document.getElementById("payBtn").innerHTML = "결제 금액 : "+ cost + "원 ";


polyline.setMap(map);  
map.setBounds(bounds);

</script>

</body>
</html>






