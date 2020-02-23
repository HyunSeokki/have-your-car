<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>

<%-- 
    JSP Name : main.jsp
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
<script
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"
    type="text/javascript"></script>
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
    <!-- ${carList}, ${rentList} are needed -->
    <div class="container-fluid">
        <!-- navigation bar -->
        <nav class="navbar navbar-expand navbar-light bg-light">
            <a class="navbar-brand" href="#">WeCar🚗</a>
            <button class="navbar-toggler" type="button"
                data-toggle="collapse" data-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse"
                id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a> <a class="nav-item nav-link" href="register.do">차량등록</a>
                </div>
            </div>
        </nav>

        <!-- map -->
        <div id="map" style="width: 100%; height: 800px;"></div>
    </div>
    <script type="text/javascript">
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(37.50725021667501, 127.0683692829022), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
    
        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var imageSize = new kakao.maps.Size(60, 36), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(30, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
        var markers = new Array();
        var overlay = new Array();
        
        <c:forEach items="${carList}" var="car">
            var markerImage = new kakao.maps.MarkerImage("<c:url value="/${car.imgSrc}"/>", imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng('${car.latitude}', '${car.longitude}'); // 마커가 표시될 위치입니다
        
            markers['${car.carNo}'] = new kakao.maps.Marker({
                position: markerPosition, 
                image: markerImage // 마커이미지 설정 
            });
        
            /* marker 지도에 나타내기*/
            markers['${car.carNo}'].setMap(map);
            
            /* marker 위에 overlay 표시 */
            var content = 
                '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title">' + 
                '            <div id="overlay${car.carNo}"></div>' + 
                '        </div>' + 
                '    </div>' + 
                '</div>';
                
            overlay['${car.carNo}'] = new kakao.maps.CustomOverlay({
                content: content,
                position: markers['${car.carNo}'].getPosition()       
            });
                
            overlay['${car.carNo}'].setMap(map);
        </c:forEach>
        <c:forEach items="${rentList}" var="rent">
            $("#overlay${rent.carNo}").text('${rent.userID}');
        </c:forEach>
        
        var getPositionInterval;
        function setCurrentPosition() {
            getPositionInterval = setInterval(function() {
                getCurrentPosition();
            }, 1000);
        }

        function getCurrentPosition() {
            $.ajax({
                url : "getCurrentPosition.do",
                dataType : "text",
                contentType : "application/json; charset=UTF-8",
                type : "GET",
                cache : false,
                error : function(message) {
                    console.log(message);
                    console.log("통신실패");
                },
                success : function(args) { // data
                    var carList = JSON.parse(args).carList;
                    var rentList = JSON.parse(args).rentList;
                    
                    for(var index in carList) {
                        var car = carList[index];
                        $("#overlay"+car.carNo).text('');
                        if(markers[car.carNo].getPosition().getLat() != car.latitue || markers[car.carNo].getPosition().getLng() != car.longitude) {
                            markers[car.carNo].setPosition(new kakao.maps.LatLng(car.latitude, car.longitude));
                            overlay[car.carNo].setPosition(markers[car.carNo].getPosition());
                        }
                    }
                    
                    for(var index in rentList) {
                        var rent = rentList[index];
                        $("#overlay"+rent.carNo).text(rent.userID);
                    }
                }
            });
        }
        /* 페이지 벗어날 때 Interval clear */
        jQuery(window).blur(function() {
            if(getPositionInterval !== undefined)
                clearInterval(getPositionInterval);
        });
        /* 페이지 들어오면 set Interval */
        jQuery(window).focus(function() {
            clearInterval(getPositionInterval);
            setCurrentPosition();
        })
    </script>
</body>
</html>