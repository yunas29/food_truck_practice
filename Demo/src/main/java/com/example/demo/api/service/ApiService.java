package com.example.demo.api.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.api.dto.FoodTruckInfo;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class ApiService {
	@Value("${data.encodingKey}")
	private String encodingKey;
	@Value("${data.decodingKey}")
	private String decodingKey;
	
	@Autowired
	private GeocodingApiService geoApiService;
	
	public String search() throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_food_truck_permit_area_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + encodingKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        JSONObject jObject = new JSONObject(sb.toString());
      
        JSONArray j1 = jObject.getJSONObject("response").getJSONObject("body").getJSONArray("items");
        List<FoodTruckInfo> list = new ArrayList<>();
        long idx = 1;
        for(int i = 0; i < j1.length(); i++) {
        	//System.out.println(j1.get(i));
        	JSONObject oj = j1.getJSONObject(i);
        	String lnmadr = oj.getString("lnmadr");
        	String rdnmadr = oj.getString("rdnmadr");
        	String prmisnZoneNm = oj.getString("prmisnZoneNm");
//        	if(lnmadr == null || lnmadr.equals("")) {
//        		lnmadr = rdnmadr;
//        		rdnmadr = null;
//        	}
        	double lat = 0, lng = 0;
        	try {
        		lat = Double.parseDouble(oj.getString("latitude"));
        		lng = Double.parseDouble(oj.getString("longitude"));
        	}catch(NumberFormatException e) {
        		continue;
//        		FoodTruckInfo f = geoApiService.searchGeo(lnmadr);
//        		lat = f.getLatitude();
//        		lng = f.getLongitude();
        	}
        	
        	list.add(new FoodTruckInfo(idx, prmisnZoneNm, lnmadr, rdnmadr, lat, lng));
        	idx++;
        			
        }
        rd.close();
        conn.disconnect();
       // System.out.println(sb.toString());
        return new ObjectMapper().writeValueAsString(list);
        
	}

}
