package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.api.dto.FoodTruckInfo;
import com.example.demo.api.service.ApiService;
import com.example.demo.api.service.GeocodingApiService;

@RestController
@RequestMapping("/api")
public class TestController {
	
	@Autowired
	private ApiService apiService;
	
	@Autowired
	private GeocodingApiService geoApiService;
	
	@ResponseBody
	@PostMapping("/getData")
	public List<FoodTruckInfo> getData() throws IOException {
		List<FoodTruckInfo> list = apiService.search();
		//return geoApiService.getLatLng(list);
		//return list;
		return list;
	}

}
