<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>간단한 지도 표시하기</title>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=k6uwn1n1eo"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<!-- <link rel="stylesheet" href="css/bootstrap.css">-->
	<link rel="stylesheet" href="./css/custom.css">
	

</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index"><span style="font-weight: bold;">푸드트럭 나들목</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" aria-current="page" href="process">푸드트럭 창업절차</a>
					<a class="nav-link" href="./map">푸드트럭 허가구역</a>
					<a class="nav-link" href="./area">상권분석</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
	<div class="row">
	<div class="col">
	<div style="text-align: center;">
	    <br><br><br>
		<h1>푸드트럭 창업 절차 안내</h1>
		<br><br>
		<p><span style="font-size: 20px;">
           <span style="font-weight: bold;">푸드트럭 나들목</span>은 푸드트럭 창업자를 위한 전문
                 웹사이트입니다.<br> 2014년 푸드트럭 합법화 이후 푸드트럭 창업에 대한 관심은 해마다 높아지고 있습니다.<br>
                 하지만 체계화된 플랫폼의 부재에 따른 정보의 오류로 인해<br> 의도치 않은 불법 푸드트럭 운영 역시 증가하고
                 있는 추세입니다.
           <br><br>
            따라서 <span style="font-weight: bold;">푸드트럭 나들목</span>은 산재되어 있는 푸드트럭
            창업 관련 절차 정보를 통합하여 안내해 드립니다.
            </span>
        </p>
    </div>
    
    <div class="container-fluid">
     <div class="row">
      <div class="col">
       <div class="pic">
         <img src="images/food_truck_img.jpg" width="100%" alt="food_truck_img">
           <span class="imgtext"><a href="http://www.freepik.com" style="color: white; text-decoration: none;">Designed by pch.vector / Freepik </a>
           </span>
       </div>
      </div>
     </div>
    </div>
		
	</div>
	</div>
	</div>

	<div class="container" style="margin: 100px 0px 20px 100px;">
		<div>
			<span style="font-weight: bold; font-size: 20px;">▶ 푸드트럭 창업
				5단계</span><br> <br> <br>
		</div>
	</div>

	<div class="container">
	<div class="row">
		<div style="border: 1px black; border-radius: 15%; float: left; width: 20%; padding: 10px; margin: 0px 10px 10px 60px; background-color: #EFFBF2; text-align: center; display: table-cell; vertical-align: middle; box-shadow: 5px 5px 10px grey;">
			<br> <br> <br> <span
				style="font-weight: bold; font-size: 18px;"><p>1. 푸드트럭 창업
					기획</p></span><br> <br>
		</div>
		<div
			style="border: 1px black; float: left; width: 65%; padding: 10px; margin: 0px 30px 10px 50px; font-size: 15px; text-align: justify;">
			<span style="font-weight: bold; font-size: 18px">[위치 및 메뉴 선정, 트럭 디자인 등을 기획]<br>
				<br></span> 푸드트럭 운영 위치를 선정한 뒤 주변 상권에 맞춰 어떤 메뉴를 판매할 것인지 결정합니다. 이후 위치와
			메뉴에 알맞은 형태와 디자인으로 푸드트럭의 개조를 진행합니다. 효율적인 주방 동선과 고객의 눈길을 끌 수 있는지를 모두
			고려해 디자인 해야 합니다. 이 외에도 간판, 포장용기, 홍보 계획 등 푸드트럭 운영의 전반을 기획합니다.<br>
			<p style="text-align: left; font-size: 13.5px;">
			-----------------------------------
				<br>'푸드트럭 나들목'의 허가구역 위치<br> 상권정보 링크
			</p>
		</div>
	</div>
	</div>

	<div class="container" style="text-align: center;">
		<img src="images/img4.png" alt="My Image" width="5%">
	</div>

	<div class="container">
	<div class="row">
		<div
			style="border: 1px black; border-radius: 15%; float: left; width: 20%; padding: 10px; margin: 0px 10px 10px 60px; background-color: #F6E3CE; text-align: center; display: table-cell; vertical-align: middle; box-shadow: 5px 5px 10px grey;">
			<br> <br> <br> <span
				style="font-weight: bold; font-size: 18px;"><p>2. 푸드트럭 개조</p></span><br>
			<br>
		</div>
		<div
			style="border: 1px black; float: left; width: 65%; padding: 10px; margin: 0px 30px 50px 50px; font-size: 15px; text-align: justify;">
			<span style="font-weight: bold; font-size: 18px;">[자동차 구조변경 및 액화석유가스 시설 공사]<br>
				<br></span> 푸드트럭 개조는 대부분 특장차 전문업체를 통해 진행합니다. 미리 기획한 디자인으로 여러 업체의 견적을
			비교해 꼼꼼히 확인합니다. 이후 푸드트럭 운영을 위해서는 자동차 구조변경 및 액화석유가스 승인이 필요한데, 보통 전문업체가
			대행으로 진행하게 됩니다. 웹사이트<span style="font-size: 13.5px;">
				<a href="https://www.cyberts.kr/portal/main.do">(한국교통안전공단
					사이버 검사소</a>, <a
					href="http://www.kgs.or.kr/publish/Board.do?method=view&board_id=main_9&seq=552">한국가스안전공사
					완성검사)</a>
			</span>를 통해서도 승인 결과 확인을 할 수 있으니 직접 확인하는 것도 좋은 방법입니다.
			
		</div>
	</div>
	</div>

	<div class="container" style="text-align: center;">
		<img src="images/img4.png" alt="My Image" width="5%">
	</div>

	<div class="container">
	<div class="row">
		<div
			style="border: 1px black; border-radius: 15%; float: left; width: 20%; padding: 10px; margin: 0px 10px 10px 60px; background-color: #EFFBF2; text-align: center; display: table-cell; vertical-align: middle; box-shadow: 5px 5px 10px grey;">
			<br> <br> <br> <span
				style="font-weight: bold; font-size: 18px;"><p>
					3. 위생교육 수료 및 <br>건강진단(보건증)
				</p></span><br> <br>
		</div>
		<div
			style="border: 1px black; float: left; width: 65%; padding: 10px; margin: 0px 30px 60px 50px; font-size: 15px; text-align: justify;">
			<span style="font-weight: bold; font-size: 18px;">[한국휴게음식업중앙회에서 위생교육 수료 및 보건증
				발급]<br> <br>
			</span> 푸드트럭은 휴게음식업으로 분류되기 때문에 6시간의 위생교육을 반드시 수료해야 합니다. 이후에도 매년 3시간의 보수교육을
			필히 수강해야 합니다. 수강하기 편리한 온라인 교육<span style="font-size: 13.5px;">
				<a href="https://kcraedu.or.kr/user/main">(한국휴게음식업중앙회)</a>
			</span>도 제공하고 있습니다. 보건증 발급은 가까운 보건소를 통해 발급
			가능합니다.
			
		</div>
	</div>
	</div>

	<div class="container" style="text-align: center;">
		<img src="images/img4.png" alt="My Image" width="5%">
	</div>

	<div class="container">
	<div class="row">
		<div
			style="border: 1px black; border-radius: 15%; float: left; width: 20%; padding: 10px; margin: 0px 10px 10px 60px; background-color: #F6E3CE; text-align: center; display: table-cell; vertical-align: middle; box-shadow: 5px 5px 10px grey;">
			<br> <br> <span style="font-weight: bold; font-size: 18px;"><p>
					4. 지자체 축제 및 행사장 <br>입점 공모 후<br> 주최와의 계약
				</p></span><br>
		</div>
		<div
			style="border: 1px black; float: left; width: 65%; padding: 10px; margin: 0px 30px 10px 50px; font-size: 15px; text-align: justify;">
			<span style="font-weight: bold; font-size: 18px;">[지자체, 행사장 등 시설주체와의 계약 진행]<br>
				<br></span> 푸드트럭을 운영하기 위해 지자체 허가구역, 고속도로 내 졸음쉼터, 축제 및 행사장 등 다양한 곳에서의
			푸드트럭 입점 공모에 참여해야 합니다. 기획했던 푸드트럭의 목표에 적합한 장소를 골라 공모에 참여합니다. 이후 입점이
			확정된다면 시설주체와의 계약을 진행하게 됩니다.
			<p style="text-align: left; font-size: 13.5px;">
			-----------------------------------
				<br> <a
					href="https://www.bizinfo.go.kr/see/seeb/selectSEEB120.do">중소기업
					성공 길잡이 기업마당</a><br> <a href="https://www.sbiz.or.kr/sup/main.do">소상공인마당</a>
			</p>
		</div>
	</div>
	</div>

	<div class="container" style="text-align: center;">
		<img src="images/img4.png" alt="My Image" width="5%">
	</div>

	<div class="container">
	<div class="row" style="margin: 0px 0px 80px 0px;">
		<div
			style="border: 1px black; border-radius: 15%; float: left; width: 20%; padding: 10px; margin: 0px 10px 10px 60px; background-color: #EFFBF2; text-align: center; display: table-cell; vertical-align: middle; box-shadow: 5px 5px 10px grey;">
			<br> <br> <br> <span
				style="font-weight: bold; font-size: 18px;"><p>
					5. 한시적 영업 신고, <br>사업자등록
				</p></span><br> <br>
		</div>
		<div
			style="border: 1px black; float: left; width: 65%; padding: 10px 10px 60px 10px; margin: 0px 30px 20px 50px; font-size: 15px; text-align: justify;">
			<span style="font-weight: bold; font-size: 18px;">[영업 신고 및 사업자 등록]<br> <br></span>1)자동차
			등록증 2)액화가스 완성 검사서 3)위생교육 수료증 4)보건증 5)시설주체와의 계약서 6)신분증 6가지 서류를 가지고 관할
			구청 위생과를 방문하여 최초 영업신고를 진행합니다. 영업신고증이 발급된 이후 관할 세무서를 방문해 사업자 등록까지 완료하면
			비로소 푸드트럭을 시작할 수 있습니다. 최초 영업신고 이후에 다른 지역에서의 영업을 하기 위해서는 정부24
			<span style="font-size: 13.5px;">
				<a
					href="https://www.gov.kr/mw/AA020InfoCappView.do?HighCtgCD=A09006&CappBizCD=14600000021&tp_seq=10">(https://www.gov.kr)</a>
			</span>의 소재지 추가를
			통해 간편하게 가능합니다.
			
		</div>
	</div>
	</div>

	<script>
		var mapOptions = {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		};
		var map = new naver.maps.Map('map', mapOptions);
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
</html>