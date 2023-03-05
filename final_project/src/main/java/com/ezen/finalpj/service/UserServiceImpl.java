package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.ProfileVO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;
import com.ezen.finalpj.repository.ProfileDAO;
import com.ezen.finalpj.repository.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserDAO udao;
	@Inject
	private ProfileDAO pdao;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public int updateCapUser(ManagerDTO managerDTO) {
		log.info("방장 업데이트");
		return udao.updateCap(managerDTO);
	}


	@Override
	public UserVO selectCapGet(int grno) {
		log.info("방장 추출");
		return udao.selectCap(grno);
	}
	
	
	@Override
	public int register(UserDTO udto) {
		log.info("User register(udto) check2");
		String pw = udto.getUvo().getPw();
		log.info(">>>serviceImpl : "+pw);
		String encodepw = passwordEncoder.encode(pw);
		log.info(">>>serviceImpl : "+encodepw);
		udto.getUvo().setPw(encodepw);
//		udao.insertUser(udto.getUvo());
		int isOK = udao.insertUser(udto.getUvo());
		if(isOK > 0 && udto.getPList().size() > 0) {
			String email = udto.getUvo().getEmail();
			log.info(email);
			for(ProfileVO pvo : udto.getPList()) {
				pvo.setEmail(email);
				log.info(">>>file :"+ pvo.toString());
				isOK *= pdao.insertFile(pvo);
			}
		}
		return isOK;
	}

	@Override
	public UserVO isUser(String email, String pw) {
		UserVO uvo = udao.getUser(email);
		log.info(">>>ServiceImpl : "+uvo.toString());
		if(uvo == null) return null;
		
		if(passwordEncoder.matches(pw, uvo.getPw())) {
			return uvo;
		}else {
			return null;
		}
	}
	
	@Override
	public int register(UserVO uvo) {
		log.info(">>> User register check2");
		UserVO tmpUser = udao.getUser(uvo.getEmail());
		
		if(tmpUser != null) {
			return 0;
		}
		if(uvo.getEmail()==null || uvo.getEmail().length()==0) {
			return 0;
		}
		if(uvo.getPw()==null || uvo.getPw().length()==0) {
			return 0;
		}
		
		String pw = uvo.getPw();
		log.info(">>>serviceImpl : "+pw);
		String encodepw = passwordEncoder.encode(pw);
		log.info(">>>serviceImpl : "+encodepw);
		uvo.setPw(encodepw);
		udao.insertUser(uvo);
		
		return 1;
	}
	

	@Override
	public List<UserVO> getOnlyList1(UserVO user) {
		log.info("waiting1 list user check");
		return udao.selectOnlyUser(user);
	}


	@Override
	public UserVO getMyOnlyuser(HttpServletRequest req) {
		UserVO user=(UserVO)req.getSession().getAttribute("ses");
		log.info("ses : "+user.getEmail().toString());
		return user;
	}

	@Override
	public List<UserVO> getOnlyList2(UserVO user) {
		log.info("waiting2 list user check");
		return udao.selectSecoundUser(user);
	}
	
	@Override
	public int modifyMyinfo(UserVO uvo) {
		log.info("modify myinfo user check");
		return udao.updateMyinfo(uvo);
	}

	@Override
	public List<UserVO> selectMemListUser(int grno) {
		return udao.selectMemList(grno);
	}
	
	

	@Override
	public int emailCheck(String email) {
		int cnt = udao.emailCheck(email);
		log.info("email check");
		return cnt;
	}

	@Override
	public int nicknameCheck(String nickname) {
		int cnt = udao.nicknameCheck(nickname);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public List<UserVO> selectAllUser() {
		log.info("user all list check");
		return udao.selectAllList();
	}
	
	@Override
	public int deleteUser(String email) {
		log.info("delete user check");
		return udao.deleteUser(email);
	}

	@Override
	public List<FavoriteVO> selectFList(String email) {
		log.info("찜 목록 개수");
		return udao.selectFList(email);
	}

	@Override
	public List<FavoriteDTO> selectUList(String email) {
		log.info("내가 가입한 소모임들");
		return udao.selectUList(email);
	}

	@Override
	public String selectmyGname(String email) {
		log.info("내가 방장인 소모임 이름");
		return udao.selectmyGname(email);
	}
	
	
   @Override
   public List<WaitingVO> getWaitingList(UserVO user) {
      return udao.getWaitingList(user);
   }
   
   @Override
   public UserVO modifyCt(String email) {
      log.info("카테고리 수정값 가져오기");
      return udao.getUser(email);
   }

@Override
public int insertBlankProf(String email) {
	
	return udao.insertBlankProf(email);
}

@Override
public int userRemove(String email) {
   return udao.userRemove(email);
}
}
