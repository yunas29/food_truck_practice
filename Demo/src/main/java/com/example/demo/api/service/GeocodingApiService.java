package com.example.demo.api.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.api.dto.FoodTruckInfo;
//curl -G "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode" \
//--data-urlencode "query={주소}" \
//--data-urlencode "coordinate={검색_중심_좌표}" \
//-H "X-NCP-APIGW-API-KEY-ID: {애플리케이션 등록 시 발급받은 client id값}" \
//-H "X-NCP-APIGW-API-KEY: {애플리케이션 등록 시 발급받은 client secret값}" -v

//{
//    "status": "OK",
//    "meta": {
//        "totalCount": 1,
//        "page": 1,
//        "count": 1
//    },
//    "addresses": [
//        {
//            "roadAddress": "경기도 성남시 분당구 불정로 6 그린팩토리",
//            "jibunAddress": "경기도 성남시 분당구 정자동 178-1 그린팩토리",
//            "englishAddress": "6, Buljeong-ro, Bundang-gu, Seongnam-si, Gyeonggi-do, Republic of Korea",
//            "addressElements": [
//                {
//                    "types": [
//                        "POSTAL_CODE"
//                    ],
//                    "longName": "13561",
//                    "shortName": "",
//                    "code": ""
//                }
//            ],
//            "x": "127.10522081658463",
//            "y": "37.35951219616309",
//            "distance": 20.925857741585514
//        }
//    ],
//    "errorMessage": ""
//}
@Service
public class GeocodingApiService {
	
	@Value("${naver.ncpClientId}")
	private String X_NCP_APIGW_API_KEY_ID;
	@Value("${naver.secretClient}")
	private String X_NCP_APIGW_API_KEY;

	private static final String NAVER_MAP_API_URL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/gecode?query=";
	
	public FoodTruckInfo searchGeo(String address) {
		System.out.println("주소: " + address + "------------>");
		StringBuilder sb = new StringBuilder();
		FoodTruckInfo foodTruckInfo = new FoodTruckInfo();
		try {
			URL url = new URL(NAVER_MAP_API_URL + address);
			HttpsURLConnection http = (HttpsURLConnection) url.openConnection();
			//http.setRequestProperty("Content-Type", "application/json");
			http.setRequestProperty("X_NCP_APIGW_API_KEY_ID", X_NCP_APIGW_API_KEY_ID);
			http.setRequestProperty("X_NCP_APIGW_API_KEY", X_NCP_APIGW_API_KEY);
			http.setRequestMethod("GET");
			http.connect();
			
			InputStreamReader in = new InputStreamReader(http.getInputStream(), "utf-8");
			BufferedReader br = new BufferedReader(in);
			String line;
			while((line = br.readLine())!=null) {
				sb.append(line).append("\n");
			}
			JSONObject jObject = new JSONObject(sb.toString());
		     
	        JSONObject j1 = jObject.getJSONObject("body").getJSONObject("addresses").getJSONObject("x");
	        JSONObject j2 = jObject.getJSONObject("body").getJSONObject("addresses").getJSONObject("y");
	     
	        foodTruckInfo.setLatitude(Double.parseDouble(j2.toString()));
	        foodTruckInfo.setLongitude(Double.parseDouble(j1.toString()));
	        System.out.println("위도: " + j2.toString() + " 경도: " + j1.toString());
	        br.close();
	        http.disconnect();
		}catch(Exception e) {
			
		}
		return foodTruckInfo;
	}
	
}
