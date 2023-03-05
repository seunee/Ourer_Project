package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.JoinPersonDTO;
import com.ezen.finalpj.domain.JoinPersonVO;

public interface JoinPersonDAO {

	int insertJp(JoinPersonVO jvo);

	List<JoinPersonDTO> selectList();

	int deleteJp(int jno);

	int selectSno(int jno);

}
