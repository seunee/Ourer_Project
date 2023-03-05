package com.ezen.finalpj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface UserService {

	int updateCapUser(ManagerDTO managerDTO);

	//List<UserVO> selectMemListUserGet(int grno);

	UserVO selectCapGet(int grno);

	int register(UserDTO udto);

	UserVO isUser(String email, String pw);
	
	int register(UserVO uvo);
	
	List<UserVO> getOnlyList1(UserVO user);
	
	List<UserVO> getOnlyList2(UserVO user);
	
	UserVO getMyOnlyuser(HttpServletRequest req);
	
	int modifyMyinfo(UserVO uvo);

	List<UserVO> selectMemListUser(int grno);

	//CapUserDTO selectCapGet(int grno);
	
	int emailCheck(String email);

	int nicknameCheck(String nickname);
	
	List<UserVO> selectAllUser();
	
	int deleteUser(String email);

	List<FavoriteVO> selectFList(String email);

	List<FavoriteDTO> selectUList(String email);

	String selectmyGname(String email);
	
	   List<WaitingVO> getWaitingList(UserVO user);

	   UserVO modifyCt(String email);

	int insertBlankProf(String email);
	
	int userRemove(String email);

}
