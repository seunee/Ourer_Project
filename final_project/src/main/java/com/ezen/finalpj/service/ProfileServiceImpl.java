package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.ProfileVO;
import com.ezen.finalpj.repository.ProfileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfileServiceImpl implements ProfileService {
	
	@Inject
	private ProfileDAO pdao;

	@Override
	public ProfileVO selectProfile(String email) {
		log.info("profile list");
		return pdao.selectProfile(email);
	}

	@Override
	public ProfileVO selectPersonalProfile(String email) {
		log.info("personal profile");
		return pdao.selectPersonalProfile(email);
	}


}
