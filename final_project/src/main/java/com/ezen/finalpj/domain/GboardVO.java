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
public class GboardVO {
	private int gbno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int view;
	private String cate;
	private int grno;

}
