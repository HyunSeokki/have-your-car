<%@page import="javax.enterprise.inject.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<%-- 
    JSP Name : jspName.jsp
    Description : 설명을 기술합니다.
    author 6800410
    since 2020. 2. 24.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2020. 2. 24.     6800410     	최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/color.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>Main title</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javaScript" language="javascript">

</script>
</head>
<body>
	<div class="row" id="loader-map" style="position: absolute; width: 100vw; height: 100vh; z-index: 15; background-color:white; text-align:center;">
            <div id="loader">
                <svg class="car" width="102" height="40" xmlns="http://www.w3.org/2000/svg">
                    <g transform="translate(2 1)" stroke="#013469" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
                        <path class="car__body" d="M47.293 2.375C52.927.792 54.017.805 54.017.805c2.613-.445 6.838-.337 9.42.237l8.381 1.863c2.59.576 6.164 2.606 7.98 4.531l6.348 6.732 6.245 1.877c3.098.508 5.609 3.431 5.609 6.507v4.206c0 .29-2.536 4.189-5.687 4.189H36.808c-2.655 0-4.34-2.1-3.688-4.67 0 0 3.71-19.944 14.173-23.902zM36.5 15.5h54.01" stroke-width="3"/>
                        <ellipse class="car__wheel--left" stroke-width="3.2" fill="#FFF" cx="83.493" cy="30.25" rx="6.922" ry="6.808"/>
                        <ellipse class="car__wheel--right" stroke-width="3.2" fill="#FFF" cx="46.511" cy="30.25" rx="6.922" ry="6.808"/>
                        <path class="car__line car__line--top" d="M22.5 16.5H2.475" stroke-width="3"/>
                        <path class="car__line car__line--middle" d="M20.5 23.5H.4755" stroke-width="3"/>
                        <path class="car__line car__line--bottom" d="M25.5 9.5h-19" stroke-width="3"/>
                    </g>
                </svg>
            </div>
            <div style="position: absolute; left:36%; top:48%; font-size:2rem; font-weight:bold; color:#013469; clear:both;">
                <div id="L" style="float:left">L</div>
                <div id="o" style="float:left">o</div>
                <div id="a" style="float:left">a</div>
                <div id="d" style="float:left">d</div>
                <div id="i" style="float:left">i</div>
                <div id="n" style="float:left">n</div>
                <div id="g" style="float:left">g</div>
                <div id="dot1" style="float:left">.</div>
                <div id="dot2" style="float:left">.</div>
                <div id="dot3" style="float:left">.</div>
            </div>
</div>
</body>
</html>