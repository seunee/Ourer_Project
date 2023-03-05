package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.BoardVO;
import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO bdao;

	@Override
	public int insertBoard(BoardVO bvo) {
		log.info("insertBoard service chk");
		return bdao.insertBoard(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("selectBoardList service chk");
		return bdao.selectBoardList();
	}

	@Override
	public BoardVO getDetail(int bno) {
		log.info("selectBoardDetail service chk");
		return bdao.selectBoardDetail(bno);
	}

	@Override
	public int updateViewGet(int bno) {
		log.info("updateViewGet service chk");
		return bdao.updateBoardView(bno);
	}

	@Override
	public int updateBoard(BoardVO bvo) {
		log.info("updateBoard service chk");
		return bdao.updateBoard(bvo);
	}

	@Override
	public int deleteBoard(int bno) {
		log.info("deleteBoard service chk");
		return bdao.deleteBoard(bno);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info("boardListpaging service chk");
		return bdao.selectBoardListPaging(pgvo);
	}

	@Override
	public int getListCount() {
		log.info("boardListCount service chk");
		return bdao.selectBoardListCount();
	}

	
}
