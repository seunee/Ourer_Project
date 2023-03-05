package com.ezen.finalpj.domain;

import java.util.List;

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
public class UserVO {
	
	private String email;
	private String name;
	private String pw;
	private String area;
	private String nickname;
	private int age;
	private int gender;
	private String phone;
	private String isDel;
	private int ctno_1;
	private int ctno_2;
	private int ctno_3;
	private int isCap;
	private List<WaitingVO> waitList;
	private String ctcode_1;
	private String ctcode_2;
	private String ctcode_3;

}
