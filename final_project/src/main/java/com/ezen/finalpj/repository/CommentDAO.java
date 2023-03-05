package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.CommentVO;

public interface CommentDAO {

	int insertCmt(CommentVO cvo);

	List<CommentVO> selectListCmt(int gbno);

	int updateCmt(CommentVO cvo);

	int deleteCmt(int cno);

}
