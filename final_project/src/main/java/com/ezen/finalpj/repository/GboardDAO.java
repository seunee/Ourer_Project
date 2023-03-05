package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.GPagingVO;
import com.ezen.finalpj.domain.GboardVO;

public interface GboardDAO {

	List<GboardVO> selectListGbrd(GPagingVO gpvo);

	int insertGbrd(GboardVO gbvo);

	GboardVO selectDetailGbrd(int gbno);

	int updateViewGbrd(int gbno);

	int updateGbrd(GboardVO gbvo);

	int deleteGbrd(int gbno);

	int selectMaxGbno();

	int getTotalPage(int grno);

}
