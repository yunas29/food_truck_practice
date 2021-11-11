package com.example.demo.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodTruckInfo {
	private Long id;
	private String lnmadr;//주소
	private String rdnmadr;
	private String latitude;
	private String longitude;

}
