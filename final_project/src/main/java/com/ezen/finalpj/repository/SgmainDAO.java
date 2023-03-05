package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.SearchVO;
import com.ezen.finalpj.domain.SgMainVO;

public interface SgmainDAO {

	List<SgMainVO> getSgmain(int grno);

	List<SgMainVO> getSgMainImg();
	
   List<SgMainVO> getSgMainImgSearching(SearchVO scvo);
}
