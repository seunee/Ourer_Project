package com.ezen.finalpj.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class WaitingVO {
	private int wno;
	private String email;
	private int grno;
	private int isOk;
	private String grade;
}
