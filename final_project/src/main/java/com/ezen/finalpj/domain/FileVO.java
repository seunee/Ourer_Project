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
public class FileVO {
	private int gbno;
	private long size;
	private String name;
	private String dir;
	private String regdate;
	private String uuid;
}
