package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.GroupVO;

public interface FavoriteDAO {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

	List<FavoriteVO> selectListFavorite(int grno);
	
	List<GroupVO> selectGroupList(String email);

	List<FavoriteDTO> selectFavoriteList(String email);

	List<FavoriteVO> selectFList(String email);

	String selectmyGname(String email);

}
