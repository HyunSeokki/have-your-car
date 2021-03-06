<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<%@ page session="true"%>
<%
    String id = (String) session.getAttribute("user");

			if (id == null || id.equals("")) {
				response.sendRedirect("index.do");
			}
%>
<%-- 
    JSP Name : mypage.jsp
    Description : 마이페이지 jsp(자신의 대여 리스트 확인)
    author ableFrame
    since 2020. 2. 10.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 10.     ableFrame     	최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>

<script type="text/javaScript" language="javascript"></script>
<!-- jQuery  -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- bootstrap JS -->
<script
    src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<!-- bootstrap CSS -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/mypage.css" />" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <h1 id="title">MyTrip</h1>

        <div id=ctrlContainer class="row justify-content-between">
            <div class="col">
                <button class="btn btn-icon-mypage" onclick="history.go(-1)">
                    <i class="fas fa-arrow-left icon"></i> 
                </button>
                <button class="btn btn-icon-mypage">
                    <i class="fas fa-car icon"></i> 
                </button>
                <button class="btn btn-icon-mypage" onclick="location.href='./main.do'">
                    <i class="fas fa-home icon"></i>
                </button>
            </div>
            <p class="col text-right" style="margin: 0.5rem;">
                <span style="color: #013469;"><%=session.getAttribute("user")%></span>님, 안녕하세요.
            </p>

        </div>
        <div class="table-responsive" style = "border-bottom: solid 1px; margin: 0px; padding: 0px; border-color: #CCCEDB;">
            <table id="rentTable" width="90%" class="table table-hover text-center">
                <thead>
                    <tr>
                        <th style="width:20%;">대여번호</th>
                        <th style="width:30%">차종</th>
                        <th>대여날짜</th>
                        <th>반납날짜</th>
                        <!-- <th>사용자</th> -->
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty myRentList}">
                            <tr>
                                <td colspan="5" align="center">빌린 내역이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="result" items="${myRentList}" varStatus="status">
                                <tr style="cursor:pointer;">
                                    <td id="rentNo" style="width:20%; vertical-align: middle;"><c:out value="${result.rentNo }" /></td>
                                    <td id="carType" style="width:30%; vertical-align: middle;">
                                    <c:forEach var="car" items="${carList }">
                                        <c:if test="${car.carNo eq result.carNo}">
                                            <c:out value="${car.carType}" />
                                        </c:if>
                                    </c:forEach>
                                    </td>
                                    <td id="rentDate">
                                        <c:set var="red" value="${result.rentDate}"/>
                                        <c:out value="${fn:substring(red, 0,4)}"/>/<c:out value="${fn:substring(red, 4,6) }"/>/<c:out value="${fn:substring(red, 6,8) }"/>&nbsp;
                                        <c:out value="${fn:substring(red, 8,10) }"/>:<c:out value="${fn:substring(red, 10,12) }"/>:<c:out value="${fn:substring(red, 12,14) }"/>
                                    </td>
                                    
                                    <td id="returnDate">
                                        <c:set var="ret" value="${result.returnDate}"/>
                                        <c:out value="${fn:substring(ret, 0,4)}"/>/<c:out value="${fn:substring(ret, 4,6) }"/>/<c:out value="${fn:substring(ret, 6,8) }"/>&nbsp;
                                        <c:out value="${fn:substring(ret, 8,10) }"/>:<c:out value="${fn:substring(ret, 10,12) }"/>:<c:out value="${fn:substring(ret, 12,14) }"/>
                                    </td>
                                    <%-- <td id = "userId"><c:out value="${result.userID }" /></td> --%>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-dialog modal-dialog-centered"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="fas fa-check"></i> RentInfo
                        </h5>
                        <button type="button" class="close"
                            data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>

                    <!-- 지도생성 -->
                    <div id="map_container">
                        <div id="map"></div>
                        <script type="text/javascript"
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e59a0e357c5eaa690aa6f65b5549031c"></script>
                        <script>
                            var container = document
                                    .getElementById('map');
                            var options = {
                                center : new kakao.maps.LatLng(
                                        37.507381428880635,
                                        127.05895942121612),
                                level : 3
                            };
                            var map = new kakao.maps.Map(
                                    container,
                                    options);
                            container.style.width = '100%';
                            container.style.height = '38vh';
                            var bounds = new kakao.maps.LatLngBounds();
                        </script>
                    </div>

                    <script>
                    $("#rentTable tr").click(
                        function() {
                            var str = ""
                            var tdArr = new Array(); // 배열 선언       
                            // 현재 클릭된 Row(<tr>)
                            var tr = $(this);
                            var td = tr.children();
                            td.each(function(i) {
                                tdArr.push(td.eq(i).text());
                            });

                            var rentNo = td.eq(0).text();

                            if (isNaN(rentNo) == false) {
                                $.ajax({
                                    type : "GET",
                                    url : "mypagedetail.do?rentNo="+ rentNo,
                                    dataType : 'text',
                                    contentType : 'application/json; charset=utf-8',
                                    success : function(args) {
                                        var trip = JSON.parse(args).data;
                                        var carInfo = JSON.parse(args).data2;
                                        var carType = carInfo.carType;
                                        var carSize = carInfo.carSize;
                                        var birth = carInfo.birth;
                                        var capacity = carInfo.capacity;
                                        var cost = carInfo.cost;
                                        var carImgSrc = carInfo.imgSrc;
                                        document.getElementById("carN").innerHTML = carType;
                                        document.getElementById("carS").innerHTML = carSize;
                                        document.getElementById("carB").innerHTML = birth.split(" ")[0];
                                        document.getElementById("carC").innerHTML = capacity;
                                        document.getElementById("carCo").innerHTML = cost;
                                        $('#carImg').attr('src', '<c:url value="/'+carImgSrc+'"/>');
                                        
                                        var linePath = new Array();
                                        for (var i = 0; i < Object.keys(trip).length; i++) {
                                            var temp = new kakao.maps.LatLng(trip[i].latitude, trip[i].longitude);
                                            linePath.push(temp);
                                            bounds.extend(temp);
                                        }

                                        var polyline = new kakao.maps.Polyline(
                                            {
                                                path : linePath,
                                                strokeWeight : 5,
                                                strokeColor : '#013469',
                                                strokeOpacity : 0.7,
                                                strokeStyle : 'solid'
                                            });
                                        polyline.setMap(map);
                                        map.setBounds(bounds);
                                    },
                                    error : function(request,status,error) {
                                        console.log("연결실패");
                                        console.log(request);
                                    },
                                    cache : false
                                });

                                var modal = document.getElementById("myModal");

                                modal.style.display = 'block';
                                map.relayout();
                                var modal = document.getElementById('myModal');
                                var span = document.getElementsByClassName("close")[0];
                                span.onclick = function() {
                                    map = new kakao.maps.Map(container,options);
                                    bounds = new kakao.maps.LatLngBounds();
                                    modal.style.display = "none";
                                }

                                var close = document.getElementById('close');
                                close.onclick = function() {
                                    map = new kakao.maps.Map(container,options);
                                    bounds = new kakao.maps.LatLngBounds();
                                    modal.style.display = "none";
                                }

                                window.onclick = function(event) {
                                    if (event.target == modal) {
                                        map = new kakao.maps.Map(container,options);
                                        bounds = new kakao.maps.LatLngBounds();
                                        modal.style.display = "none";
                                    }
                                }
                            }
                        });
                    </script>
                    <div class="card" style="width: 100%;">
                        <div class="card-body row">
                            <div class="col">
                                <h5 class="card-title" id="carN"></h5>
                                <h6 class="card-subtitle mb-2 text-muted" id="carS"></h6>
                                <span>연식: </span>
                                <span class="card-text" id="carB"></span><br> 
                                <span >수용 인원: </span>
                                <span class="card-text" id="carC"></span>
                                <span >명</span><br>
                                <span >비용/km: </span>
                                <span class="card-text " id="carCo"></span><span>원</span><br>
                            </div>

                            <div class="col" id="imgContainer">
                                <img id="carImg" src="" class="carImage" alt="car" />
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary btn-close"
                        data-dismiss="modal" id="close">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>