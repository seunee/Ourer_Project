package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.SgMainVO;
import com.ezen.finalpj.repository.GroupDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GroupServiceImpl implements GroupService {
	@Inject
	private GroupDAO gdao;

	@Override
	public int insertGrp(GroupVO gvo) {
		log.info(gvo.toString());
		int isOk=gdao.insertGrp(gvo);
		log.info("소모임 등록 서비스"+(isOk>0?"성공":"실패"));
		return isOk;
	}

	@Override
	public GroupVO selectGrp(int grno) {
		log.info("소모임 메인에 값 호출");
		GroupVO gvo=gdao.selectGrp(grno);
		return gvo;
	}

	@Override
	public int selectGrnoGrp(String email) {
		log.info("소모임 grno 호출");
		return gdao.selectGrnoGrp(email);
	}

	@Override
	public int insertSgMain(SgMainVO smvo) {
		log.info("소모임 메인 등록");
		gdao.deleteSgMain(smvo.getGrno());
		return gdao.insertSgMain(smvo);
	}

	@Override
	public SgMainVO selectSgMain(int grno) {
		log.info("소모임 메인 호출");
		return gdao.selectSgMain(grno);
	}

	@Override
	public int deleteSgMain(int grno) {
		log.info("소모임 메인 삭제");
		return gdao.deleteSgMain(grno);
	}

	@Override
	public List<GroupVO> getAllList(PagingVO pgvo) {
		log.info("group List check 2");
		return gdao.getAllList(pgvo);
	}

	@Override
	public List<GroupVO> CategoryOne(String code) {
		log.info("group SelectOne List check 2");
		return gdao.CategoryOne(code);
	}

	@Override
	public int getPageCount(PagingVO pgvo) {
		log.info("group total paging test");
		return gdao.selectCount(pgvo);
	}

	@Override
	public List<GroupVO> selectGrpList() {
		log.info("get group list ");
		return gdao.selectGrpList();
	}

	@Override
	public int removeGrp(String grno) {
		log.info("remove group list");
		return gdao.deleteGrpList(grno);
	}

	@Override
	public int modifyDetailGrp(GroupVO gvo) {
		return gdao.updateDetailGrp(gvo);
	}

}
