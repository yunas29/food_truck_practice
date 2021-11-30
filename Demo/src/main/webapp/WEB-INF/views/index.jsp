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
</head>
<body>
    <nav class="navbar navbar-dark bg-dark" >
        <div class="container-fluid">
          <a class="navbar-brand" href="#">푸드트럭 나들목</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-link active" aria-current="page" href="/">홈</a>
              <a class="nav-link" href="/process">푸드트럭신청과정</a>
              <a class="nav-link" href="/login">로그인</a>
            </div>
          </div>
        </div>
      </nav>
      <div id="map" style="width:100%;height:800px;"></div>
     <div>
        <!-- <table>
       <c:forEach var="loca" items="${locations}">
            <tr>
                <td>${loca.prmisnZoneNm}</td>
                <td>${loca.lnmadr}</td>
                <td>${loca.rdnmadr}</td>
                <td>${loca.latitude}</td>
                <td>${loca.longitude}</td>
            </tr>
       </c:forEach>
    </table> -->
     </div>
<script>

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
});

var markers = [];
var infoWindows =[];
var list = [];
function receiveArray() {
    $.ajax({
        url: "/api/getData",
        type: "post",
        success: function(data) {alert("통신성공!"); showData(data)},
        error: function(e) {alert("통신실패"); console.log(e);}
    });
}  
receiveArray();
console.log(list)
// var list = [{"id":1,"prmisnZoneNm":"평택-제천선 중앙탑 졸음쉼터 내","lnmadr":"충청북도 충주시 중앙탑면 하구암리 352-3","rdnmadr":"","latitude":37.041538,"longitude":127.831508},{"id":2,"prmisnZoneNm":"서동생활공원","lnmadr":"경상남도 의령군 의령읍 서동리 543","rdnmadr":"경상남도 의령군 의령읍 의병로8길 44","latitude":35.31545351,"longitude":128.2558931},{"id":3,"prmisnZoneNm":"진포해양테마공원 내","lnmadr":"전라북도 군산시 장미동 1-71","rdnmadr":"","latitude":35.989698,"longitude":126.714672},{"id":4,"prmisnZoneNm":"옥도면 장자도리","lnmadr":"전라북도 군산시 옥도면 장자도리 17","rdnmadr":"","latitude":35.812323,"longitude":126.397212},{"id":5,"prmisnZoneNm":"옥도면 장자도리","lnmadr":"전라북도 군산시 옥도면 장자도리 산2-5","rdnmadr":"","latitude":35.811805,"longitude":126.398239},{"id":6,"prmisnZoneNm":"이순신공원","lnmadr":"경상남도 통영시 정량동 685-2","rdnmadr":"","latitude":34.84425936,"longitude":128.4419451},{"id":7,"prmisnZoneNm":"사랑을 볶는 카페","lnmadr":"","rdnmadr":"경상남도 사천시 용현면 석양길 500","latitude":35.00937643,"longitude":128.0472846},{"id":8,"prmisnZoneNm":"뉴욕타이거푸드카페","lnmadr":"","rdnmadr":"경상남도 사천시 사천대로 17 (대방동, 삼천포대교공원)","latitude":34.93229419,"longitude":128.0523348},{"id":9,"prmisnZoneNm":"우리가족","lnmadr":"","rdnmadr":"경상남도 사천시 사천대로 17 (대방동, 삼천포대교공원)","latitude":34.93229419,"longitude":128.0523348},{"id":10,"prmisnZoneNm":"광명동굴 내","lnmadr":"경기도 광명시 가학동 27","rdnmadr":"경기도 광명시 가학로85번길 142","latitude":37.424678573,"longitude":126.8634320983},{"id":11,"prmisnZoneNm":"평사리공원","lnmadr":"경상남도 하동군 악양면 평사리 72-2","rdnmadr":"","latitude":35.13538984,"longitude":127.6912571},{"id":12,"prmisnZoneNm":"남조로 사려니숲길입구","lnmadr":"제주특별자치도 서귀포시 표선면 가시리 산 158-4","rdnmadr":"","latitude":33.3945818,"longitude":126.6852592},{"id":13,"prmisnZoneNm":"남조로 사려니숲길입구","lnmadr":"제주특별자치도 서귀포시 표선면 가시리 산 158-4","rdnmadr":"","latitude":33.3945818,"longitude":126.6852592},{"id":14,"prmisnZoneNm":"인제군농특산물전시판매장 주차장","lnmadr":"강원도 인제군 인제읍 상동리 430","rdnmadr":"강원도 인제군 인제읍 비봉로 48","latitude":38.06526797,"longitude":128.1744703},{"id":15,"prmisnZoneNm":"삼성현역사문화공원","lnmadr":"","rdnmadr":"경상북도 경산시 남산면 삼성현공원로 59","latitude":35.80168834,"longitude":128.7966117},{"id":16,"prmisnZoneNm":"양서친환경도서관 앞","lnmadr":"경기도 양평군 양서면 용담리 535-15","rdnmadr":"","latitude":37.541986,"longitude":127.323247},{"id":17,"prmisnZoneNm":"우치공원","lnmadr":"광주광역시 북구 생용동 90번지","rdnmadr":"광주광역시 북구 우치로 677(생용동)","latitude":35.22431388,"longitude":126.8942421},{"id":18,"prmisnZoneNm":"(코로나19로 잠정 운영 중단)이천농업테마공원 공원부지","lnmadr":"경기도 이천시 모가면 어농리 871-3","rdnmadr":"경기도 이천시 모가면 공원로 48","latitude":37.17960623,"longitude":127.4453047},{"id":19,"prmisnZoneNm":"의좋은형제공원 주차장","lnmadr":"충청남도 예산군 대흥면 동서리 384-11","rdnmadr":"충청남도 예산군 대흥면 예당로 885","latitude":36.6082662491,"longitude":126.7918292596},{"id":20,"prmisnZoneNm":"사적지 제229호 충의사 주차장","lnmadr":"충청남도 예산군 덕산면 시량리 119-1","rdnmadr":"","latitude":36.6865371516,"longitude":126.6513810289},{"id":21,"prmisnZoneNm":"유형문화재 제43호 추사고택 주차장","lnmadr":"충청남도 예산군 신암면 용궁리 904","rdnmadr":"충청남도 예산군 신암면 추사고택로 261","latitude":36.7469356544,"longitude":126.7984593225},{"id":22,"prmisnZoneNm":"덕산도립공원 수덕사 주차장","lnmadr":"충청남도 예산군 덕산면 사천리 25-36","rdnmadr":"","latitude":36.6558180499,"longitude":126.6207304577},{"id":23,"prmisnZoneNm":"평창 휘닉스파크","lnmadr":"강원도 평창군 봉평면 면온리 1095-1","rdnmadr":"강원도 평창군 봉평면 태기로 174","latitude":37.57374461,"longitude":128.309616},{"id":24,"prmisnZoneNm":"평창전통시장","lnmadr":"강원도 평창군 평창읍 하리 55-6","rdnmadr":"강원도 평창군 평창읍 평창시장1길 8-1","latitude":37.36684873,"longitude":128.3945773},{"id":25,"prmisnZoneNm":"신포청년몰","lnmadr":"","rdnmadr":"인천광역시 중구 우현로35번길 1","latitude":37.47045702,"longitude":126.6275216},{"id":26,"prmisnZoneNm":"여주종합운동장","lnmadr":"경기도 여주시 월송동 1","rdnmadr":"경기도 여주시 영릉로 123","latitude":37.2930375376,"longitude":127.622902227},{"id":27,"prmisnZoneNm":"포항운전면허시험장","lnmadr":"경상북도 포항시 남구 오천읍 문덕리 1036-6","rdnmadr":"경상북도 포항시 남구 오천읍 냉천로 656","latitude":35.9423187355,"longitude":129.3929024188},{"id":28,"prmisnZoneNm":"포항종합공설운동장일대","lnmadr":"경상북도 포항시 남구 대도동 313-1","rdnmadr":"경상북도 포항시 남구 희망대로 810(대도동)","latitude":36.008398131,"longitude":129.3628911843},{"id":29,"prmisnZoneNm":"형산강변 연일대교 하단 일원","lnmadr":"경상북도 포항시 남구 연일읍 생지리 459-3","rdnmadr":"경상북도 포항시 남구 형산강남로","latitude":36.0000678897,"longitude":129.3460814314},{"id":30,"prmisnZoneNm":"백양공원","lnmadr":"부산광역시 북구 만덕동 843","rdnmadr":"부산광역시 북구 은행나무로 26","latitude":35.2072432019,"longitude":129.037795495},{"id":31,"prmisnZoneNm":"대덕구노인종합복지회관","lnmadr":"","rdnmadr":"대전광역시 대덕구 계족로740번길 80 (읍내동)","latitude":36.3782583557,"longitude":127.431438709},{"id":32,"prmisnZoneNm":"신대노인종합복지관","lnmadr":"","rdnmadr":"대전광역시 대덕구 회덕로22번길 5 (신대동)","latitude":36.3987504146,"longitude":127.4204582192},{"id":33,"prmisnZoneNm":"국립공주대학교 산업과학대학 주차장","lnmadr":"충청남도 예산군 예산읍 대회리 1","rdnmadr":"충청남도 예산군 예산읍 대학로 54","latitude":36.6698883395,"longitude":126.8594140853},{"id":34,"prmisnZoneNm":"봉수산자연휴양림(수목원) 주차장","lnmadr":"충청남도 예산군 대흥면 상중리 470-7","rdnmadr":"충청남도 예산군 대흥면 임존성길 153","latitude":36.5984487222,"longitude":126.7808936923},{"id":35,"prmisnZoneNm":"예산황새공원 주차장","lnmadr":"충청남도 예산군 광시면 대리 312-15","rdnmadr":"충청남도 예산군 광시면 시목대리길 62-19","latitude":36.5426278013,"longitude":126.8022434592},{"id":36,"prmisnZoneNm":"어울림근린공원","lnmadr":"경기도 동두천시 생연동 714-6","rdnmadr":"","latitude":37.89661147,"longitude":127.0517101},{"id":37,"prmisnZoneNm":"캠프보산 월드푸드스트리트","lnmadr":"경기도 동두천시 보산동 429-19","rdnmadr":"","latitude":37.91646779,"longitude":127.0562633},{"id":38,"prmisnZoneNm":"신례천로옆","lnmadr":"제주특별자치도 서귀포시 남원읍 신례리 850-1","rdnmadr":"제주특별자치도 서귀포시 남원읍 중산간동로 7080","latitude":33.2858917,"longitude":126.6351598},{"id":39,"prmisnZoneNm":"태풍센터근처","lnmadr":"제주특별자치도 서귀포시 남원읍 한남리 산 76-1","rdnmadr":"","latitude":33.3324011,"longitude":126.6778298},{"id":40,"prmisnZoneNm":"진해구민회관","lnmadr":"창원시 진해구 태백동 98","rdnmadr":"경상남도 창원시 진해구 진해대로325","latitude":35.16958314,"longitude":128.6594645},{"id":41,"prmisnZoneNm":"아라미르CC마르코스","lnmadr":"창원시 진해구 제덕동 898","rdnmadr":"경상남도 창원시 진해구 수제로36","latitude":35.08857013,"longitude":128.7478629},{"id":42,"prmisnZoneNm":"한밭야구장","lnmadr":"대전광역시 중구 부사동 209-1","rdnmadr":"대전광역시 중구 대종로 373, 한밭야구장 89머1606 (부사동)","latitude":36.317337,"longitude":127.4280138},{"id":43,"prmisnZoneNm":"인천가족공원","lnmadr":"","rdnmadr":"인천광역시 부평구 평온로 61, 인천가족공원 승화원 내 푸드트럭 지정장소 (부평동)","latitude":37.4774802146,"longitude":126.7167686974},{"id":44,"prmisnZoneNm":"칠곡군","lnmadr":"경상북도 칠곡군 석적읍 중지리 552","rdnmadr":"","latitude":36.018344,"longitude":128.401163},{"id":45,"prmisnZoneNm":"자연학습공원","lnmadr":"경기도 의왕시 월암동 543번지 3호 자연학습공원 내","rdnmadr":"경기도 의왕시 왕송못동로 307 (월암동, 자연학습공원 내)","latitude":37.30710763,"longitude":126.9531458},{"id":46,"prmisnZoneNm":"자연학습공원","lnmadr":"경기도 의왕시 월암동 543번지 3호 월암동 자연학습공원 내","rdnmadr":"경기도 의왕시 왕송못동로 307 (월암동, 월암동 자연학습공원 내)","latitude":37.30710763,"longitude":126.9531458},{"id":47,"prmisnZoneNm":"의왕시청","lnmadr":"경기도 의왕시 고천동 171번지 의왕시청","rdnmadr":"경기도 의왕시 시청로 11 (고천동, 의왕시청)","latitude":37.34531807,"longitude":126.9679891},{"id":48,"prmisnZoneNm":"자연학습공원","lnmadr":"경기도 의왕시 월암동 543번지 3호 자연학습공원 내","rdnmadr":"경기도 의왕시 왕송못동로 307 (월암동, 자연학습공원 내)","latitude":37.30710763,"longitude":126.9531458},{"id":49,"prmisnZoneNm":"청계TG졸음쉼터","lnmadr":"경기도 의왕시 청계동 산 8번지 18호 서울외곽고속도로 청계TG졸음쉼터 내","rdnmadr":"경기도 의왕시 안양판교로 476 (청계동, 서울외곽고속도로 청계TG졸음쉼터 내)","latitude":37.39327011,"longitude":127.0223096},{"id":50,"prmisnZoneNm":"치요남치킨강촌점","lnmadr":"강원도 춘천시 남면 가정리 908","rdnmadr":"강원도 춘천시 남면 충효로 1381","latitude":37.733325,"longitude":127.576019},{"id":51,"prmisnZoneNm":"강변쉼터","lnmadr":"강원도 춘천시 남산면 강촌리 570-3","rdnmadr":"강원도 춘천시 남산면 북한강변길 910-36 (마을회관 맞은편도로)","latitude":37.825508,"longitude":127.614821},{"id":52,"prmisnZoneNm":"강촌강변","lnmadr":"강원도 춘천시 남산면 강촌리 570-3","rdnmadr":"강원도 춘천시 남산면 북한강변길 910-36, 마을회관 맞은편 도로","latitude":37.825508,"longitude":127.614821},{"id":53,"prmisnZoneNm":"몽키푸드","lnmadr":"강원도 춘천시 남면 가정리 907-3","rdnmadr":"강원도 춘천시 남면 충효로 1381","latitude":37.733325,"longitude":127.576019},{"id":54,"prmisnZoneNm":"독산역 2번출구 앞 광장","lnmadr":"서울특별시 금천구 가산동 717","rdnmadr":"서울특별시 금천구 벚꽃로 115(가산동)","latitude":37.46598732,"longitude":126.8895142},{"id":55,"prmisnZoneNm":"다람산근린공원","lnmadr":"경기도 화성시 진안동 123-2번지 다람산근린공원","rdnmadr":"경기도 화성시 병점중앙로 229","latitude":37.2173701985,"longitude":127.0336057796},{"id":56,"prmisnZoneNm":"장안휴게소","lnmadr":"경기도 화성시 장안면 어은리 산53-1번지 장안휴게소","rdnmadr":"경기도 화성시 장안면 평택시흥고속도로 7","latitude":37.09250707,"longitude":126.8447422993},{"id":57,"prmisnZoneNm":"수원대학교","lnmadr":"경기도 화성시 정남면 보통리 141-44번지 수원과학대학교 및 수원대학교 교내","rdnmadr":"경기도 화성시 정남면 세자로 288","latitude":37.1920328913,"longitude":126.9839265343},{"id":58,"prmisnZoneNm":"서서울톨게이트,(서울방향)졸음쉼터 내","lnmadr":"경기도 안산시 상록구 장하동 산 8-1,서서울톨게이트 서울방향","rdnmadr":"","latitude":37.357642,"longitude":126.8650475},{"id":59,"prmisnZoneNm":"서서울톨게이트,(목포방향)졸음쉼터 내","lnmadr":"경기도 안산시 상록구 장하동 151,서서울TG(목포)졸음쉼터 내","rdnmadr":"경기도 안산시 상록구 장하로 141-2, 서서울TG(목포)졸음쉼터 내 (장하동)","latitude":37.3549176,"longitude":126.8619896},{"id":60,"prmisnZoneNm":"단원구노인복지관","lnmadr":"경기도 안산시 단원구 선부동 1077-9","rdnmadr":"경기도 안산시 단원구 선부광장1로 134, 단원구노인복지관 주차장 좌측 일부 (선부동)","latitude":37.3322685415,"longitude":126.8105841},{"id":61,"prmisnZoneNm":"만안구청","lnmadr":"","rdnmadr":"경기도 안양시 만안구 안양로128","latitude":37.38664272,"longitude":126.9324066},{"id":62,"prmisnZoneNm":"관악구민종합체육센터","lnmadr":"서울특별시 관악구 봉천동 225","rdnmadr":"서울특별시 관악구 봉천동 낙성대로3길 37 관악구민종합체육센터","latitude":37.473014,"longitude":126.960306},{"id":63,"prmisnZoneNm":"해운대구청","lnmadr":"부산광역시 해운대구 중동 1378-95","rdnmadr":"부산광역시 해운대구 중동2로 11","latitude":35.1631596,"longitude":129.1635629},{"id":64,"prmisnZoneNm":"부산시청 푸드트럭존","lnmadr":"부산광역시 연제구 연산동 1000","rdnmadr":"부산광역시 연제구 중앙대로 1001","latitude":35.17992599,"longitude":129.0750952},{"id":65,"prmisnZoneNm":"아시아드주경기장","lnmadr":"부산광역시 연제구 거제동 1299","rdnmadr":"부산광역시 연제구 월드컵대로 344","latitude":35.19008744,"longitude":129.058356},{"id":66,"prmisnZoneNm":"무지개푸드","lnmadr":"전라남도 장성군 황룡면 아곡리 342-3","rdnmadr":"","latitude":35.3184858781,"longitude":126.7291716},{"id":67,"prmisnZoneNm":"꼬치핀다","lnmadr":"전라남도 장성군 장성읍 장안리 475-13","rdnmadr":"","latitude":35.30864948,"longitude":126.7759834},{"id":68,"prmisnZoneNm":"황미르 토스트","lnmadr":"전라남도 장성군 장성읍 기산리 57-14","rdnmadr":"","latitude":35.30583915,"longitude":126.7776164},{"id":69,"prmisnZoneNm":"와플 스테이션","lnmadr":"전라남도 장성군 황룡면 장산리 663-25","rdnmadr":"","latitude":35.29940437,"longitude":126.7668566},{"id":70,"prmisnZoneNm":"옐로우킹스푸드","lnmadr":"전라남도 장성군 장성읍 용강리 164-1","rdnmadr":"","latitude":35.354967545,"longitude":126.8176662814},{"id":71,"prmisnZoneNm":"노작호수공원","lnmadr":"경기도 화성시 석우동 63번지 1호 노작호수공원","rdnmadr":"경기도 화성시 석우동 63번지 1호 노작호수공원","latitude":37.20627225,"longitude":127.0802263},{"id":72,"prmisnZoneNm":"동학산근린공원","lnmadr":"경기도 화성시 석우동 29번지 3호 동학산근린공원 내","rdnmadr":"경기도 화성시 석우동 29번지 3호 동학산근린공원 내","latitude":37.22046464,"longitude":127.0785845},{"id":73,"prmisnZoneNm":"상무시민공원","lnmadr":"광주광역시 서구 치평동 1162","rdnmadr":"광주광역시 서구 상무공원로 101","latitude":35.15339511,"longitude":126.8410975},{"id":74,"prmisnZoneNm":"풍암호수공원","lnmadr":"광주광역시 서구 풍암동 491-3","rdnmadr":"","latitude":35.126653,"longitude":126.868935},{"id":75,"prmisnZoneNm":"서울혁신파크","lnmadr":"서울특별시 은평구 녹번동 5-29","rdnmadr":"서울특별시 은평구 통일로 684","latitude":37.608442,"longitude":126.933496},{"id":76,"prmisnZoneNm":"빨간카페","lnmadr":"전라남도 여수시 화정면 조발리 산 30-1","rdnmadr":"","latitude":34.632366,"longitude":127.562707},{"id":77,"prmisnZoneNm":"문화시설","lnmadr":"전라남도 순천시 석현동 62-3","rdnmadr":"전라남도 순천시 환선로 133","latitude":34.9676736,"longitude":127.4867525},{"id":78,"prmisnZoneNm":"유원시설","lnmadr":"전라남도 순천시 석현동 50-9","rdnmadr":"전라남도 순천시 석현동 50-9","latitude":34.9694132,"longitude":127.4872612},{"id":79,"prmisnZoneNm":"저류시설","lnmadr":"전라남도 순천시 풍덕동 691","rdnmadr":"전라남도 순천시 풍덕동 691","latitude":34.935426,"longitude":127.4997445}]
//var list = JSON.parse("${locations}")
var markers = [];
var infoWindows =[];
function showData(list){
  
  for(var i = 0; i < list.length; i++){
   // if(list[i].latitude == 0)continue
    var marker = new naver.maps.Marker({
        map: map,
        title: list[i].prmisnZoneNm,
        position: new naver.maps.LatLng(list[i].latitude, list[i].longitude)
    });
   
    var infoWindow = new naver.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:10px;"> <b>"'+  list[i].prmisnZoneNm +'"</b>.</div>'
    })
    markers.push(marker);
    infoWindows.push(infoWindow);
}
for (var i = 0; i < markers.length; i++) {
    showMarker(map, markers[i]);
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}
naver.maps.Event.addListener(marker, "click", function(e){
  if(infoWindow.getMap()){
    infoWindow.close();
  }else{
    infoWindow
  }
})
}



function getClickHandler(seq){
  return function(e){
    var marker = markers[seq], infoWindow = infoWindows[seq];
    if(infoWindow.getMap()){
      infoWindow.close();
    }else{
      infoWindow.open(map, marker);
    }
  }
}
function showMarker(map, marker) {

if (marker.setMap()) return;
marker.setMap(map);
}

function hideMarker(map, marker) {

if (!marker.setMap()) return;
marker.setMap(null);
}


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>