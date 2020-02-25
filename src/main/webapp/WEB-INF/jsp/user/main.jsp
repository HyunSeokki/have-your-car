<%@page import="javax.enterprise.inject.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<%@ page session="true" %>
<%
    String id = (String)session.getAttribute("user");
    if(id == null || id.equals("")){
        response.sendRedirect("index.do");
    }
%>
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
<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>Main title</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6557da8a0d87db5a0fc88ef215ba899d&libraries=services"></script>
<script type="text/javascript">
$(document).ready(function() {
    var message = '<%= request.getParameter("message") %>';
    if( message == 'duplicate' ) {
        swal("Already Rented!", "이미 대여된 차량입니다. 다시 선택해주세요.", "error");
        $(".swal-overlay").click(function() {
            <% request.setAttribute("message", ""); %>
        });
    }
    
})
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

function on(carType, carSize, mileage, birth, capacity, cost, imgSrc) {
    $("#detailCarType").text(carType);
    $("#detailCarSize").text(carSize);
    $("#detailCarMileage").text(Math.round(mileage) + 'km');
    $("#detailCarBirth").text(birth.substr(0,7));
    $("#detailCarCapacity").text(capacity + '명');
    $("#detailCarCost").text(cost + '원/km');
    $("#detailCarImgSrc").attr('src', '<c:url value="/'+imgSrc+'"/>');
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}

function myFunction() {
    setTimeout(function() {
        $(".animate-bottom").css({
            'display' : 'block',
            'animation-name' : 'animatebottom',
            'animation-duration': '1s'
        })
    }, 600);

    $('#loader-map').stop(true).animate({'opacity' : 0}, 600, function() {
        $(this).css({'display' : 'none', 'z-index' : '1'})
    });
    
}
</script>
</head>
<body>
<div class="row" id="loader-map" style="position: absolute; width: 100vw; height: 100vh; z-index: 15; background-color:white; text-align:center;">
            <div id="loader">
                <svg class="car" width="102" height="40" xmlns="http://www.w3.org/2000/svg">
                    <g transform="translate(2 1)" stroke="#013469" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
                        <path class="car__body" d="M47.293 2.375C52.927.792 54.017.805 54.017.805c2.613-.445 6.838-.337 9.42.237l8.381 1.863c2.59.576 6.164 2.606 7.98 4.531l6.348 6.732 6.245 1.877c3.098.508 5.609 3.431 5.609 6.507v4.206c0 .29-2.536 4.189-5.687 4.189H36.808c-2.655 0-4.34-2.1-3.688-4.67 0 0 3.71-19.944 14.173-23.902zM36.5 15.5h54.01" stroke-width="3"/>
                        <ellipse class="car__wheel--left" stroke-width="3.2" fill="#FFF" cx="83.493" cy="30.25" rx="6.922" ry="6.808"/>
                        <ellipse class="car__wheel--right" stroke-width="3.2" fill="#FFF" cx="46.511" cy="30.25" rx="6.922" ry="6.808"/>
                        <path class="car__line car__line--top" d="M22.5 16.5H2.475" stroke-width="3"/>
                        <path class="car__line car__line--middle" d="M20.5 23.5H.4755" stroke-width="3"/>
                        <path class="car__line car__line--bottom" d="M25.5 9.5h-19" stroke-width="3"/>
                    </g>
                </svg>
            </div>
            <div style="position: absolute; left:36%; top:48%; font-size:2rem; font-weight:bold; color:#013469; clear:both;">
                <div id="L" style="float:left">L</div>
                <div id="o" style="float:left">o</div>
                <div id="a" style="float:left">a</div>
                <div id="d" style="float:left">d</div>
                <div id="i" style="float:left">i</div>
                <div id="n" style="float:left">n</div>
                <div id="g" style="float:left">g</div>
                <div id="dot1" style="float:left">.</div>
                <div id="dot2" style="float:left">.</div>
                <div id="dot3" style="float:left">.</div>
            </div>
</div>
<div id="overlay" onclick="off()">
    <div class="card" style="width:80vw; top:10vh; left:10vw;">
        <img src="#" class="card-img-top" id="detailCarImgSrc" alt="자동차사진" style="width:60%; margin:30px auto 10px auto;">
        <div class="card-body">
            <h5 class="card-title font-weight-bold" id="detailCarType"></h5>
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
<div  style="height:100vh; width:480px; position: relative;">
    <div id="load-map" class="row" style="position: absolute; width: 480px; height: 700px; z-index: 1;"> 
        <div id="map" style="width:100%;height:100%"></div>
        <form name="data">
            <input type="hidden" name="carNo"/>
            <input type="hidden" name="userID"/>
        </form>
    </div>
    <div class="animate-bottom" style="border-radius: 30px 30px 0px 0px; position:absolute; bottom:0px;  width: 480px; height: 25vh; z-index: 10; background-color: #fff; ">
        <div style="width:480px; height:100%;">
            <div class="row justify-content-center">
                <h4 class="col-12 text-center mt-4">
                                                환영합니다 <span class="font-weight-bold" style="color: #013469;"><%= session.getAttribute("user") %></span> 님
                </h4>
                <p style="color: grey; font-style: italic;">현재 위치 : <span id="myLocation"></span></p>
            </div>
            <div class="row justify-content-around">
                <button class="col-3 text-center btn" onclick="location.href='./logout.do'">
                    <div class="d-flex-inline" >
                        <i class="fas fa-sign-out-alt fa-2x text-primary"></i>
                    </div>
                    <div class="d-flex-inline">
                        <span class="badge badge-primary text-wrap" style="font-size: 0.9rem;">로그아웃</span>
                    </div>
                </button>
                <button class="col-3 text-center btn" onclick="moveCenter();">
                    <div class="d-flex-inline" >
                        <i class="fas fa-map-marked-alt fa-2x text-primary"></i>
                    </div>
                    <div class="d-flex-inline">
                        <span class="badge badge-primary text-wrap" style="font-size: 0.9rem;">I'm here!</span>
                    </div>
                </button>
                <button class="col-3 text-center btn" onclick="location.href='./mypage.do'">
                    <div class="d-flex-inline" >
                        <i class="fas fa-user-circle fa-2x text-primary"></i>
                    </div>
                    <div class="d-flex-inline">
                        <span class="badge badge-primary text-wrap" style="font-size: 0.9rem;">마이페이지</span>
                    </div>    
                </button>               
            </div>
        </div>
    </div>
</div>

<script>
        var clicked_marker = -1;
        var overlay = new Array();
        var map;
        
        function closeOverlay(idx) 
        {
            overlay[idx].setMap(null);    
        } 
        
        function moveCenter(){
            if(clicked_marker != -1)
                closeOverlay(clicked_marker);
            var moveLatLon = new kakao.maps.LatLng(lat, lon);
            map.panTo(moveLatLon);    
        }
        
        function draw()
        {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨 
            }; 
            
            var geocoder = new kakao.maps.services.Geocoder();
            
            map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            var markerPosition = new kakao.maps.LatLng(lat, lon); 
            var marker = new kakao.maps.Marker({ position:markerPosition });
            marker.setMap(map);
            
            imageSize = new kakao.maps.Size(60, 36), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(30, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
            overlay = new Array();
            
            function searchDetailAddrFromCoords(lon, lat, callback) {
                geocoder.coord2Address(lon,lat, callback);
            }
            
            searchDetailAddrFromCoords(lon, lat, function(result, status) {
                if(status == kakao.maps.services.Status.OK){                             
                    var detailAddr = result[0].address.address_name;
                    document.getElementById('myLocation').innerHTML = detailAddr;
                    myFunction();
                } 
            });
            
            
            <c:forEach items="${resultList}" var="result" varStatus="status">

                var markerImage = new kakao.maps.MarkerImage("<c:url value="/${result.imgSrc}"/>", imageSize, imageOption),
                    markerPosition = new kakao.maps.LatLng('${result.latitude}', '${result.longitude}'); // 마커가 표시될 위치입니다
                
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
                '                <img src="<c:url value="/${result.imgSrc}"/>" width="100">' +
                '           </div>' + 
                '               <div class="desc" style="position: relative;">' + 
                '               <div class="ellipsis">${result.carSize}</div>' + 
                '               <div class="jibun ellipsis">${result.capacity}인승</div>' +
                '               <div class="jibun ellipsis" id="addr"></div>'+
                '               <div style="position: absolute; bottom: 10px; right: 10px;">'+
                '                  <button class="btn btn-outline-primary btn-sm sm-btn" type="button" onclick="on(\'${result.carType}\', \'${result.carSize}\', \'${result.mileage}\',\'${result.birth}\', \'${result.capacity}\', \'${result.cost}\', \'${result.imgSrc}\')">상세보기</button>' +
                '                  <button class="btn btn-outline-primary btn-sm sm-btn" type="button" onclick="goRent('+${result.carNo}+');">대여 신청</button>' +
                '               </div>'+
                '           </div>' + 
                '        </div>' + 
                '    </div>'
                ;
            
                overlay['${status.index}'] = new kakao.maps.CustomOverlay({
                    content: content,
                    position: marker.getPosition()       
                });
                
                kakao.maps.event.addListener(marker, 'click', function(mouseClick) {
                    if(clicked_marker != -1) {
                        closeOverlay(clicked_marker);
                    }
                    if(clicked_marker != '${status.index}') {
                        searchDetailAddrFromCoords('${result.longitude}', '${result.latitude}',function(result, status){
                            if(status == kakao.maps.services.Status.OK){                             
                                var detailAddr = result[0].address.address_name;
                                document.getElementById('addr').innerHTML = detailAddr;
                            }                    
                        });
                        
                        clicked_marker = '${status.index}';
                        overlay[clicked_marker].setMap(map);
                        map.panTo(overlay[clicked_marker].getPosition());
                    } else {
                        clicked_marker = -1;
                    }
                });            
                
            </c:forEach>
           
        }
        
        get_loc(draw);
        
        
    </script>
</body>
</html>