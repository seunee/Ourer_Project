package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.SearchVO;
import com.ezen.finalpj.domain.SgMainVO;

public interface SgmainService {

	List<SgMainVO> getSgmain(int grno);

	List<SgMainVO> getSgMainImg();
	
   List<SgMainVO> getSgMainImgSearching(SearchVO scvo);

}
