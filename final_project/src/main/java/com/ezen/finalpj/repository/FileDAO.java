package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.FileVO;

public interface FileDAO {

	int insertFile(FileVO gfvo);

	FileVO selectFile(int gbno);

	int deleteFile(String uuid);

	int updateFile(FileVO gfvo);
	

}
