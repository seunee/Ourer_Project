package com.ezen.finalpj.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class JoinPersonVO {
	private int jno;
	private int sno;
	private String email;
	private int grno;
}
