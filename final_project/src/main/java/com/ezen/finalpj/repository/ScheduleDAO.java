package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> selectListSch(int grno);

	int insertSch(ScheduleVO svo);

	int selectGrnoSch(int sno);

	int deleteSch(int grno);

	//int insertJoinMem(int sno);

	int updateJoinMem(int sno);

	int selectMaxSno();

	//int selectSno(int jno);

	int updateJoinMemDelete(int sno);

	int updateIsDonePut(int sno);

}
