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
public class ScheduleVO {
	private int sno;
	private int grno;
	private String meetdate;
	private String title;
	private String spot;
	private int max_member;
	private String cost;
	private int joinmember;
}
