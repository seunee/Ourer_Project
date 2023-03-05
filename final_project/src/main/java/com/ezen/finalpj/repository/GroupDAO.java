package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.SgMainVO;

public interface GroupDAO {

	int insertGrp(GroupVO gvo);

	GroupVO selectGrp(int grno);

	int selectGrnoGrp(String email);

	int insertSgMain(SgMainVO smvo);

	SgMainVO selectSgMain(int grno);

	int deleteSgMain(int grno);
	
	GroupVO seletSg(int ctno);

	List<GroupVO> selectGroup(int ctno);

	List<GroupVO> getAllList(PagingVO pgvo);

	List<GroupVO> CategoryOne(String code);

	int selectCount(PagingVO pgvo);

	List<GroupVO> selectGrpList();

	int deleteGrpList(String grno);

	int updateDetailGrp(GroupVO gvo);


}
