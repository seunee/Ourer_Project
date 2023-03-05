package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.JoinPersonDTO;
import com.ezen.finalpj.domain.JoinPersonVO;
import com.ezen.finalpj.repository.JoinPersonDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JoinPersonServiceImpl implements JoinPersonService {
	@Inject
	private JoinPersonDAO jpdao;

	@Override
	public int insertJpPost(JoinPersonVO jvo) {
		return jpdao.insertJp(jvo);
	}

	@Override
	public List<JoinPersonDTO> selectListJp() {
		log.info("참가자 리스트");
		return jpdao.selectList();
	}

	@Override
	public int deleteJp(int jno) {
		return jpdao.deleteJp(jno);
	}

	@Override
	public int selectSnoJp(int jno) {
		return jpdao.selectSno(jno);
	}
}
