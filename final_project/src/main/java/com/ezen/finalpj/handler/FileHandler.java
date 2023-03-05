package com.ezen.finalpj.handler;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.tika.Tika;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.finalpj.domain.FileVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@AllArgsConstructor
@Component
public class FileHandler {
	private final String UP_DIR="/ourer/tomcat/webapps/_finalweb/_profile/profileUpload";

	/*
	 * private final String UP_DIR="C:\\_finalweb\\_profile\\profileUpload";
	 */	
	public FileVO uploadGbrdFile(MultipartFile gbrdfile) {
		String dir="GbrdFileUpload";
		File subfolder=new File(UP_DIR, dir);
		subfolder.mkdirs();
		
		LocalDate date=LocalDate.now();
		String today=date.toString();
		today=today.replace("-", File.separator);
		
		File folders=new File(subfolder, today);
		if(!folders.exists()) {
			folders.mkdirs();
		}
		
		FileVO gfvo=new FileVO();
		gfvo.setDir(today);
		gfvo.setSize(gbrdfile.getSize());
		
		String originalFileName=gbrdfile.getOriginalFilename();
		
		String onlyFileName=originalFileName.substring(originalFileName.lastIndexOf("/")+1);
		gfvo.setName(onlyFileName);
		
		UUID uuid=UUID.randomUUID();
		gfvo.setUuid(uuid.toString());
		
		String fullFileName=uuid.toString()+"_"+onlyFileName;
		File storeFile=new File(folders, fullFileName);
		
		try {
			gbrdfile.transferTo(storeFile);
			if(isImageFile(storeFile)) {
				File thumbnail=new File(folders, uuid.toString()+"_th_"+onlyFileName);
				Thumbnails.of(storeFile).size(75, 75).toFile(thumbnail);
				log.info("썸네일 성공");
			}
		} catch (Exception e) {
			log.info("썸네일 실패");
			e.printStackTrace();
		}
		return gfvo;
	}
	
	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType=new Tika().detect(storeFile);
		return mimeType.startsWith("image")? true:false;
	}
}
