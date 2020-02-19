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
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- bootstrap JS -->
<script src =  "https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script> 

<!-- bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<style>   
    body{
    -ms-overflow-style: none;
        margin-top: 5%;
        margin-bottom: 5%;
        font-size: 0.8rem;
    }
    
    #title{
        text-align: center;
        font-size: 5vh;
    }
    
    /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100vh; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            -ms-overflow-style: none; // IE에서 스크롤바 감춤
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
            height: 80vh;                       
        }
        
         .modal-dialog {
            max-width: 900px;
            margin: 1.75rem auto;
        }
        
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: #4374D9;
            text-decoration: none;
            cursor: pointer;
        }
        
        #map_container{
            width: 100%;
            height: 53%;
            margin-top: 2%;
        }
        
        .icon{
            color: #013469;
            font-size: 2.5vh;
            margin: 1vh;
        }
        
        .icon:hover{
           color: #6799FF;
        }
        
        #ctrlContainer{
            margin-bottom: 1vh;
            clear: both;
        }
        
        .btn{
            margin-top: 2.5%;
        }
        
          .carImage {
            width: 41%;
            height: 45%;
            position: absolute;
            top: 123%;
            left: -36%;
            margin-top: -148px;
            margin-left: -27px;
        }

        
        #imgContainer{
             position:absolute;
            width:100%;
            height:100%
        }
        
       thead{
            background-color: #013469;
            color: white;
       }
      


</style>

</head>
<body>
<div class = "container-fluid">
        <h1 id = "title">MyTrip</h1>

        <div id=ctrlContainer class="row justify-content-between">
            <div class="col">

                <i class="fas fa-arrow-left icon"
                    onclick="history.go(-1)"></i> <i
                    class="fas fa-car icon"></i> <i
                    class="fas fa-home icon"
                    onclick="location.href='./main.do'"></i>
            </div>
            <p class="col text-right" style="margin: 0.5rem;"><%=session.getAttribute("user")%>님,
                안녕하세요.
            </p>

        </div>
        <div class = "table-responsive">
    <table id="rentTable" width="90%" class="table table-hover text-center">
        <thead>
            <tr>
                <th>대여번호</th>
                <th>차종</th>
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
                    <c:forEach var="result" items="${myRentList}"
                        varStatus="status">
                        <tr>
                            <td id = "rentNo"><c:out value="${result.rentNo }" /></td>
                            <td id = "carType">
                                <c:forEach var="car" items="${carList }">
                                    <c:if test="${car.carNo eq result.carNo}">
                                        <c:out value="${car.carType}" />
                                    </c:if>
                                </c:forEach></td>
                            <td id = "rentDate"><c:out value="${result.rentDate }" /></td>
                            <td id = "returnDate"><c:out value="${result.returnDate }" /></td>
                            <%-- <td id = "userId"><c:out value="${result.userID }" /></td> --%>              
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>  
        </tbody>
    </table>
   </div>
 
    <div id="myModal" class="modal">
     <div class="modal-dialog modal-dialog-centered" role="document">  
      <div class="modal-content">
        <div class = "modal-header">
            <h5 class="modal-title"><i class="fas fa-check"></i> RentInfo</h5>    
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
          
        </div>
           
        <!-- 지도생성 -->
        <div id = "map_container">                                                                 
            <div id="map"></div>    
             <script type="text/javascript" 
             src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e59a0e357c5eaa690aa6f65b5549031c"></script>
             <script>
                 var container = document.getElementById('map');
                 var options = {
                         center: new kakao.maps.LatLng(37.507381428880635, 127.05895942121612),
                         level: 3
                 };
                 var map = new kakao.maps.Map(container, options);
                 container.style.width = '100%';
                 container.style.height = '38vh'; 
                 var bounds = new kakao.maps.LatLngBounds();
             </script>
        </div>
        
<script>
$("#rentTable tr").click(function(){    
    var str = ""
    var tdArr = new Array(); // 배열 선언       
    // 현재 클릭된 Row(<tr>)
    var tr = $(this);
    var td = tr.children();      
    // tr.text()를 통해 클릭된 모든 값을 가져온다.
    console.log("클릭한 Row의 모든 데이터 : "+tr.text());        
    // 반복문을 이용해서 배열에 값 담기
    td.each(function(i){
        tdArr.push(td.eq(i).text());
    });        
    console.log("배열에 담긴 값 : "+tdArr);       

    // td.eq(index)를 통해 대여번호[0] 가져오기.
    var rentNo = td.eq(0).text();
    
    if(isNaN(rentNo) == false)
    {
        $.ajax ({
            type : "GET",
            url : "mypagedetail.do?rentNo=" + rentNo,
            dataType : 'text',
            contentType : 'application/json; charset=utf-8',
            success : function(args) {
                console.log('연결성공');

                var trip = JSON.parse(args).data;   
                console.log(trip);
                var carInfo =JSON.parse(args).data2;
                
                //차 정보 담기
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
                
                $('#carImg').attr('src','<c:url value="/'+carImgSrc+'"/>');
                
                
                //선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
                var linePath = new Array();
                
                for(var i=0; i<Object.keys(trip).length; i++){
                    var temp = new kakao.maps.LatLng(trip[i].latitude, trip[i].longitude);
                    linePath.push(temp);
                    bounds.extend(temp);
                }
                
                // 지도에 표시할 선을 생성합니다
                var polyline = new kakao.maps.Polyline({
                    path: linePath, 
                    strokeWeight: 5,
                    strokeColor: '#013469',
                    strokeOpacity: 0.7,
                    strokeStyle: 'solid'
                });
                // 지도에 선을 표시합니다 
                polyline.setMap(map);  
                map.setBounds(bounds);
            },  
            error : function(request, status, error) {
                console.log("연결실패");
                console.log(request);
            },
            cache : false
        });
         
        //****Modal****//
        var modal = document.getElementById("myModal");
        
        //모달이 보임.
        modal.style.display = 'block';  
        map.relayout();  
        //모달 가져옴
        var modal = document.getElementById('myModal');
        //모달을 닫을 span가져옴
        var span = document.getElementsByClassName("close")[0];                                          
        //<span> (x) 눌렀을 때, 모달을 닫음
        span.onclick = function() {
            map = new kakao.maps.Map(container, options);
            bounds = new kakao.maps.LatLngBounds();
            modal.style.display = "none";
        }
        
        //<close> 버튼 눌렀을 때, 모달을 닫음
        var close = document.getElementById('close');
        close.onclick = function() {
            map = new kakao.maps.Map(container, options);
            bounds = new kakao.maps.LatLngBounds();
            modal.style.display = "none";
        }
        
        //모달 밖을 눌렀을때도 창이 닫힘
        window.onclick = function(event) {
            if (event.target == modal) {
                map = new kakao.maps.Map(container, options);
                bounds = new kakao.maps.LatLngBounds();
                modal.style.display = "none";
            }
        }
    }
});
</script>   
        <div class="card" style = "width: 100%;">
         <div class="card-body row">
         <div class = "col">
            <h5 class="card-title" id="carN"></h5>
            <h6 class="card-subtitle mb-2 text-muted" id = "carS"></h6>
            <span>연식: </span><span class="card-text" id = "carB"></span><br>
            <span>수용 인원: </span><span class="card-text" id = "carC"></span><span>명</span><br>
            <span>비용/km: </span><span class="card-text" id = "carCo"></span><span>원</span><br>
          </div>
          
          
          <div class = "col" id = "imgContainer">
            <img id = "carImg" src = "" class = "carImage" alt="car" />
          </div>
         </div>
        </div>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id = "close">Close</button>            
       </div>
    </div>   
    </div>
</div>
</body>
</html>