package com.ezen.finalpj.handler;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.tika.Tika;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.finalpj.domain.SgMainVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@AllArgsConstructor
@Component
public class SgMainHandler {
	private final String UP_DIR = "/ourer/tomcat/webapps/_finalweb/_profile/profileUpload";
	//private final String UP_DIR = "C:\\_finalweb\\_profile\\profileUpload";
	
	
	public SgMainVO uploadMainFile(MultipartFile mainfile) {
		String dir="sgMainUpload";
		File subfolder=new File(UP_DIR, dir);
		subfolder.mkdirs();
		
		LocalDate date=LocalDate.now();
		String today=date.toString();
		today=today.replace("-", File.separator);
		
		File folders=new File(subfolder, today);
		if(!folders.exists()) {
			folders.mkdirs();
		}
		
		SgMainVO smvo=new SgMainVO();
		smvo.setDir(today);
		smvo.setSize(mainfile.getSize());
		
		String originalFileName=mainfile.getOriginalFilename();
		
		String onlyFileName=originalFileName.substring(originalFileName.lastIndexOf("/")+1);
		smvo.setName(onlyFileName);
		
		UUID uuid=UUID.randomUUID();
		smvo.setUuid(uuid.toString());
		
		String fullFileName=uuid.toString()+"_"+onlyFileName;
		File storeFile=new File(folders, fullFileName);
		try {
			mainfile.transferTo(storeFile);
			if(isImageFile(storeFile)) {
				File thumbnail=new File(folders, uuid.toString()+"_th_"+onlyFileName);
				Thumbnails.of(storeFile).size(75, 75).toFile(thumbnail);
				log.info("썸네일 생성 성공");
			}
		} catch (Exception e) {
			log.info("이미지파일 생성 오류");
			e.printStackTrace();
		}
		return smvo;
	}
	
	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType=new Tika().detect(storeFile);
		return mimeType.startsWith("image")? true:false;
	}
}
