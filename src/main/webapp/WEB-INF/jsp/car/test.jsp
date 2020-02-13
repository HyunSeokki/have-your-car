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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2e76e198ea746100bd7b39503009ff" ></script>
<title>Insert title here</title>
</head>

<body>
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

</body>
<script>
    var mapWrapper = document.getElementById('mapWrapper'); //지도를 감싸고 있는 DIV태그
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapCenter = new kakao.maps.LatLng(33.450422139819736 , 126.5709139924533), // 지도의 가운데 좌표
        mapOption = {
            center: mapCenter, // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
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
        new kakao.maps.Size(50, 40),
        {
            offset: new kakao.maps.Point(15, 15)
        }
    );
    
    // 드래그가 가능한 마커를 생성합니다.
    var rvMarker = new kakao.maps.Marker({
        image : markImage,
        position: mapCenter,
        draggable: true,
        map: map
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
    function toggleRoadview(position){
    
        //전달받은 좌표(position)에 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄웁니다
        rvClient.getNearestPanoId(position, 50, function(panoId) {
            /* if (panoId === null) {
                rvContainer.style.display = 'none'; //로드뷰를 넣은 컨테이너를 숨깁니다
                mapWrapper.style.width = '50%';
                map.relayout();
            } else { */
                mapWrapper.style.width = '50%';
                map.relayout(); //지도를 감싸고 있는 영역이 변경됨에 따라, 지도를 재배열합니다
                rvContainer.style.display = 'block'; //로드뷰를 넣은 컨테이너를 보이게합니다
                rv.setPanoId(panoId, position); //panoId를 통한 로드뷰 실행
                rv.relayout(); //로드뷰를 감싸고 있는 영역이 변경됨에 따라, 로드뷰를 재배열합니다
            //}
        });
    }
</script>
<style>
    .map_wrap {overflow:hidden;height:330px}

</style>
</html>