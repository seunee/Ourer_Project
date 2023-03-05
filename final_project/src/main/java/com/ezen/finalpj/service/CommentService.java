package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.CommentVO;

public interface CommentService {

	int insertCmt(CommentVO cvo);

	List<CommentVO> selectListCmt(int gbno);

	int updateCmt(CommentVO cvo);

	int deleteCmt(int cno);

}
