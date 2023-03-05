package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.GPagingVO;
import com.ezen.finalpj.domain.GboardDTO;
import com.ezen.finalpj.domain.GboardVO;
import com.ezen.finalpj.repository.FileDAO;
import com.ezen.finalpj.repository.GboardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GboardServiceImpl implements GboardService {
	@Inject
	private GboardDAO gbdao;
	@Inject
	private FileDAO gfdao;

	@Override
	public List<GboardVO> selectListGbrd(GPagingVO gpvo) {
		log.info("그룹 게시판 호출");
		return gbdao.selectListGbrd(gpvo);
	}

	@Override
	public int insertGbrd(GboardVO gbvo) {
		log.info("그룹 게시글 등록");
		return gbdao.insertGbrd(gbvo);
	}

	@Override
	public GboardVO selectDetailGbrd(int gbno) {
		log.info("그룹 디테일");
		return gbdao.selectDetailGbrd(gbno);
	}

	@Override
	public int updateViewGbrd(int gbno) {
		log.info("조회수 업데이트");
		return gbdao.updateViewGbrd(gbno);
	}

	@Override
	public int updateGbrd(GboardVO gbvo) {
		log.info("게시글 수정");
		return gbdao.updateGbrd(gbvo);
	}

	@Override
	public int deleteGbrd(int gbno) {
		log.info("게시글 삭제");
		return gbdao.deleteGbrd(gbno);
	}

	@Override
	public int insertGbrd(GboardDTO gbdto) {
		log.info("게시글 등록-파일");
		int isOk=gbdao.insertGbrd(gbdto.getGbvo());
		
		if(isOk>0&&gbdto.getGfvo().getSize()>0) {
			int gbno=gbdao.selectMaxGbno();
			gbdto.getGfvo().setGbno(gbno);
			isOk*=gfdao.insertFile(gbdto.getGfvo());
		}
		return isOk;
	}

	@Override
	public GboardDTO selectDetailFileGbrd(int gbno) {
		GboardDTO gbdto=new GboardDTO(gbdao.selectDetailGbrd(gbno), gfdao.selectFile(gbno));
		return gbdto;
	}

	@Override
	public int deleteFile(String uuid) {
		return gfdao.deleteFile(uuid);
	}

	@Override
	public int updateGbrd(GboardDTO gbdto) {
		int isOk=gbdao.updateGbrd(gbdto.getGbvo());
		if(isOk>0&&gbdto.getGfvo().getSize()>0) {
			int gbno=gbdto.getGbvo().getGbno();
			gbdto.getGfvo().setGbno(gbno);
			isOk*=gfdao.insertFile(gbdto.getGfvo());
		}
		return isOk;
	}

	@Override
	public int getTotalPage(int grno) {
		return gbdao.getTotalPage(grno);
	}
}
