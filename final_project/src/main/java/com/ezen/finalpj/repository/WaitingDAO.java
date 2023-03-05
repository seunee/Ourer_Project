package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.WaitingVO;

public interface WaitingDAO {
	
	int insertMemWaitPost(WaitingVO wvo);

	int deleteUser(String email);

	int appointment(WaitingVO wvo);

	int cancellation(WaitingVO wvo);
	
	WaitingVO selectGetWaiting(String email);
	
	int acceptWaiting(WaitingVO wvo);

	int refuseWaiting(WaitingVO wvo);
	
	int selectGrpCount(int grno);
	
	int quit(WaitingVO wvo);
	
  
	
}
