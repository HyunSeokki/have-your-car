<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<%-- 
    JSP Name : rent.jsp
    Description : 설명을 기술합니다.
    author OHS
    since 2020. 2. 12.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 12.     OHS     	최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

<script type="text/javaScript" language="javascript">
function goRoute(carNo)
{
    var route = document.data;
    
    route.carNo.value = carNo;
    route.rentNo.value = "${rentInfo.rentNo}";
    
    route.action = "./return.do";
    route.method = "post";
    route.submit();
}

$(document).ready(function() {
    setTimeout(function() {
        window.open("/have/car/main.do?rentNo="+"${rentInfo.rentNo}", "", "channelmode=yes");
    }, 3000);
}); 
</script>
</head>
<body>
    <div class="container-fluid" style="height:100vh;">
        <div class="row align-items-center justify-content-center"  style="height:100vh;">
            <div class="col-10">
                <div class="row mb-3 justify-content-center">
                <div class="card" style="width:80vw;">
                    <div class="card-body">
                        <h5 class="card-title text-center font-weight-bold">대여No. ${ rentInfo.rentNo }</h5>
                        <h5 class="card-title text-center font-weight-bold">${ rentInfo.rentDate }</h5>
                    </div>
                    <img src="<c:url value="/resources/img/key.gif" />" class="card-img-bottom" alt="소나타"/>
                </div>
                </div>
                <div class="row mt-3 justify-content-center">
                    <button class="btn btn-primary btn-block btn-lg" type="button" onclick="goRoute('${carInfo.carNo}');" style="width:80vw;">반납하기</button>
                </div>
            </div>
        </div>
        <form name="data">
            <input type="hidden" name="carNo"/>
            <input type="hidden" name="rentNo"/>
        </form>         
    </div>
</body>
</html>