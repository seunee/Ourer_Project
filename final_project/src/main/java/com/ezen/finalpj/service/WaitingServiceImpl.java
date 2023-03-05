package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.WaitingVO;
import com.ezen.finalpj.repository.WaitingDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WaitingServiceImpl implements WaitingService {
	@Inject
	private WaitingDAO wdao;
	
	
	@Override
	public int insertMemWaitPost(WaitingVO wvo) {
		return wdao.insertMemWaitPost(wvo);
	}

	@Override
	public int remove(String email) {
		log.info("waiting user remove");
		return wdao.deleteUser(email);
	}

	@Override
	public int appointment(WaitingVO wvo) {
		log.info("operator appointment email");
		return wdao.appointment(wvo);
	}

	@Override
	public int cancellation(WaitingVO wvo) {
		log.info("operator cancellation email");
		return wdao.cancellation(wvo);
	}
	
	@Override
	public int acceptWaiting(WaitingVO wvo) {
		log.info("grno 가져가기");
		return wdao.acceptWaiting(wvo);
	}

	@Override
	public int refuseWaiting(WaitingVO wvo) {
		log.info("grno 뜯어가기");
		return wdao.refuseWaiting(wvo);
	}
	 
	
	@Override
	public int selectGrpCount(int grno) {
		log.info("grno 가져와라");
		return wdao.selectGrpCount(grno);
	}

	@Override
	public WaitingVO selectUserGrp(String email) {
		log.info("마지막 잎새");
		return wdao.selectGetWaiting(email);
	}
	
	@Override
	public int quit(WaitingVO wvo) {
		log.info("quit a smallgroup email");
		return wdao.quit(wvo);
	}


}
