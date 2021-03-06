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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff"></script>
<title>Insert title here</title>
</head>

<body>
    <div class="nav-bar top-side">
        <div class="dropdown float-left">
            <button onclick="myFunction()" class="dropbtn">Dropdown</button>
            <div id="myDropdown" class="dropdown-content">
                <c:forEach var="car" items="${carList}" varStatus="status">
                    <div class="dropdown-item" onclick="getDetail(${car.carNo})">
                        <div class="dropdown-component dropdown-number"> ${car.carNo}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="float-left">
            <button id="active-status" value="" onclick="updateStatus()">
                <i class="fas fa-power-off fa-3x"></i>
            </button>
        </div>
    </div>
    
    <div class = "nav-bar">
        <table class="car-info-table float-left" border="1">
            <caption style="text-align:left;">차 정보</caption>
            <thead>
                <tr>
                    <th>차번호</th>
                    <th>차크기</th>
                    <th>차종</th>
                    <th>인원</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td id="carNo">-</td>
                    <td id="carSize">-</td>
                    <td id="carType">-</td>
                    <td id="capacity">-</td>
                    <td id="cost">-</td>
                </tr>
            </tbody>
        </table>
        <table class="rent-info-table float-left" border="1">
            <caption style="text-align:left;">대여 정보</caption>
            <thead>
                <tr>
                    <th>대여번호</th>
                    <th>대여자</th>
                    <th>대여날짜</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td id="rentNo">-</td>
                    <td id="userID">-</td>
                    <td id="rentDate">-</td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <!-- Map -->
    <div class="contents">
        <div>
            <button onclick="startDriving()">주행 시작</button>
            <button onclick="endDriving()">주행 종료</button>
        </div>
        <div class="map_wrap">
            <div id="mapWrapper"
                style="width: 50%; height: 300px; float: left">
                <div id="map" style="width: 100%; height: 100%"></div>
                <!-- 지도를 표시할 div 입니다 -->
            </div>
            <div id="rvWrapper"
                style="width: 50%; height: 300px; float: left">
                <div id="roadview" style="width: 100%; height: 100%"></div>
                <!-- 로드뷰를 표시할 div 입니다 -->
            </div>
        </div>
    </div>


<script type="text/javascript">
/* for dropdown box */
window.onclick = function(event) {
    matches = event.target.matches ? event.target.matches('.dropbtn') : event.target.msMatchesSelector('.dropbtn');
    if (!matches) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}


function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

/* for get Detail */
function getDetail(carNo) {
    var as = document.getElementById("active-status");
    $.ajax({
        type : "GET", //전송방식을 지정한다 (POST,GET)
        url : "selectCar.do?carNo="+carNo,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        contentType : 'application/json; charset=utf-8',
        error : function(message){
            console.log(message);
            as.style.color = "gray";
        },
        success : function(car){
            as.value = carNo;
            setDetail({});
            setRentInfo({});
            
            var carInfo = JSON.parse(car);
            var detail = carInfo.detail;
            var activeStatus = carInfo.activeStatus.startYn;
            var rentInfo = carInfo.rentInfo;
            
            setColor(as, activeStatus);
            setDetail(detail);
            setRentInfo(rentInfo);
        }
    });
}

/* if click on/off button, then update and color change */
function updateStatus() {
    var as = document.getElementById("active-status");
    var car_no = document.getElementById("carNo").textContent;
    console.log(car_no);
    if(car_no != '-') {
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "updateActiveInfo.do?carNo="+car_no,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(message){
                console.log(message)
            },
            success : function(startYn){
                setColor(as, startYn);
                console.log(car_no, startYn);
            }
        });
    } else {
        alert("차량을 선택해주세요.");
    }
}

/* for coloring  */
function setColor(as, startYn) {
    if(startYn == 'Y') {
        as.style.color = "blue";
    } else if (startYn == 'N') {
        as.style.color = "black";               
    }
}

/* for put data */
function setDetail(detail) {
    document.getElementById("carNo").innerText = typeCheck(detail.carNo); 
    document.getElementById("carSize").innerText = typeCheck(detail.carSize);
    document.getElementById("carType").innerText= typeCheck(detail.carType);
    document.getElementById("capacity").innerText= typeCheck(detail.capacity) + '명';
    document.getElementById("cost").innerText= typeCheck(detail.cost) + '원/km';
    map.setCenter(new kakao.maps.LatLng(Number(detail.latitude), Number(detail.longitude)));
    rvMarker.setPosition(map.getCenter());
}

function setRentInfo(rentInfo) {
    document.getElementById("rentNo").innerText = typeCheck(rentInfo.rentNo);
    document.getElementById("userID").innerText = typeCheck(rentInfo.userID);
    document.getElementById("rentDate").innerText = typeCheck(rentInfo.rentDate);
}

function typeCheck(arg) {
    return typeof arg == 'undefined' ? "-" : arg;
}

/* for map */
    var mapWrapper = document.getElementById('mapWrapper'); //지도를 감싸고 있는 DIV태그

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapCenter = new kakao.maps.LatLng(37.507150, 127.058639), // 지도의 가운데 좌표
    mapOption = {
        center : mapCenter, // 지도의 중심좌표
        level : 3
    // 지도의 확대 레벨
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
        draggable : true,
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
        if(document.getElementById("active-status").style.color != 'blue') { // 시동이 안걸림
           alert("먼저 시동을 걸어주세요");            
        }
        else {
            
            var rentNo = document.getElementById("rentNo");
            
            logDataInterval = setInterval(function() {
                var markerPosition = rvMarker.getPosition();
                var intervalPosition = {
                    rentNo : rentNo,
                    latitude : markerPosition.getLat(),
                    longitude : markerPosition.getLng(),
                    timeStamp : new Date().getTime()
                };
                drivingInfo.push(intervalPosition);
            }, 1000);
    
            sendDataInterval = setInterval(function() {
                var jsonData = JSON.stringify(drivingInfo);
                console.log(jsonData);
                drivingInfo = new Array(); // 초기화
    
                $.ajax({
                    url : "insertDrivingInfo.do",
                    dataType : "text",
                    contentType : "application/json; charset=UTF-8",
                    type : "POST",
                    data : jsonData,
                    success : function(data) {
                        console.log(data);
                    },
                    error : function(message) {
                        console.log(message);
                        console.log("통신실패");
                    }
                });
    
            }, 60001);

        }
    }

    function endDriving() {
        if(logDataInterval === undefined)
            alert('아직 주행이 시작되지 않았습니다. 주행을 시작하세요!');
        else {
            clearInterval(logDataInterval);
            clearInterval(sendDataInterval);
        }
    }


</script>

<style>

.contents {
    clear:both;
}

.map_wrap {
    overflow: hidden;
    height: 330px
}

.top-side {
    z-index: 4;
}

.nav-bar {
    clear: both;
    min-height: 30px;
    width:100%;
    position: relative;
}

.rent-info-table {  
    width:40%;
}

.car-info-table {
    width:40%;
}

.float-left {
    float: left;
    padding: 3px 5px;
}

#active-status {
    margin: 0px auto;
    width: 144px;
    color: gray;
}

/* Dropdown Button */
.dropbtn {
    background-color: #3498DB;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
    background-color: #2980B9;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 400px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-component {
    padding: 8px 16px;
    float: left;
}

.dropdown-number {
    font-weight: bold;
}

/* Links inside the dropdown */
.dropdown-content .dropdown-item {
    color: black;
    padding: 0px 16px;
    text-decoration: none;
    height: 40px;
    display: block;
    both: clear
}

/* Change color of dropdown links on hover */
.dropdown-content .dropdown-item:hover {
    background-color: #ddd
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
    display: block;
}
</style>
</body>
</html>