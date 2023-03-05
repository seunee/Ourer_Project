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
public class GroupVO {
	private int grno;
	private String name;
	private int max_member;
	private String city;
	private String county;
	private String detail;
	private String regdate;
	private int ctno;
	private int isFree;
	private int isFace;
	private String email;
	private String code;
}
