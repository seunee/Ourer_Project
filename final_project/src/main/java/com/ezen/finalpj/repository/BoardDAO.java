package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.BoardVO;
import com.ezen.finalpj.domain.PagingVO;

public interface BoardDAO {

	int insertBoard(BoardVO bvo);

	List<BoardVO> selectBoardList();

	BoardVO selectBoardDetail(int bno);

	int updateBoardView(int bno);

	int updateBoard(BoardVO bvo);

	int deleteBoard(int bno);

	List<BoardVO> selectBoardListPaging(PagingVO pgvo);

	int selectBoardListCount();

	

}
