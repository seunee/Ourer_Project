package com.ezen.finalpj.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CategoryVO {
	private int ctno;
	private String name;
	private String code;

	private int grno;
	private long size;
	private String sm_name;
	private String dir;
	private String uuid;
	
	private String city;
	private String sg_name;
	private String detail;
	private String county;
}
