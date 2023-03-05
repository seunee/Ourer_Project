package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.ProfileVO;

public interface ProfileDAO {

	int insertFile(ProfileVO pvo);

	String selectOneUser();
	
	List<ProfileVO> getProfile();
	
	ProfileVO selectProfile(String email);

	ProfileVO selectPersonalProfile(String email);


}
