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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff" />
<title>Insert title here</title>
</head>

<script type="text/javascript">

</script>
<body>
    <div class="nav-bar">
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
            <div id="active-status" value="" onclick="updateStatus()">
                <i class="fas fa-power-off fa-3x"></i>
            </div>
        </div>
    </div>
   <!--  <div class="nav-bar">
        <h3 class="float-left" id="carSize"></h3>
        <h3 class="float-left" id="carType"></h3>
        <h3 class="float-left" id="capacity"></h3>
        <h3 class="float-left" id="cost"></h3>
    </div> -->
    
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
                    <td id="carNo"></td>
                    <td id="carSize"></td>
                    <td id="carType"></td>
                    <td id="capacity"></td>
                    <td id="cost"></td>
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
                    <td id="rentNo"></td>
                    <td id="userID"></td>
                    <td id="rentDate"></td>
                </tr>
            </tbody>
        </table>
    </div>
    
    
    <div class="contents">
        <div id="map" style="width: 100%; height: 650px;"></div>
    </div>
</body>

<script type="text/javascript">
/* for dropdown box */
$(document).ready(function() {
    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {
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
});

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
    var car_no = as.value;
    if(typeof car_no !== 'undefined') {
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "updateActiveInfo.do?carNo="+car_no,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
            },
            success : function(startYn){
                setColor(as, startYn);
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
    document.getElementById("carNo").innerHTML = typeCheck(detail.carNo); 
    document.getElementById("carSize").innerHTML = typeCheck(detail.carSize);
    document.getElementById("carType").innerHTML= typeCheck(detail.carType);
    document.getElementById("capacity").innerHTML= typeCheck(detail.capacity) + '명';
    document.getElementById("cost").innerHTML= typeCheck(detail.cost) + '원/km';
    map.setCenter(new kakao.maps.LatLng(Number(detail.latitude), Number(detail.longitude)));
    marker.setPosition(map.getCenter());
}

function setRentInfo(rentInfo) {
    document.getElementById("rentNo").innerHTML = typeCheck(rentInfo.rentNo);
    document.getElementById("userID").innerHTML = typeCheck(rentInfo.userID);
    document.getElementById("rentDate").innerHTML = typeCheck(rentInfo.rentDate);
}

function typeCheck(arg) {
    return typeof arg == 'undefined' ? "-" : arg;
}

/* for map */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.507150, 127.058639), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨,
        draggable : true
    };

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
    
});


</script>

<style>

.nav-bar {
    clear: both;
    min-height: 30px;
    width:100%;
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
    z-index:2;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 400px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
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
</html>