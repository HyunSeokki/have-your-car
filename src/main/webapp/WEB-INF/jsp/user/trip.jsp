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


<title>결제 화면</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javaScript" language="javascript">
var rentNo = "${rentInfo.rentNo }";
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="card" style="margin: 3%; padding: 2%;">
    <h2 class="card-title" style="text-align: center;">주행 기록 확인</h2>
    <div id="map" style="width:100%;height: 60vh; "></div>
    
    <div class="card-body" style="padding: 10px 0px 0px 0px; width: 100%; height: 40vh; ">
        <!-- Rent 정보  -->
        <div class="card" style="position: relative; height:100%;">
            <div class="card-header">주행 정보</div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">사용자 ID&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:&nbsp;${rentInfo.userID }</li> 
                <li class="list-group-item">시작 시간&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:&nbsp;<span id="rentDate"></span></li> 
                <li class="list-group-item">종료 시간&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:&nbsp;<span id="rentEnd"></span></li> 
                <li class="list-group-item">총 주행 거리&nbsp; &nbsp;&nbsp;:&nbsp;<span id="rentDistance"></span></li> 
            </ul>
            <button class="btn btn-primary" style="position:absolute; min-height: 45px;  width:100%; height: auto; font-size: 1.2em; bottom: 0px;" id="payBtn"  type="button" onclick="payAndReturn()"></button>
        </div>
    </div>
</div>


<!-- 카카오 지도 그리는 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ec55985aa8acb748cd1f62c730db1a4"></script>
<script type="text/javascript">
/*
 * String Data 재조립
 */

var rentDate = "${rentInfo.rentDate }";
var rentEnd = "${rentInfo.returnDate}";
var splitDate = function(date) {
    return date.substring(0,4)+"년 "+date.substring(4,6)+"월 "
    +date.substring(6,8)+"일 "+date.substring(8,10)+"시 "
    +date.substring(10,12)+"분 "+date.substring(12,14)+"초";
}
document.getElementById('rentDate').innerHTML = splitDate(rentDate);
document.getElementById('rentEnd').innerHTML = splitDate(rentEnd);

/*
 * 카카오 맵
 */

var bounds = new kakao.maps.LatLngBounds();
var linePath = new Array();
var lastLat = 0;
var lastLng = 0;

<c:forEach var="dr" items="${drv }">
var temp = new kakao.maps.LatLng("${dr.latitude}", "${dr.longitude}");
linePath.push(temp);
bounds.extend(temp);
lastLat = "${dr.latitude}";
lastLng = "${dr.longitude}";
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

/*
 * kakao 거리 계산으로 distance for pay Cost 구하기
 */
// 움직인 거리(단위: m), km단위로 반올림
var distance = Math.round(polyline.getLength());
document.getElementById("rentDistance").innerHTML = distance + "m";
distance = Math.round(distance / 1000 );
var cost = "${cost}"*1; // rent 정보에 저장된 비용
cost = distance * cost;
document.getElementById("payBtn").innerHTML = "결제 금액 : "+ cost + "원 ";


polyline.setMap(map);  
map.setBounds(bounds);


function payAndReturn(){
    var payReturn = document.data;
    payReturn.distance.value = distance;
    payReturn.lat.value = lastLat;
    payReturn.lng.value = lastLng;
    payReturn.rentNo.value = rentNo;
    
    payReturn.action = "./payAndReturn.do";
    payReturn.method = "post";
    payReturn.submit();
}


</script>
<form name="data">
        <input type="hidden" name="distance"/>
        <input type="hidden" name="lat"/>
        <input type="hidden" name="lng"/>
        <input type="hidden" name="rentNo"/>
</form>
</body>
</html>






