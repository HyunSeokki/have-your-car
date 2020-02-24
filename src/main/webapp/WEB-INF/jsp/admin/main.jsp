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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<title>WeCar DashBoard</title>
</head>
<body>
    <!-- ${carList}, ${rentList} are needed -->
    <div class="container-fluid">
        <!-- navigation bar -->
        <div class="row justify-content-around">
            <div class="col-4 title-common" style="color: #013469!important; clear:both;">
                    <div class="text-center" style="float:left; padding:0px 10px;">
                        <a class="active" style="color:#013469;" href="../basic/logout.do">
                            <i class="fas fa-sign-out-alt fa-2x"></i>
                            <div class="badge" style="display: block;">로그아웃</div>
                        </a>
                    </div>
                    <div class="text-center" style="float:left; padding:0px 10px;">
                        <a class="active" style="color:#013469;" href="#">
                            <i class="fas fa-home fa-2x"></i>
                            <div class="badge" style="display: block;">HOME</div>
                        </a>
                    </div>
                    <div class="text-center" style="float:left; padding:0px 10px;">
                        <a class="active" style="color:#013469;" href="register.do">
                            <i class="fas fa-car fa-2x"></i>
                            <div class="badge" style="display: block;">차량등록</div>
                        </a>
                    </div>
            </div>
            <div class="col-4 text-center  title-common title-board">Admin DashBoard</div>
            <div class="col-4 align-self-center text-right pr-5" id="status-user" style="clear:both; font-size:1.5rem">현재 운행 중인 차량 수 :&nbsp;<span id="user-num">0</span>
                <span class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false" style="color:#fff; background-color:#013469;"></button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="right:0px; left:auto; font-size:1.5rem; width:250px">
                        <table class="table table-hover" style="color:#013469;">
                          <thead>
                            <tr>
                              <th scope="col">No.</th>
                              <th scope="col">차 이름</th>
                              <th scope="col">대여자</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${carList}" var="car">
                                <tr onclick="mapGetCenter('${car.carNo}')" style="cursor:pointer;">
                                  <th>${ car.carNo }</th>
                                  <td>${ car.carType }</td>
                                  <td id="rentUser${car.carNo}"></td>
                                </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                    </div>
                </span>
            </div>
        </div>
        
        <!-- map -->
        <div id="map" style="width: 100%; height: 800px;"></div>
    </div>
    <script type="text/javascript">
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(37.50725021667501, 127.0683692829022), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
    
        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var imageSize = new kakao.maps.Size(60, 36), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(30, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
        var markers = new Array();
        var overlay = new Array();
        var userNum = 0;
        
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
                '</div>' + 
                '<div class="wrapTime">' + 
                '   <div class="info"> ' + 
                '       <div class="title">' + 
                '           <div id="time${car.carNo}"></div>' + 
                '       </div>' +
                '   </div>' + 
                '</div>';
                
            overlay['${car.carNo}'] = new kakao.maps.CustomOverlay({
                content: content,
                position: markers['${car.carNo}'].getPosition()       
            });
                
            overlay['${car.carNo}'].setMap(map);
        </c:forEach>
        <c:forEach items="${rentList}" var="rent">
            $("#overlay${rent.carNo}").text('${rent.userID}');
            $("#rentUser${rent.carNo}").text('${rent.userID}');
            $("#time${rent.carNo}").text('');
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
                        $("#time"+car.carNo).text('');
                        $("#rentUser"+car.carNo).text('');
                        if(markers[car.carNo].getPosition().getLat() != car.latitue || markers[car.carNo].getPosition().getLng() != car.longitude) {
                            markers[car.carNo].setPosition(new kakao.maps.LatLng(car.latitude, car.longitude));
                            overlay[car.carNo].setPosition(markers[car.carNo].getPosition());
                        }
                    }
                    
                    var now = new Date().getTime();
           
                    for(var index in rentList) {
                        var rent = rentList[index];
                        var dateString = rent.rentDate;
                        var convert = dateString.substring(0,4) + "/" + dateString.substring(4,6) +
                        "/" + dateString.substring(6,8) + " " + dateString.substring(8,10) + ":" + 
                        dateString.substring(10,12) + ":" + dateString.substring(12,14);
                        var getDate = new Date(convert).getTime();
                        var strPeriod = now - getDate;
                        var pDay = strPeriod / (60*60*24*1000);
                        var strDay = Math.floor(pDay);
                        var pHour = (strPeriod - (strDay * (60*60*24*1000))) / (60*60*1000);
                        var strHour = Math.floor(pHour);
                        var strMinute = Math.floor((strPeriod - (strDay * (60*60*24*1000)) - (strHour * (60*60*1000))) / (60*1000));
                        var timeText = "방금";
                        if(strHour>0) timeText = strHour+"시간, "+strMinute+"분 경과";
                        else if(strHour==0 && strMinute>0) timeText = strMinute+"분 경과";                        
                        $("#overlay"+rent.carNo).text(rent.userID);
                        $("#time"+rent.carNo).text(timeText);
                        $("#rentUser"+rent.carNo).text(rent.userID);

                    }
                    
                    document.getElementById("user-num").innerHTML = rentList.length;
                    
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
        
        function mapGetCenter(carNo) {
            map.setLevel(5);
            map.panTo(markers[carNo].getPosition());
        }
    </script>
</body>
</html>