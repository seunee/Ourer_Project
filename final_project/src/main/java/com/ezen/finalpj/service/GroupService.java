package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.SgMainVO;

public interface GroupService {

	int insertGrp(GroupVO gvo);

	GroupVO selectGrp(int grno);

	int selectGrnoGrp(String email);

	int insertSgMain(SgMainVO smvo);

	SgMainVO selectSgMain(int grno);

	int deleteSgMain(int grno);

	List<GroupVO> getAllList(PagingVO pgvo);

	List<GroupVO> CategoryOne(String code);

	int getPageCount(PagingVO pgvo);

	List<GroupVO> selectGrpList();

	int removeGrp(String grno);

	int modifyDetailGrp(GroupVO gvo);
}
