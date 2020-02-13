<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
<style>
.btn1 {margin-left:90%;background-color: #3498db; border-bottom: 5px solid #2980B9; text-shadow: 0px -2px #2980B9; position: relative; padding: 10px 40px; border-radius: 3px; font-family: 'Lato', sans-serif; font-size: 15px; color: #FFF; text-decoration: none;}
</style>
<script type="text/javaScript" language="javascript">
function goRoute(carNo)
{
    alert(carNo);
    /*
    var route = document.data;
    
    route.carNo.value = carNo;
    
    route.action = "./rent.do";
    route.method = "post";
    route.submit();
    */
}
</script>
</head>
<body>
    <form name="data">
        <input type="hidden" name="carNo"/>
    </form>
    <button class="btn1" type="button" onclick="goRoute('${carInfo.carNo}');">반납</button>
    
    <Table>
    <tr>
        <th>항목</th>
        <th>내용</th>
    </tr>
    <tr>
        <th>모델명</th>
        <td>${carInfo.carType}</td>
    </tr>
    <tr>
        <th>차종</th>
        <td>${carInfo.carSize}</td>
    </tr>
    <tr>
        <th>총 주행거리</th>
        <td>${carInfo.mileage}km</td>
    </tr>
    <tr>
        <th>연식</th>
        <td>${carInfo.birth}</td>
    </tr>
    <tr>
        <th>수용인원</th>
        <td>${carInfo.capacity}인승</td>
    </tr>
    <tr>
        <th>km 당 가격</th>
        <td>${carInfo.cost}원</td>
    </tr>
    </Table>
    <br>
         디지털카키를 받았습니다.    
</body>
</html>