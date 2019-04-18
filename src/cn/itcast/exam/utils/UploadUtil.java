package cn.itcast.exam.utils;

import java.util.UUID;

import org.apache.logging.log4j.core.util.UuidUtil;

public class UploadUtil {
	public static String getUuid(String uploadFileName){
		//String name = uploadFileName.substring(uploadFileName.lastIndexOf("."));
		//保留原始的上传文件的名称
		uploadFileName = UUID.randomUUID().toString().replace("-", "")+"_"+uploadFileName;
		/*
		 * 方法二 不保留上传文件的原始名称
		 * String name = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			uploadFileName = UUID.randomUUID().toString().replace("-", "")+"_"+uploadFileName;
		 */
		
		return uploadFileName;
		
	}
	public static String getPath(String uuidFileName){
		int code1 = uuidFileName.hashCode();
		int d1 = code1&0xf; //作为一级目录
		int code2 = code1 >>> 4;
		int d2 = code2 & 0xf;
		return "/"+d1+"/"+d2;
	}
	public static void main(String[] args) {
		System.out.println(getUuid("a.txt"));
		System.out.println(getPath("a.txt"));
	}
}
