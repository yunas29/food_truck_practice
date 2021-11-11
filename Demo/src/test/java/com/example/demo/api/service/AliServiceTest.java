package com.example.demo.api.service;

import java.io.IOException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class AliServiceTest {
	
	@Autowired
	private ApiService apiService;
	@Test
	public void search() throws IOException {
		apiService.search();
	}

}
