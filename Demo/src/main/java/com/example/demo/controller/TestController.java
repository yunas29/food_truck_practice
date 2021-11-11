package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.api.dto.FoodTruckInfo;
import com.example.demo.api.service.ApiService;

@RestController
@RequestMapping("/api")
public class TestController {
	
	@Autowired
	private ApiService apiService;
	
	@GetMapping("/getData")
	public String getData() throws IOException {
		List<FoodTruckInfo> list = apiService.search();
		return list.toString();
	}

}
