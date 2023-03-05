package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.GroupVO;

public interface FavoriteService {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

	List<FavoriteVO> selectListFavorite(int grno);
	
	List<GroupVO> groupList(String email);

	List<FavoriteDTO> favoriteList(String email);

	List<FavoriteVO> selectFList(String email);

	String selectmyGname(String email);

}
