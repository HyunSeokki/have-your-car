<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>

<%-- 
    JSP Name : carTest.jsp
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff"></script>
<title>Insert title here</title>
</head>
<body>
    <!-- ready options -->
    <script type="text/javascript">
        $(document).ready(function() {
            setActiveStatus();
        });
    </script>
    
    <div class="container-fluid">
        <div class="row justify-content-center my-3">
            <div class="col-10"> 
                <div class="row justify-content-center my-3">
                    <div class="col-2 text-center">
                        <button type="button" class="btn btn-primary" id="active-status" onclick="updateStatus()">
                            <i class="fas fa-power-off fa-3x"></i>
                        </button>
                    </div>
                </div>
                <div class="row my-3">
                    <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">차번호</th>
                                <th scope="col">차크기</th>
                                <th scope="col">차종</th>
                                <th scope="col">인원</th>
                                <th scope="col">가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="carNo">${ carInfo.carNo }</td>
                                <td id="carSize">${ carInfo.carSize }</td>
                                <td id="carType">${ carInfo.carType }</td>
                                <td id="capacity">${ carInfo.capacity }</td>
                                <td id="cost">${ carInfo.cost }</td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">대여번호</th>
                                <th scope="col">대여자</th>
                                <th scope="col">대여날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="rentNo">${ rentInfo.rentNo }</td>
                                <td id="userID">${ rentInfo.userID }</td>
                                <td id="rentDate">${ rentInfo.rentDate }</td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
                
                <!-- Map -->
                <div class="map_wrap my-3">
                    <div id="mapWrapper"
                        style="width: 50%; height: 700px; float: left">
                        <div id="map" style="width: 100%; height: 100%"></div>
                        <!-- 지도를 표시할 div 입니다 -->
                    </div>
                    <div id="rvWrapper"
                        style="width: 50%; height: 700px; float: left">
                        <div id="roadview" style="width: 100%; height: 100%"></div>
                        <!-- 로드뷰를 표시할 div 입니다 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
    /* for active-status color */
    function setActiveStatus() {
        var as = document.getElementById("active-status");
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "selectCar.do?carNo=${carInfo.carNo}",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            contentType : 'application/json; charset=utf-8',
            error : function(message){
                console.log(message);
                as.style.color = "gray";
            },
            cache: false,
            success : function(activeStatus){
                setColor(as, activeStatus);
            }
        });
    }

    /* if click on/off button, then update and color change */
    function updateStatus() {
        var as = document.getElementById("active-status");
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "updateActiveInfo.do?carNo=${carInfo.carNo}", //호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            contentType : 'application/json; charset=utf-8',
            error : function(message) {
                console.log(message)
            },
            cache: false,
            success : function(activeStatus) {
                setColor(as, activeStatus);
                if(activeStatus == "Y") {
                    alert("시동을 켰습니다. 지도를 움직여 주행을 시작하세요.")
                    map.setDraggable(true);
                    map.setZoomable(true);
                    startDriving();
                } else if(activeStatus == "N") {
                    endDriving();
                    alert("주행을 끝내고 시동을 껐습니다. 시스템을 종료합니다.")
                    map.setDraggable(false);
                    map.setZoomable(false);
                    window.close();
                }
            }
        });
    }

    /* for coloring  */
    function setColor(as, startYn) {
        if (startYn == 'Y') {
           as.style.color = "white";
        } else if (startYn == 'N') {
           as.style.color = "black";
        }
    }

    /* for map */
    var mapWrapper = document.getElementById('mapWrapper'); //지도를 감싸고 있는 DIV태그

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapCenter = new kakao.maps.LatLng("${carInfo.latitude}", "${carInfo.longitude}"), // 지도의 가운데 좌표
    mapOption = {
        center : mapCenter, // 지도의 중심좌표
        level : 2,// 지도의 확대 레벨
        draggable : false
    };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW); //지도 위에 로드뷰 도로 올리기

    var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
    var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
    var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

    toggleRoadview(mapCenter);

    // 마커 이미지를 생성합니다.
    var markImage = new kakao.maps.MarkerImage(
            'https://cdn0.iconfinder.com/data/icons/isometric-city-basic-transport/48/car-front-01-512.png',
            new kakao.maps.Size(50, 40), {
                offset : new kakao.maps.Point(15, 15)
            });

    // 드래그가 가능한 마커를 생성합니다.
    var rvMarker = new kakao.maps.Marker({
        image : markImage,
        position : mapCenter,
        draggable : false,
        map : map
    });

    //마커에 drag 이벤트를 할당합니다
    kakao.maps.event.addListener(map, 'drag', function(mouseEvent) {
        var position = map.getCenter(); //현재 마커가 놓인 자리의 좌표
        rvMarker.setPosition(position);
        toggleRoadview(position); //로드뷰를 토글합니다
    });

    kakao.maps.event.addListener(map, 'zoom_start', function() {
        map.setDraggable(false);
    });

    kakao.maps.event.addListener(map, 'zoom_changed', function() {
        map.setCenter(rvMarker.getPosition());
        map.setDraggable(true);
    });

    //로드뷰 toggle함수
    function toggleRoadview(position) {
        //전달받은 좌표(position)에 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄웁니다
        rvClient.getNearestPanoId(position, 50, function(panoId) {
            mapWrapper.style.width = '50%';
            map.relayout(); //지도를 감싸고 있는 영역이 변경됨에 따라, 지도를 재배열합니다
            rvContainer.style.display = 'block'; //로드뷰를 넣은 컨테이너를 보이게합니다
            rv.setPanoId(panoId, position); //panoId를 통한 로드뷰 실행
            rv.relayout(); //로드뷰를 감싸고 있는 영역이 변경됨에 따라, 로드뷰를 재배열합니다
        });
    }

    var drivingInfo = new Array();
    var logDataInterval, sendDataInterval;

    
    function startDriving() {
        logDataInterval = setInterval(function() {
            var markerPosition = rvMarker.getPosition();
            var intervalPosition = {
                rentNo : "${rentInfo.rentNo}",
                latitude : markerPosition.getLat(),
                longitude : markerPosition.getLng(),
                timeStamp : new Date().getTime()
            };
            drivingInfo.push(intervalPosition);
        }, 1000);

        sendDataInterval = setInterval(insertDrivingInfo, 60001);
    }

    function insertDrivingInfo() {
        var jsonData = JSON.stringify(drivingInfo);
        console.log(jsonData);
        drivingInfo = new Array(); // 초기화

        $.ajax({
            url : "insertDrivingInfo.do",
            dataType : "text",
            contentType : "application/json; charset=UTF-8",
            type : "POST",
            data : jsonData,
            success : function() {
            },
            cache : false,
            error : function(message) {
                console.log(message);
                console.log("통신실패");
            }
        });
    }

    function endDriving() {
        if (logDataInterval === undefined)
            alert('아직 주행이 시작되지 않았습니다. 주행을 시작하세요!');
        else {
            clearInterval(logDataInterval);
            clearInterval(sendDataInterval);

            if (drivingInfo.length != 0) {
                insertDrivingInfo();
            }
        }
    }
</script>

<style>
.map_wrap {
    overflow: hidden;
    height: 700px;
}

#active-status {
    color: gray;
}
</style>
</body>
</html>