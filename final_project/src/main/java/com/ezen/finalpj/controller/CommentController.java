package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.finalpj.domain.CommentVO;
import com.ezen.finalpj.service.CommentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/comment")
@Controller
public class CommentController {
	@Inject
	private CommentService csv;
	
	@PostMapping(value = "/post", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertCmtPost(@RequestBody CommentVO cvo){
		log.info(cvo.toString());
		int isOk=csv.insertCmt(cvo);
		log.info("댓글 등록"+(isOk>0?"성공":"실패"));
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{gbno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CommentVO>> selectListCmtGet(@PathVariable("gbno")int gbno){
		List<CommentVO> cList=csv.selectListCmt(gbno);
		return new ResponseEntity<List<CommentVO>>(cList, HttpStatus.OK);
	}
	
	@PutMapping(value = "/{cno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateCmtPut(@PathVariable("cno")int cno, @RequestBody CommentVO cvo){
		log.info(cvo.toString());
		int isOk=csv.updateCmt(cvo);
		log.info("댓글 수정"+(isOk>0?"성공":"실패"));
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/{cno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteCmtDelete(@PathVariable("cno")int cno){
		int isOk=csv.deleteCmt(cno);
		log.info("댓글 삭제"+(isOk>0?"성공":"실패"));
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
