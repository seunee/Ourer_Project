package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/favorite/*")
@Controller
public class FavoriteController {
	
	@Inject
	private FavoriteService fsv;
	
	@PostMapping(value = "/like", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> clickFavoritePost(@RequestBody FavoriteVO fvo, Model model){
		log.info(fvo.toString());
		int isOk=-1;
		//fvo에서 받아온 이메일이랑 grno 이용해서 favorite 테이블에 있는지 조회
		int hasFav=fsv.selectFavorite(fvo);
		if(hasFav>0) {
			isOk=fsv.deleteFavorite(fvo);
			log.info("찜 삭제");
			model.addAttribute("grno", fvo.getGrno());
			return new ResponseEntity<String>("1", HttpStatus.OK);
		}else {
			isOk=fsv.insertFavorite(fvo);
			log.info("찜 추가");
			model.addAttribute("grno", fvo.getGrno());
			return new ResponseEntity<String>("2", HttpStatus.OK);
		}
	}
	
	@GetMapping(value="/mylike/{email}")
	public String likeListGet(@PathVariable("email")String email, Model model) {

		List<FavoriteDTO> gList = fsv.favoriteList(email);
		List<FavoriteVO> fList=fsv.selectFList(email);
		String name = fsv.selectmyGname(email);
		log.info("내가 찜한 소모임 리스트 >>> "+gList.toString());
		log.info("찜 db >>> "+fList.toString());
		log.info("소모임명 >>> "+name);
		model.addAttribute("gList", gList);
		model.addAttribute("fList", fList);
		model.addAttribute("name", name);
		
		return "/favorite/mylike";
	}
}
