<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<%@ page session="true"%>
<%
    String id = (String) session.getAttribute("user");
%>
<%-- 
    JSP Name : register.jsp
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

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"
    type="text/javascript"></script>
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>carRegister</title>
<style>
#title {
    text-align: center;
}

thead {
    background-color: #013469;
    color: white;
    width: calc(100% - 1em);
        /* scrollbar is average 1em/16px width, remove it from thead width */
}

th{
    text-align: center;
}
tbody {
    display: block;
    height: 520px;
    overflow: auto;
}

thead, tbody tr {
    display: table;
    width: 100%;
    table-layout: fixed;
}

.row tbody tr.highlight td {
  background-color: #ccc;
}

</style>
</head>

<body>
    <div class="container-fluid" style="height: 100vh; width: 80%;";>
        <!-- 차량등록 테이블 -->
        <div class="row justify-content-md-center" >
            <div class="table-responsive col"
                style="border-bottom: solid 1px; margin: 0px; padding: 0px; border-color: #CCCEDB;">
                <table id="carTable" width="90%"
                    class="table table-hover text-center">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>모델명</th>
                            <th>차종류</th>
                            <th>수용인원</th>
                            <th>km/비용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="carList" items="${resultList}"  varStatus="status">
                            <tr value = "${carList.carType }">
                                <td><img src="<c:url value="/${carList.imgSrc}"/>" width="100"></td>
                                <td><c:out value="${carList.carType }" /></td>
                                <td><c:out value="${carList.carSize }" /></td>
                                <td><c:out value="${carList.capacity }" /></td>
                                <td><c:out value="${carList.cost }" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <!-- 카카오맵 위도, 경도  -->
            <div class="col">
                <div id="map" style="width: 100%; height: 500px;"></div>
                <p>
                    <a>차량이 위치할 곳을 클릭해주세요.</a>
                </p>
                <div id="clickLatlng"></div><br>
                
                <script>
                    var lat = 37.506561;
                    var lng = 127.05841800000002;
                    var mapContainer = document.getElementById('map'),
                        mapOption = { 
                            center: new kakao.maps.LatLng(37.506561, 127.05841800000002),
                            level: 3
                        };
                    
                    var map = new kakao.maps.Map(mapContainer, mapOption);
                    
                    var marker = new kakao.maps.Marker({ 
                        position: map.getCenter() 
                    }); 
                    
                    marker.setMap(map);
                    
                    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                        var latlng = mouseEvent.latLng; 
                        marker.setPosition(latlng);
                        
                        lat = latlng.getLat();
                        lng = latlng.getLng();
                        
                        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이며, ';
                        message += '경도는 ' + latlng.getLng() + ' 입니다.';
                        
                        var resultDiv = document.getElementById('clickLatlng'); 
                        resultDiv.innerHTML = message;
                    });
                
               //차량선택   
                $(function() {
                  $('#carTable').on('click', 'tbody tr', function(event) {
                    $(this).addClass('highlight').siblings().removeClass('highlight');
                    $(this).addClass('selected').siblings().removeClass('selected');
                  });
    
                  var getSelectedRow = function() {
                    return $('table > tbody > tr.selected');
                  }
                  
                  $('#btnClick').click(function(e){
                      var selectedRow = getSelectedRow();
                      var carInfo = selectedRow.attr('value'); //차종
                      
                      //carType, lat, lng
                      var registCar = {
                              carType : carInfo,
                              latitude : lat,
                              longitude: lng
                      }
                      
                      //carType, lat, lng JSON 전송
                      var jsonData = JSON.stringify(registCar);
                      $.ajax({
                          url : "./registerCar.do",
                          dataType : "text",
                          contentType : "application/json; charset=UTF-8",
                          type : "POST",
                          data : jsonData,
                          success : function() {
                              console.log(jsonData);
                          },
                          cache : false,
                          error : function(message) {
                              console.log(message);
                              console.log("통신실패");
                          }
                      });
                  });
               });
             </script>
              <button id = "btnClick" type="button" class="btn btn-primary btn">등록</button>
           </div>
        </div>
</body>
</html>