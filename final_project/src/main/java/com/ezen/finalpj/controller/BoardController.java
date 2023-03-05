package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.BoardVO;
import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.handler.PagingHandler;
import com.ezen.finalpj.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	@Inject
	private BoardService bsv;
	
	@GetMapping("/register")
	public String boardRegisterGet() {
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String insertBoardPost(BoardVO bvo, RedirectAttributes reAttr) {
		log.info("insertBoard >>> "+bvo.toString());
		int isOk = bsv.insertBoard(bvo);
		reAttr.addFlashAttribute("isOk", isOk>0?"1":"0");
		log.info(isOk>0?"등록성공":"등록실패");
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String selectBoardListGet(Model model, PagingVO pgvo) {
		log.info("board paging >>> "+pgvo.getPageNo());
		List<BoardVO> list = bsv.getList(pgvo);
		int totalCount = bsv.getListCount();
		PagingHandler pgh = new PagingHandler(pgvo, totalCount);
		model.addAttribute("pgh", pgh);
		model.addAttribute("list", list);
		return "/board/list";
	}
	
	@GetMapping({"/detail", "/modify"})
	public void selectDetailAndModifyGet(Model model, @RequestParam("bno")int bno) {
		int isOk = bsv.updateViewGet(bno);
		log.info("updateViewGet >>> "+(isOk>0?"게시글보기 성공":"게시글보기 실패"));
		BoardVO bvo = bsv.getDetail(bno);
		model.addAttribute("bvo", bvo);
	}
	
	@PostMapping("/modify")
	public String updateBoardPost(BoardVO bvo, RedirectAttributes reAttr) {
		log.info("updateBoard >>> "+bvo.toString());
		int isOk = bsv.updateBoard(bvo);
		reAttr.addFlashAttribute("isOk", isOk>0?"1":"0");
		log.info(isOk>0?"수정성공":"수정실패");
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete")
	public String deleteBoardGet(@RequestParam("bno")int bno, RedirectAttributes reAttr) {
		int isOk = bsv.deleteBoard(bno);
		log.info("deleteBoard >>> "+(isOk>0?"삭제성공":"삭제실패"));
		return "redirect:/board/list";
	}
	
	@GetMapping("/introduce")
	   public String introduceGet() {
	      return "/board/introduce";
	   }
	   
	   @GetMapping("/data")
	   public String dataGet() {
	      return "/board/data";
	   }
	
}
