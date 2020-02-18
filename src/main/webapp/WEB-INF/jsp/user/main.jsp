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
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<title>Main title</title>
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
function get_loc(callback)
{
    if (navigator.geolocation) {        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) { 
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도
            callback();       
        }, function(position) { // 위치 정보 허용 안함
            lat = 37.506561; // 위도
            lon = 127.05841800000002; // 경도
            callback();
        });
        
    } else { // geolocation 사용 불가
        lat = 37.506561; // 위도
        lon = 127.05841800000002; // 경도
        callback();
    }
}
</script>
</head>
<body>
<div class="container-fluid" style="height:100vh;">
    <div class="row"> 
        <div id="map" style="width:100%;height:1024px;"></div>
        <form name="data">
            <input type="hidden" name="carNo"/>
            <input type="hidden" name="userID"/>
        </form>
    </div>
    <div class="row justify-content-center mt-5">
        <h3 class="col-6 text-center">
            <span class="font-weight-bold"><%= session.getAttribute("user") %></span> 님 환영합니다.
        </h3>
    </div>
    <div class="row justify-content-around mt-5">
            <div class="col-2 text-center" onclick="location.href='./logout.do'">
                <div class="d-flex-inline">
                    <i class="fas fa-sign-out-alt fa-3x"></i>
                </div>
                <div class="d-flex-inline">
                    <span class="badge badge-primary text-wrap" style="font-size: 1rem;">로그아웃</span>
                </div>
            </div>
            <div class="col-2 text-center">
                <div class="d-flex-inline">
                    <i class="fas fa-map-marked-alt fa-3x"></i>
                </div>
                <div class="d-flex-inline">
                    <span class="badge badge-primary text-wrap" style="font-size: 1rem;">I'm here!</span>
                </div>
            </div>
            <div class="col-2 text-center" onclick="location.href='./mypage.do'">
                <div class="d-flex-inline">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
                <div class="d-flex-inline">
                    <span class="badge badge-primary text-wrap" style="font-size: 1rem;">마이페이지</span>
                </div>    
            </div>               
    </div>
</div>

<script>
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        var clicked_marker = -1;
        var overlay = new Array();
        
        function closeOverlay(idx) 
        {
                overlay[idx].setMap(null);     
        }
        
        function draw()
        {
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
            var imageSrc = 'https://cdn0.iconfinder.com/data/icons/isometric-city-basic-transport/48/car-front-01-512.png', // 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(50, 40), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(15, 15)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            //imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            //imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
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
            '                <button class="btn btn-primary" type="button" onclick="goRent('+${result.carNo}+');">대여 신청</button>' +
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
                if(clicked_marker != -1) {
                    closeOverlay(clicked_marker);
                }
                if(clicked_marker != '${status.index}') {
                    clicked_marker = '${status.index}';
                    overlay['${status.index}'].setMap(map);
                } else {
                    clicked_marker = -1;
                }
            });            
            
         // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
            
            </c:forEach>
        }
        
        get_loc(draw);
    </script>
</body>
</html>