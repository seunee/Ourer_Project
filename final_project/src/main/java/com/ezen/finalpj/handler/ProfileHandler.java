package com.ezen.finalpj.handler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.finalpj.domain.ProfileVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@AllArgsConstructor
@Component
public class ProfileHandler {
	private final String UP_DIR = "/ourer/tomcat/webapps/_finalweb/_profile/profileUpload";
	//private final String UP_DIR = "C:\\_finalweb\\_profile\\profileUpload";

	public List<ProfileVO> uploadFiles(MultipartFile[] files){
		// 파일경로 설정
		LocalDate date = LocalDate.now();
		log.info(">>>date : " +date);
		String today = date.toString();
		today = today.replace("-", File.separator);

		
		File folders = new File(UP_DIR, today);

		
		if(!folders.exists()) {
			folders.mkdirs();
		}
		
		List<ProfileVO> pList = new ArrayList<ProfileVO>();
		for(MultipartFile file : files) {
			ProfileVO pvo = new ProfileVO();
			pvo.setDir(today);
			pvo.setSize(file.getSize());
			
			String originalFileName = file.getOriginalFilename();
			log.info("originalFileName : " + originalFileName);
			
			String onlyFilName = originalFileName.substring(originalFileName.lastIndexOf("/")+1);
			log.info("onlyFileName : "+onlyFilName);
			pvo.setName(onlyFilName);
			
			UUID uuid = UUID.randomUUID();
			pvo.setUuid(uuid.toString());
			
			String fullFileName = uuid.toString()+"_"+onlyFilName;
			File storeFile = new File(folders, fullFileName);
			try {
				file.transferTo(storeFile);
				if(isImageFile(storeFile)) {
					File thumbnail = new File(folders, uuid.toString()+"_th_"+onlyFilName);
					Thumbnails.of(storeFile).size(75, 75).toFile(thumbnail);
				}
			} catch (Exception e) {
				log.info(">>> Profile 생성 오류");
				e.printStackTrace();
			}
			pList.add(pvo);
		}
		return pList;
	}
	//이미지 파일인지 아닌지 체크하는 메서드
	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType=new Tika().detect(storeFile);	// image/png, image/jpg
		return mimeType.startsWith("image")? true:false;

	}
}