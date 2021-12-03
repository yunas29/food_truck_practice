package com.example.demo.controller;
 
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.api.service.ApiService;
 
@Controller
@RequestMapping
public class HomeController {
    
    @Autowired
    private ApiService apiService;
 
	@GetMapping(value="/index")
    public String index(Model model) throws IOException {
		//model.addAttribute("locations", apiService.search());
		return "index";
    }
	
	@GetMapping(value="/process")
	public String process() {
		return "process";
	}
	
	@GetMapping(value="/area")
	public String area() {
		return "area";
	}
	
	@GetMapping(value="/map")
	public String map() {
		return "map";
	}
    
}