package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.ScheduleVO;
import com.ezen.finalpj.repository.ScheduleDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Inject
	private ScheduleDAO sdao;

	@Override
	public List<ScheduleVO> selectListSch(int grno) {
		log.info("스케줄 리스트 호출");
		List<ScheduleVO> sList=sdao.selectListSch(grno);
		return sList;
	}

	@Override
	public int insertSch(ScheduleVO svo) {
		log.info("스케줄 추가");
		return sdao.insertSch(svo);
	}

	@Override
	public int selectGrnoSch(int sno) {
		log.info("스케줄에서 grno 가져오기");
		return sdao.selectGrnoSch(sno);
	}

	@Override
	public int deleteSch(int sno) {
		log.info("스케줄 삭제");
		return sdao.deleteSch(sno);
	}

	@Override
	public int updateJoinMemPost(int sno) {
		log.info("스케줄 참가 인원 추가");
		return sdao.updateJoinMem(sno);
	}

	@Override
	public int selectMaxSnoSch() {
		log.info("sno 가져오기");
		return sdao.selectMaxSno();
	}

	@Override
	public int updateJoinMemDelete(int sno) {
		log.info("스케줄 참가 인원 삭제");
		return sdao.updateJoinMemDelete(sno);
	}

	@Override
	public int updateIsDoneSche(int sno) {
		log.info("지난 스케줄 업데이트");
		return sdao.updateIsDonePut(sno);
	}

}
