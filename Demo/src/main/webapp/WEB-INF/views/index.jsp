<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=k6uwn1n1eo"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./css/custom.css">
</head>
<body style="background-image: url('images/background.png'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
    <nav class="navbar navbar-dark bg-dark" >
        <div class="container-fluid">
          <a class="navbar-brand" href="index"><span style="font-weight: bold;">푸드트럭 나들목</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <!-- <a class="nav-link active" aria-current="page" href="index">홈</a>-->
              <a class="nav-link" href="./process">푸드트럭 창업절차</a>
              <a class="nav-link" href="./map">푸드트럭 허가구역</a>
              <a class="nav-link" href="./area">상권분석</a>
            </div>
          </div>
        </div>
      </nav>
      
     <div class="container" style="text-align: center;">
      <div class="row">
       <div class="col">
        <div id="logo">
         <img src="images/foodtruck_logo2.png" width="17%" vspace="40px" alt="푸드트럭 나들목 로고">
        </div>
       </div>
      </div>
     </div>
     
     <div class="container" style="text-align: center;">
      <div class="row">
       <div class="col">
        <span style="font-weight: bold; font-size: 30px;"><p>푸드트럭 창업에 대한 모든 것<br>
        <span style="font-weight: bold; color: #f6ac2c; font-size: 40px;">푸드트럭 나들목<br></span><br></p></span>
       </div>
      </div>
     </div>
     
     <div class="container" style="text-align: center;">
      <div class="row">
       <div class="col-sm-6 col-md-4">
        <div><a href="process"><img src="images/process_img.png" width="80%" alt="푸드트럭 창업절차 링크"></a></div>
       </div>
       <div class="col-sm-6 col-md-4">
        <div><a href="map"><img src="images/map_img.png" width="80%" alt="푸드트럭 허가구역 링크"></a></div>
       </div>
       <div class="col-sm-6 col-md-4">
        <div><a href="#"><img src="images/community.png" width="80%" alt="게시판 링크"></a></div>
       </div>
      </div>
     </div>
      



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>