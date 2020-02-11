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

<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
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
function getDetail(car_no) {
    var as = document.getElementById("active-status");
    $.ajax({
        type : "GET", //전송방식을 지정한다 (POST,GET)
        url : "selectCar.do?carNo="+car_no,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error : function(){
            as.style.color = "gray";
        },
        success : function(startYn){
            as.value = car_no;
            setColor(as, startYn);
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
function setColor(actice_status, startYn) {
    if(startYn == 'Y') {
        actice_status.style.color = "blue";
    } else if (startYn == 'N') {
        actice_status.style.color = "black";               
    }
}
</script>


</head>
<body>
    <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">Dropdown</button>
        <div id="myDropdown" class="dropdown-content">
            <c:forEach var="car" items="${carList}" varStatus="status">


                <div class="dropdown-item" onclick="getDetail(${car.carNo})">
                    <div class="dropdown-component dropdown-number"> ${car.carNo} </div>
                    <div class="dropdown-component"> ${car.carSize} </div>
                    <div class="dropdown-component"> ${car.carType} </div>
                    <div class="dropdown-component"> ${car.cost} 원/km </div>
                </div> 
            </c:forEach>
        </div>
    </div>
    <div style="width:100%;">
        <div id="active-status" value="" onclick="updateStatus()">
            <i class="fas fa-power-off fa-9x"></i>
        </div>
    </div>

</body>

<style>

#active-status {
    margin:0px auto;
    width:144px;
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
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-component {
    padding: 8px 16px;
    float : left;
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
.dropdown-content .dropdown-item:hover {background-color: #ddd}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}
</style>
</html>