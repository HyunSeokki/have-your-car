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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
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

function on(carType, carSize, mileage, birth, capacity, cost) {
    console.log(carType, carSize, mileage, birth, capacity, cost);
    $("#detailCarType").text(carType);
    $("#detailCarSize").text(carSize);
    $("#detailCarMileage").text(mileage + 'km');
    $("#detailCarBirth").text(birth.substr(0,7));
    $("#detailCarCapacity").text(capacity + '명');
    $("#detailCarCost").text(cost + '원/km');
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}
</script>
</head>
<body>
<div id="overlay" onclick="off()">
    <div class="card" style="width:80vw; top:10vh; left:10vw;">
        <!-- 임의로 지정한 url -- car에 경로 설정하고 디비에 넣을 경우, on 함수에서 같이 수정한다.-->
        <img src="<c:url value="/resources/img/sonata.jpg" />" class="card-img-top" alt="소나타"/>
        <div class="card-body">
            <h5 class="card-title" id="detailCarType"></h5>
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">차 타입</th>
                        <td class="card-text" id="detailCarSize"></td>
                    </tr>
                    <tr>
                        <th scope="row">총 주행거리</th>
                        <td class="card-text" id="detailCarMileage"></td>
                    </tr>
                    <tr>
                        <th scope="row">연식</th>
                        <td class="card-text" id="detailCarBirth"></td>
                    </tr>
                    <tr>
                        <th scope="row">수용인원</th>
                        <td class="card-text" id="detailCarCapacity"></td>
                    </tr>
                    <tr>
                        <th scope="row">가격</th>
                        <td class="card-text" id="detailCarCost"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container-fluid" style="height:100vh;">
    <div class="row"> 
        <div id="map" style="width:480px;height:600px;"></div>
        <form name="data">
            <input type="hidden" name="carNo"/>
            <input type="hidden" name="userID"/>
        </form>
    </div>
    <div class="row justify-content-center mt-4">
        <h4 class="col-6 text-center">
            <span class="font-weight-bold"><%= session.getAttribute("user") %></span> 님 환영합니다.
        </h4>
    </div>
    <div class="row justify-content-around mt-4">
            <div class="col-3 text-center" onclick="location.href='./logout.do'">
                <div class="d-flex-inline">
                    <i class="fas fa-sign-out-alt fa-2x"></i>
                </div>
                <div class="d-flex-inline">
                    <span class="badge badge-primary text-wrap" style="font-size: 0.9rem;">로그아웃</span>
                </div>
            </div>
            <div class="col-3 text-center" onclick="moveCenter();">
                <div class="d-flex-inline">
                    <i class="fas fa-map-marked-alt fa-2x"></i>
                </div>
                <div class="d-flex-inline">
                    <span class="badge badge-primary text-wrap" style="font-size: 0.9rem;">I'm here!</span>
                </div>
            </div>
            <div class="col-3 text-center" onclick="location.href='./mypage.do'">
                <div class="d-flex-inline">
                    <i class="fas fa-user-circle fa-2x"></i>
                </div>
                <div class="d-flex-inline">
                    <span class="badge badge-primary text-wrap" style="font-size: 0.9rem;">마이페이지</span>
                </div>    
            </div>               
    </div>
</div>

<script>
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        var clicked_marker = -1;
        var overlay = new Array();
        var map;
        
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
            
            map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
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
            console.log('${result}')
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
                '            <div>${result.carType}</div>' + 
                '            <div class="close" onclick="closeOverlay('+${status.index}+')" title="닫기"></div>' + 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc">' + 
                '                <div class="ellipsis">${result.carSize}</div>' + 
                '                <div class="jibun ellipsis">${result.capacity}인승</div>' +
                '                <button class="btn btn-outline-primary" type="button" onclick="on(\'${result.carType}\', \'${result.carSize}\', \'${result.mileage}\',\'${result.birth}\', \'${result.capacity}\', \'${result.cost}\')">상세보기</button>' +
                '                <button class="btn btn-outline-primary" type="button" onclick="goRent('+${result.carNo}+');">대여 신청</button>' +
                '            </div>' + 
                '        </div>' + 
                '    </div>'
                ;
            
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
                        map.panTo(new kakao.maps.LatLng(lat, lon))
                    }
                    if(clicked_marker != '${status.index}') {
                        clicked_marker = '${status.index}';
                        overlay[clicked_marker].setMap(map);
                        map.panTo(overlay[clicked_marker].getPosition());
                    } else {
                        clicked_marker = -1;
                    }
                });            
                
             // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
            
            </c:forEach>
        }
        
        get_loc(draw);
        
        function moveCenter(){
            var moveLatLon = new kakao.maps.LatLng(lat, lon);
            
            map.panTo(moveLatLon);    
        }
    </script>
</body>
</html>