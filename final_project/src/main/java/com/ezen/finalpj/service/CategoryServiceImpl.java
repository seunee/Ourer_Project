package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.CategoryVO;
import com.ezen.finalpj.repository.CategoryDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CategoryServiceImpl implements CategoryService {
	@Inject
	private CategoryDAO cdao;

	@Override
	public List<CategoryVO> getCategoryList(String code) {
		log.info("category List 불러오기");
		return cdao.getCategoryList(code);
	}

	@Override
	public List<CategoryVO> getCateNameList(String name) {
		log.info("category name별 List 불러오기");
		return cdao.getCateNameList(name);
	}

	@Override
	public String getCategoryCode(String name) {
		log.info("category name별 code 불러오기");
		return cdao.getCategoryCode(name);
	}

	@Override
	public List<CategoryVO> getCategoryDetailList(String code) {
		log.info("category name별 List 불러오기");
		return cdao.getCategoryDetailList(code);
	}

	@Override
	public List<CategoryVO> getCategoryOne(String name) {
		log.info("category 소분류 List 불러오기");
		return cdao.getCategoryOne(name);
	}
	
	@Override
	public List<CategoryVO> getCategoryOneRandom() {
		log.info("category 소분류 List 불러오기");
		return cdao.getCategoryOneRandom();
	}

	@Override
	public List<CategoryVO> selectRecoList(String county) {
		log.info("지역별 추천 소모임 리스트");
		return cdao.selectRecoList(county);
	}

}
