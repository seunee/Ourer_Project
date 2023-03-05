package com.ezen.finalpj.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class FavoriteDTO {
	private int grno;
	private String ctname;
	private String gname;
	private String gdetail;
	private String wgrade;

}
