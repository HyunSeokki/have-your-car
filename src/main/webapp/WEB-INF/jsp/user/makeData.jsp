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

</script>
</head>
<body>
<h1>Make Data Page</h1>
<div id="map" style="width:100%;height:650px; "></div>

<div id="clickLatlng"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ec55985aa8acb748cd1f62c730db1a4"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.507150, 127.058639), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var rentNo = "${rentNo }";
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    document.getElementById("rentNo");
    
    $.ajax({
        type:"GET",
        url : "insertTestSample.do?lng="+latlng.getLng()+"&lat="+latlng.getLat()+"&rentNo="+rentNo,
        dataType : "text",
        error : function() {
            console.log("dddd");
        },
        success : function() {
            console.log(latlng.getLat()+", "+latlng.getLng());
        }
    });
     
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});


</script>

</body>
</html>