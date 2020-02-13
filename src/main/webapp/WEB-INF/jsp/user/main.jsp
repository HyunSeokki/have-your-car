<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<%@ page session="true" %>
<%-- 
    JSP Name : main.jsp
    Description : 설명을 기술합니다.
    author OHS
    since 2020. 2. 10.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 10.     OHS        최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main title</title>

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .btn1 {margin-left:90%;background-color: #3498db; border-bottom: 5px solid #2980B9; text-shadow: 0px -2px #2980B9; position: relative; padding: 10px 40px; border-radius: 3px; font-family: 'Lato', sans-serif; font-size: 15px; color: #FFF; text-decoration: none;}
    #map {margin: 15px 0 0 0;}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6557da8a0d87db5a0fc88ef215ba899d"></script>
<script>

function goRent(carNo)
{
    var rent = document.data;
            
    rent.carNo.value = carNo;
    rent.userID.value = "<%=(String)session.getAttribute("user")%>";
    
    rent.action = "./rent.do";
    rent.method = "post";
    rent.submit();    
}

var lat, lon;
function get_loc(callback){
    if (navigator.geolocation) {        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도
            
            callback();       
          });
        
    } else {
        lat = 37.506561; // 위도
        lon = 127.05841800000002; // 경도
        
        callback();
    }
}
</script>
</head>
<body>
    <span><%= session.getAttribute("user") %> 님 환영합니다.</span>
    <a href="logout.do">로그아웃</a>
    <button class="btn1" type="button" onclick="location.href='./mypage.do'">My page</button>
    
    <div id="map" style="width:100%;height:600px;"></div>
    <form name="data">
        <input type="hidden" name="carNo"/>
        <input type="hidden" name="userID"/>
    </form>
<script>
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 

    function draw(){
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
            //center: new kakao.maps.LatLng(37.506561, 127.05841800000002), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨 
        }; 
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        var markerPosition = new kakao.maps.LatLng(lat, lon); 
        //var markerPosition = new kakao.maps.LatLng(37.506561, 127.05841800000002);
        var marker = new kakao.maps.Marker({ position:markerPosition });
        
        marker.setMap(map);
        
        // 자동차
        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
        overlay = new Array();
        
        <c:forEach items="${resultList}" var="result" varStatus="status">
        //alert('${status.index}');
         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다            
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng('${result.latitude}', '${result.longitude}'); // 마커가 표시될 위치입니다
        
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition, 
            image: markerImage // 마커이미지 설정 
             });
        
        marker.setMap(map);
        
        var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '            ${result.carType}' + 
        '            <div class="close" onclick="closeOverlay('+${status.index}+')" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis">${result.carSize}</div>' + 
        '                <div class="jibun ellipsis">${result.capacity}인승</div>' +
        '                <button class="btn2" type="button" onclick="goRent('+${result.carNo}+');">대여 신청</button>' +
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';
    
        // 마커 위에 커스텀오버레이를 표시합니다
        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
        overlay['${status.index}'] = new kakao.maps.CustomOverlay({
            content: content,
            //map: map, // 주석처리할 것
            position: marker.getPosition()       
        });
        
        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            overlay['${status.index}'].setMap(map);
        });            
        
     // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
        function closeOverlay(idx) {
            overlay[idx].setMap(null);     
        }
        </c:forEach>
    }
    
    get_loc(draw);
</script>
</body>
</html>