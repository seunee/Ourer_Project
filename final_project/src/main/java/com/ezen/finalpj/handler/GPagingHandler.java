package com.ezen.finalpj.handler;

import com.ezen.finalpj.domain.GPagingVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class GPagingHandler {
	private int endPage;
	private int startPage;
	private int totalPage;
	private boolean prev;
	private boolean next;
	private GPagingVO gpvo;
	
	public GPagingHandler(GPagingVO gpvo, int totalPage) {
		this.gpvo=gpvo;
		this.totalPage=totalPage;
		
		this.endPage=(int)Math.ceil(gpvo.getPageNo()/(gpvo.getQty()*1.0))*gpvo.getQty();
		this.startPage=endPage-9;
		
		int realEndPage=(int)Math.ceil(totalPage/(gpvo.getQty()*1.0));
		if(realEndPage<this.endPage) {
			this.endPage=realEndPage;
		}
		this.prev=this.startPage>1;
		this.next=this.endPage<realEndPage;
	}
	
}
