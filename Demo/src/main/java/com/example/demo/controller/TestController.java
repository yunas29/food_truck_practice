package com.example.demo.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@GetMapping("/getData")
	public String getData() throws IOException {
		String list = apiService.search();
		//return geoApiService.getLatLng(list);
		//return list;
		return list;
	}

}
