package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.FileVO;
import com.ezen.finalpj.domain.GPagingVO;
import com.ezen.finalpj.domain.GboardDTO;
import com.ezen.finalpj.domain.GboardVO;
import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.handler.FileHandler;
import com.ezen.finalpj.handler.GPagingHandler;
import com.ezen.finalpj.service.GboardService;
import com.ezen.finalpj.service.GroupService;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/gboard/*")
@Controller
public class GboardController {
	@Inject
	private GboardService gbsv;
	@Inject
	private FileHandler fh;
	@Inject
	private GroupService gsv;
	@Inject
	private UserService usv;
	
	@GetMapping("/register")
	public String insertGbrdGet(@RequestParam("grno")int grno, Model model, HttpServletRequest req) {
		List<UserVO> uList=usv.selectMemListUser(grno);
		GroupVO gvo=gsv.selectGrp(grno);
		model.addAttribute("gvo", gvo);
		model.addAttribute("uList", uList);
		model.addAttribute("grno", grno);
		return "/gboard/register";
	}
	
	@PostMapping("/register")
	public String insertGbrdPost(GboardVO gbvo, RedirectAttributes reAttr, @RequestParam(name="files", required=false)MultipartFile file) {
		int gBrdMsg=0;
		if(gbvo.getTitle().equals("")||gbvo.getWriter().equals("")||gbvo.getContent().equals("")) gBrdMsg=1;
		reAttr.addFlashAttribute("gBrdMsg", gBrdMsg);
		
		FileVO gfvo=null;
		
		if(gBrdMsg==0) {
			if(file.getSize()>0) {
				gfvo=fh.uploadGbrdFile(file);
				GboardDTO gbdto=new GboardDTO(gbvo, gfvo);
				int isOk=gbsv.insertGbrd(gbdto);
				log.info("그룹 게시글 등록 성공"+(isOk>0?"성공":"실패"));
			}else {
				int isOk=gbsv.insertGbrd(gbvo);
				log.info("그룹 게시글 등록 성공"+(isOk>0?"성공":"실패"));
			}
		}
		int grno=gbvo.getGrno();
		reAttr.addAttribute("grno", grno);
		return "redirect:/gboard/list";
	}
	
	@GetMapping("/list")
	public String selectListGbrdGet(@RequestParam("grno")int grno, Model model, GPagingVO gpvo) {
		gpvo.setGrno(grno);
		List<GboardVO> gbList=gbsv.selectListGbrd(gpvo);
		log.info(gbList.toString());
		int totalPage=gbsv.getTotalPage(grno);
		GPagingHandler gph=new GPagingHandler(gpvo, totalPage);
		List<UserVO> uList=usv.selectMemListUser(grno);
		GroupVO gvo=gsv.selectGrp(grno);
		model.addAttribute("gvo", gvo);
		model.addAttribute("uList", uList);
		model.addAttribute("gbList", gbList);
		model.addAttribute("grno", grno);
		model.addAttribute("gph", gph);
		return "/gboard/list";
	}
	
	@GetMapping("/detail")
	public String selectDetailGbrdGet(@RequestParam("gbno")int gbno, Model model) {
		int isOk=gbsv.updateViewGbrd(gbno);
		log.info("조회수"+(isOk>0?"성공":"실패"));
		GboardDTO gbdto=gbsv.selectDetailFileGbrd(gbno);
		int grno=gbdto.getGbvo().getGrno();
		GroupVO gvo=gsv.selectGrp(grno);
		List<UserVO> uList=usv.selectMemListUser(grno);
		log.info("회원 리스트"+uList.toString());
		model.addAttribute("uList", uList);
		model.addAttribute("gvo", gvo);
		//GboardVO gbvo=gbsv.selectDetailGbrd(gbno);
		model.addAttribute("gbvo", gbdto.getGbvo());
		model.addAttribute("gfvo", gbdto.getGfvo());
		System.out.println(gbdto.getGfvo());
		return "/gboard/detail";
	}
	
	@GetMapping("/modify")
	public String updateGbrdGet(@RequestParam("gbno")int gbno, Model model) {
		GboardDTO gbdto=gbsv.selectDetailFileGbrd(gbno);
		int grno=gbdto.getGbvo().getGrno();
		GroupVO gvo=gsv.selectGrp(grno);
		model.addAttribute("gvo", gvo);
		List<UserVO> uList=usv.selectMemListUser(grno);
		model.addAttribute("uList", uList);
		//GboardVO gbvo=gbsv.selectDetailGbrd(gbno);
		model.addAttribute("gbvo", gbdto.getGbvo());
		model.addAttribute("gfvo", gbdto.getGfvo());
		return "/gboard/modify";
	}
	
	@PostMapping("/modify")
	public String updateGbrdPost(GboardVO gbvo, RedirectAttributes reAttr, @RequestParam(name="files", required=false)MultipartFile file) {
		FileVO gfvo=null;
		log.info(file.toString());
		if(file.getSize()>0) {
			gfvo=fh.uploadGbrdFile(file);
			GboardDTO gbdto=new GboardDTO(gbvo, gfvo);
			int isOk=gbsv.updateGbrd(gbdto);
			log.info("그룹 게시글 수정 성공"+(isOk>0?"성공":"실패"));
		}else{
			int isOk=gbsv.updateGbrd(gbvo);
			log.info("게시글 수정"+(isOk>0?"성공":"실패"));		
		}
		reAttr.addAttribute("gbno", gbvo.getGbno());		
		return "redirect:/gboard/detail";
	}
	
	@GetMapping("/delete")
	public String deleteGbrdGet(@RequestParam("gbno")int gbno, RedirectAttributes reAttr) {
		GboardVO gbvo=gbsv.selectDetailGbrd(gbno);
		int isOk=gbsv.deleteGbrd(gbno);
		reAttr.addAttribute("grno", gbvo.getGrno());
		return "redirect:/gboard/list";
	}
	
	@DeleteMapping(value = "/file/{uuid}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteFileDelete(@PathVariable("uuid")String uuid){
		int isOk=gbsv.deleteFile(uuid);
		return isOk>0?new ResponseEntity<String>("1", HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
