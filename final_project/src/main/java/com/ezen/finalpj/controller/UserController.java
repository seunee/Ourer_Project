package com.ezen.finalpj.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.ProfileVO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;
import com.ezen.finalpj.handler.ProfileHandler;
import com.ezen.finalpj.service.ProfileService;
import com.ezen.finalpj.service.UserService;
import com.ezen.finalpj.service.WaitingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Inject
	private UserService usv;
	
	@Inject
	private ProfileHandler ph;
	
	@Inject
	private ProfileService psv;
	
	@Inject
	private WaitingService wsv;
	
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/home");
		return mv;
	}
	
	@GetMapping("/register")
		public String register(){
		return "/user/register";
	}
	
//	@PostMapping("/register")
//		public ModelAndView register(UserVO uvo, ModelAndView mv){
//		log.info(">>> User Register check 1");
//		boolean isUP = usv.register(uvo);
//		if(isUP) {
//			mv.addObject("msg", "1");
//			mv.setViewName("/");
//		}else {
//			mv.addObject("msg", "0");
//			mv.setViewName("/user/register");
//		}
//		return mv;
//	}
	
	 @PostMapping("/register") 
	 	public String register(UserVO uvo, RedirectAttributes reAttr, @RequestParam(name="files", required =false)MultipartFile[] files){
		 
		 log.info(">>> User Register check 1");
		 log.info(">>>User : "+uvo.toString());
		 log.info(">>>files: "+files.toString()); 
		 List<ProfileVO> pList = null;
//		 int isOK = usv.register(uvo);
		 int isOK = 0;
		 if(files[0].getSize() > 0) { 
		 pList = ph.uploadFiles(files);
		 for(ProfileVO pvo : pList) {
			 pvo.setEmail(uvo.getEmail());
		 }
		 log.info(pList.toString());
		 UserDTO udto = new UserDTO(uvo, pList);
		 isOK = usv.register(udto); 
		 }else {
		 log.info("file null"); 
		 isOK = usv.register(uvo);
		 isOK*=usv.insertBlankProf(uvo.getEmail());
		 
		 }
			 
		 reAttr.addFlashAttribute("msg", isOK > 0 ? "0" : "1");
		 log.info("User Register : "+ (isOK > 0?"OK":"FAIL"));
		 return "redirect:/";
	  }
	 
	 @GetMapping("/login")
	 public ModelAndView loginGet(ModelAndView mv) {
		 mv.setViewName("/user/login");
		 return mv;
	 }
	 
	    @PostMapping("/login")
	    public ModelAndView loginPost(ModelAndView mv, String email, String pw, HttpServletRequest req) {
	       log.info(">>>email : "+email+" pw : "+ pw);
	       UserVO isUser = usv.isUser(email, pw);
	       
	       if(isUser != null) {
	          HttpSession ses = req.getSession();
	          ses.setAttribute("ses", isUser);
	          
	          //model로 넘겨주게 되면 해당 페이지에서만 프로필이 드러나게 된다
	          //그러므로 model에 넘겨주지 말고 ses로 넘겨줘서 해당 이메일에 따라 그 프로필을 볼 수 있게 하자!
	          ProfileVO pvo=psv.selectPersonalProfile(email);
	          ses.setAttribute("sespvo", pvo);
	         //waiting 정보 가져오기
	          WaitingVO wvo=wsv.selectUserGrp(email);
	          ses.setAttribute("wvo", wvo);
	          
	          mv.setViewName("redirect:/");
	          mv.addObject("msglogin", "1");
	       }else {
	          mv.setViewName("user/login");
	          mv.addObject("msglogin","0");
	       }
	       
	       return mv;
	    }
	 
	 @GetMapping("/logout")
	 public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest req) {
		 req.getSession().removeAttribute("ses");
		 req.getSession().invalidate();
		 mv.addObject("msg", "0");
		 mv.setViewName("redirect:/");
		 return mv;
	 }
	 
	 @GetMapping("/mypage/{email}")
		public String userMypageGet(@PathVariable("email")String email, Model model) {
		 List<FavoriteVO> fList=usv.selectFList(email);
		 model.addAttribute("fList", fList);
		 List<FavoriteDTO> fDtoList = usv.selectUList(email);
		 model.addAttribute("fDtoList", fDtoList);
		 String name = usv.selectmyGname(email);
		 log.info("소모임 명 >>> "+name);
		 model.addAttribute("name", name);
		 
			return "/user/mypage";
		}
		
	@GetMapping("/myinfo")
	public String userMyinfoGet() {
		return "/user/myinfo";
	}
		
	 
	 @GetMapping(value="/management/{email}")
     public String getUserList(Model model,HttpServletRequest req,@PathVariable("email")String email) {
        HttpSession ses=req.getSession();
        ses.setAttribute("email", email);
        
        UserVO user=usv.getMyOnlyuser(req);
        log.info("uvo test : "+user.getEmail());
        
        int grno=user.getIsCap();
        log.info("어..이건 "+grno);
        model.addAttribute("grno", grno);
        
        List<UserVO> list1=usv.getOnlyList1(user);
        System.out.println(list1);
        List<UserVO> list2=usv.getOnlyList2(user);
        List<WaitingVO> wList=usv.getWaitingList(user);
        model.addAttribute("wList", wList);
        log.info("실험체체체 "+ wList.toString());
        log.info("only user");
        
        //profileVO list 초기화
        ArrayList<ProfileVO> profileList1=new ArrayList<ProfileVO>();
        ArrayList<ProfileVO> profileList2=new ArrayList<ProfileVO>();
        
        for(UserVO uvo: list1) {
           ProfileVO pvo = psv.selectProfile(uvo.getEmail());
           profileList1.add(pvo);
        }
        log.info("프로필1 리스트 : "+profileList1.toString());
        
        for(UserVO uvo: list2) {
           ProfileVO pvo = psv.selectProfile(uvo.getEmail());
           profileList2.add(pvo);
        }
        log.info("프로필2 리스트 : "+profileList2.toString());
        model.addAttribute("profileList1",profileList1);
        model.addAttribute("profileList2",profileList2);
        
        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);
        
        List<FavoriteVO> fList=usv.selectFList(email);
		 model.addAttribute("fList", fList);
		 String name = usv.selectmyGname(email);
		 model.addAttribute("name", name);
        return "/user/management";
     }
	 
	  @DeleteMapping(value = "/remove/{email}", produces = {MediaType.TEXT_PLAIN_VALUE})
      public ResponseEntity<String> removeUser(@PathVariable("email")String email) {
         log.info("my user remove email : "+email);
         int isOk=usv.userRemove(email);
         return isOk>0? new ResponseEntity<String>("1",HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
	 
	 @GetMapping("/modify")
		public String userModifyMyinfoGet() {
			return "/user/modify";
		}
		
	 @PostMapping("/modify")
	   public String modifyMyinfoPost(UserVO uvo, RedirectAttributes reAttr, HttpServletRequest req) {
	      log.info(uvo.toString());
	      int isOk = usv.modifyMyinfo(uvo);
	      reAttr.addFlashAttribute("msg", isOk>0?"1":"0");
	      log.info("개인정보수정 >>> "+(isOk>0?"수정성공":"수정실패"));
	      if(isOk>0) {
	         UserVO modifyUvo = usv.modifyCt(uvo.getEmail());
	         log.info("수정후값?? >>> "+modifyUvo.toString());
	         req.getSession().setAttribute("ses", modifyUvo);
	      }
	      return "redirect:/user/mypage/"+uvo.getEmail();
	   }
	
	//아이디 중복확인
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		int cnt = usv.emailCheck(email);
		System.out.println(cnt);
		return cnt;
	}
	
	//닉네임 중복확인
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int idCheck(@RequestParam("nickname") String nickname) {		
		int cnt = usv.nicknameCheck(nickname);
		return cnt;

	}
	
	@GetMapping("/userlist")
	public String userAllGet(Model model) {
		log.info("모든 유저 뽑아내기");
		
		List<UserVO> uList=usv.selectAllUser();
		List<WaitingVO> wList=new ArrayList<WaitingVO>();
		
		for(UserVO uvo:uList) {
			WaitingVO wvo=wsv.selectUserGrp(uvo.getEmail());
			wList.add(wvo);
		}
		
		model.addAttribute("wList", wList);
		model.addAttribute("uList", uList);
		return "/supervisor/userlist";
	}
	
	 @GetMapping("/delete")
	 public String deleteUserGet(RedirectAttributes reAttr, HttpServletRequest req, @RequestParam("email")String email) {
		 int isOk = usv.deleteUser(email);
		 reAttr.addFlashAttribute("msg", isOk>0?"1":"0");
		 log.info("계정삭제 >>> "+(isOk>0?"성공":"실패"));
		 req.getSession().removeAttribute("ses");
		 req.getSession().invalidate();
		 return "redirect:/";
	 }
	
}