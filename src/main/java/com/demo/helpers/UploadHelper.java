package com.demo.helpers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class UploadHelper {
	public static String Upload(ServletContext servletContext, MultipartFile file) {
		try {
			String fileName = generateFileName(file.getOriginalFilename());
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/assets/images/" + fileName));
			Files.write(path, bytes);
			return fileName;
 		} catch (Exception e) {
			return null;
		}
	}
	
	private static String generateFileName(String fileName) {
		String uuid = UUID.randomUUID().toString().replace("-","");
		int index = fileName.lastIndexOf(".");
		String ext = fileName.substring(index);
		return uuid + ext;
	}
}