package com.ezen.finalpj.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class GPagingVO {
	private int qty;
	private int pageNo;
	private int grno;
	
	public GPagingVO(int pageNo, int qty) {
		this.pageNo=pageNo;
		this.qty=qty;
	}
	
	public GPagingVO() {
		this(1,10);
	}
	
	public int getStartIndex() {
		return(this.pageNo-1)*qty;
	}
}
