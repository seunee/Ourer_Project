package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.GPagingVO;
import com.ezen.finalpj.domain.GboardDTO;
import com.ezen.finalpj.domain.GboardVO;

public interface GboardService {

	List<GboardVO> selectListGbrd(GPagingVO gpvo);

	int insertGbrd(GboardVO gbvo);

	GboardVO selectDetailGbrd(int gbno);

	int updateViewGbrd(int gbno);

	int updateGbrd(GboardVO gbvo);

	int deleteGbrd(int gbno);

	int insertGbrd(GboardDTO gbdto);

	GboardDTO selectDetailFileGbrd(int gbno);

	int deleteFile(String uuid);

	int updateGbrd(GboardDTO gbdto);

	int getTotalPage(int grno);

}
