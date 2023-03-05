package com.ezen.finalpj.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SgMainVO {
	private int grno;
	private long size;
	private String name;
	private String dir;
	private String uuid;
	
	private String city;
	private String sg_name;
	private String detail;
	private String county;
}
