package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.CategoryVO;

public interface CategoryDAO {

	List<CategoryVO> getCategoryList(String code);

	List<CategoryVO> getCateNameList(String name);

	String getCategoryCode(String name);

	List<CategoryVO> getCategoryDetailList(String code);

	List<CategoryVO> getCategoryOne(String name);

	List<CategoryVO> getCategoryOneRandom();

	List<CategoryVO> selectRecoList(String county);
}
