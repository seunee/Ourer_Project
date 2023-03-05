package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.JoinPersonDTO;
import com.ezen.finalpj.domain.JoinPersonVO;
import com.ezen.finalpj.domain.ScheduleVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.GroupService;
import com.ezen.finalpj.service.JoinPersonService;
import com.ezen.finalpj.service.ScheduleService;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/schedule/*")
@Controller
public class ScheduleController {
	@Inject
	private ScheduleService ssv;
	@Inject
	private JoinPersonService jsv;
	@Inject
	private UserService usv;
	@Inject
	private GroupService gsv;
	
	@GetMapping("/register")
	public String insertSchGet(@RequestParam("grno")int grno, Model model) {
		GroupVO gvo=gsv.selectGrp(grno);
		model.addAttribute("gvo", gvo);
		List<UserVO> uList=usv.selectMemListUser(grno);
		log.info("회원 리스트"+uList.toString());
		model.addAttribute("uList", uList);
		model.addAttribute("grno", grno);
		return "/schedule/register";
	}
	
	@PostMapping("/register")
	public String insertSchPost(ScheduleVO svo, RedirectAttributes reAttr, HttpServletRequest req) {
		log.info("스케줄:"+svo.toString());		
		 if(svo.getCost()==""||svo.getMax_member() < 1||svo.getMeetdate()==""||
		     svo.getSpot()==""||svo.getTitle()=="") {
			 reAttr.addFlashAttribute("schMsg", "0");
			 reAttr.addAttribute("grno", svo.getGrno());
			 return "redirect:/schedule/register";
		 }else {
			 int isOk=ssv.insertSch(svo);
			 int sno=ssv.selectMaxSnoSch();
			 JoinPersonVO jvo=new JoinPersonVO();
			 jvo.setSno(sno);
			 jvo.setGrno(svo.getGrno());
			 HttpSession ses=req.getSession();
			 UserVO uvo=(UserVO)ses.getAttribute("ses");
			 jvo.setEmail(uvo.getEmail());
			 isOk*=jsv.insertJpPost(jvo);
			 log.info("스케줄 등록"+(isOk>0?"성공":"실패"));
			 reAttr.addAttribute("grno", svo.getGrno());
			 return "redirect:/group/main";
			 
		 }
		 
	}
	
	@GetMapping("/delete")
	public String deleteSchGet(@RequestParam("sno")int sno, RedirectAttributes reAttr) {
		log.info(sno+"");
		int grno=ssv.selectGrnoSch(sno);
		log.info(grno+"");
		int isOk=ssv.deleteSch(sno);
		log.info("스케줄 삭제"+(isOk>0?"성공":"실패"));
		reAttr.addAttribute("grno", grno);
		return "redirect:/group/main";
	}
	
	@PostMapping(value = "/join", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertJpPost(@RequestBody JoinPersonVO jvo, HttpServletRequest req) {
		HttpSession ses=req.getSession();
		UserVO uvo=(UserVO)ses.getAttribute("ses");
		jvo.setEmail(uvo.getEmail());
		log.info("jvo"+jvo.toString());
		int isOk=jsv.insertJpPost(jvo);
		isOk*=ssv.updateJoinMemPost(jvo.getSno());
		if(isOk>0) {
			return new ResponseEntity<String>("1", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("2", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<JoinPersonDTO>> selectListJpGet(){
		List<JoinPersonDTO> jList=jsv.selectListJp();
		log.info("참가"+jList.toString());
		return new ResponseEntity<List<JoinPersonDTO>>(jList, HttpStatus.OK);
	}

	@DeleteMapping(value = "/cancel/{jno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteJpDelete(@PathVariable("jno")int jno){
		int sno=jsv.selectSnoJp(jno);
		int isOk=jsv.deleteJp(jno);
		isOk*=ssv.updateJoinMemDelete(sno);
		log.info(isOk>0?"스케줄 참가 취소 성공":"스케줄 참가취소 실패");
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/update/{sno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateSchePut(@PathVariable("sno")int sno){
		int isOk=ssv.updateIsDoneSche(sno);
		log.info(isOk>0?"isDone 성공":"isDone 실패");
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
}
