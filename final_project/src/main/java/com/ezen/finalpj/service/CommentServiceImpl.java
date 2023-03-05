package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.CommentVO;
import com.ezen.finalpj.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	private CommentDAO cdao;

	@Override
	public int insertCmt(CommentVO cvo) {
		log.info("댓글 등록");
		return cdao.insertCmt(cvo);
	}

	@Override
	public List<CommentVO> selectListCmt(int gbno) {
		log.info("댓글 리스트");
		return cdao.selectListCmt(gbno);
	}

	@Override
	public int updateCmt(CommentVO cvo) {
		log.info("댓글 수정");
		return cdao.updateCmt(cvo);
	}

	@Override
	public int deleteCmt(int cno) {
		log.info("댓글 삭제");
		return cdao.deleteCmt(cno);
	}
}
