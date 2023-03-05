package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.BoardVO;
import com.ezen.finalpj.domain.PagingVO;

public interface BoardService {

	int insertBoard(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO getDetail(int bno);

	int updateViewGet(int bno);

	int updateBoard(BoardVO bvo);

	int deleteBoard(int bno);

	List<BoardVO> getList(PagingVO pgvo);

	int getListCount();

	
	
}
