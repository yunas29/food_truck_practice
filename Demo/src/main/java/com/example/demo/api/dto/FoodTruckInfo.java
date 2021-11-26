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
	private String prmisnZoneNm;
	private String lnmadr;//주소
	private String rdnmadr;
	private double latitude;
	private double longitude;

}
