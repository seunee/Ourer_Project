package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.domain.CategoryVO;
import com.ezen.finalpj.domain.SearchVO;
import com.ezen.finalpj.domain.SgMainVO;
import com.ezen.finalpj.service.CategoryService;
import com.ezen.finalpj.service.SgmainService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/category/*")
@Controller
public class CategoryController {
	@Inject
	private SgmainService ssv;
	@Inject
	private CategoryService csv;
	
	// 소모임 전체리스트 불러오기
	@GetMapping("/categorymain")
	public String categorymain(Model model,SearchVO scvo) {
      List<SgMainVO> sgList = ssv.getSgMainImgSearching(scvo);
	  log.info("test : " + sgList.toString());
	  model.addAttribute("sgList", sgList);
	     
	  return "/category/categorymain";
	}
	
	//소모임 카테고리별 불러오기
	@GetMapping("/categoryDetail")
	public String categoryDetail(Model model, @RequestParam("code")String code) {
		List<CategoryVO> cateList = csv.getCategoryList(code);
		List<CategoryVO> cList = csv.getCategoryDetailList(code);
		log.info("카테고리별 불러오기 : "+cateList.toString());
		model.addAttribute("cateList", cateList);
		model.addAttribute("cList", cList);
		return "/category/categoryDetail";
	}
	
	// 소모임 세부 카테고리별 리스트 출력
	@GetMapping("/categoryName")
	public String categoryName(Model model, @RequestParam("name")String name) {
		String code=csv.getCategoryCode(name);
		List<CategoryVO> cList = csv.getCategoryDetailList(code);
		List<CategoryVO> cateList = csv.getCategoryOne(name);
		log.info("세부 카테고리별 C리스트 출력"+cList.toString());
		log.info("세부 카테고리별 G리스트 출력"+cateList.toString());
		
		model.addAttribute("cList", cList);
		model.addAttribute("cateList", cateList);
		return "/category/categoryNameList";
	}
	
	
	//home.jsp 오늘의 추천 소모임 리스트 랜덤 추천
	@GetMapping("/categoryRandom")
	public String categoryRandom(Model model) {
		List<SgMainVO> sList = ssv.getSgMainImg();
		log.info("test : " + sList.toString());
		// 랜덤출력
		
		
		
		model.addAttribute("sList", sList);
		return "/";
	}

}
