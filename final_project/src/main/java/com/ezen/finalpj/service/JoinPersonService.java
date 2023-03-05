package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.JoinPersonDTO;
import com.ezen.finalpj.domain.JoinPersonVO;

public interface JoinPersonService {

	int insertJpPost(JoinPersonVO jvo);

	List<JoinPersonDTO> selectListJp();

	int deleteJp(int jno);

	int selectSnoJp(int jno);

}
