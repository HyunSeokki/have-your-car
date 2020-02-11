<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>

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

<!-- bootstrap JS -->
<script src =  "https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script> 

<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<style>
    #container{
        width: 800px;
        margin: 0 auto;
    }
    
    #title{
        text-align: center;
    }
    
    /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;                        
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
            height:90%;
        }
    
</style>

</head>
<body>
<div id = "container">
    <h1 id = "title">MyPage</h1><br>
    
    <table id="rentTable" width="100%" class="table table-bordered table-hover text-center">
        <thead>
            <tr>
                <th>대여번호</th>
                <th>식별번호</th>
                <th>대여날짜</th>
                <th>반납날짜</th>
                <th>ID</th>
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
                            <td id = "carNo"><c:out value="${result.carNo }" /></td>
                            <td id = "rentDate"><c:out value="${result.rentDate }" /></td>
                            <td id = "returnDate"><c:out value="${result.returnDate }" /></td>
                            <td id = "userId"><c:out value="${result.userID }" /></td>              
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>  
        </tbody>
    </table>
 
    <div id="myModal" class="modal">
      <div class="modal-content">
        <span class="close">&times;</span>
           
        <!-- 지도생성 -->
        <div id = "map_container">                                                                 
            <div id="map"></div>    
             <script type="text/javascript" 
             src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e59a0e357c5eaa690aa6f65b5549031c"></script>
             <script>
                 var container = document.getElementById('map');
                 var options = {
                         center: new kakao.maps.LatLng(33.450701, 126.570667),
                         level: 3
                 };
                 var map = new kakao.maps.Map(container, options);
                 var mapContainer = document.getElementById('map');
                 mapContainer.style.width = '100%';
                 mapContainer.style.height = '400px'; 
             </script>
        </div>    
      </div>
    </div>   
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
        
        
        function ajaxAct() {
            $.ajax ({
                type : "GET",                   
                url : "mypage.do", /* "mypage.do?rentNo=" + rentNo*/
                data: { 'rentNo': rentNo},
                dataType : 'json',      
                success : function(data){    
                    dataAct(data);    //성공시 이 함수 실행          
                },
            
                error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                },
                complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
                }
            });
        }
        
        
        //****Modal****
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
            modal.style.display = "none";
        }
        //모달 밖을 눌렀을때도 창이 닫힘
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
});
</script>   
</body>
</html>