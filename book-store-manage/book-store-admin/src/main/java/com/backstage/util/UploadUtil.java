package com.backstage.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bs.constants.Constants;
import com.bs.utils.time.DateFormatUtil;
import org.springframework.web.multipart.MultipartFile;



public class UploadUtil {
	public static Map<String, Object> uploadPicture(MultipartFile multipartFile) {
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			// 生成一个新的文件夹
			// 获取原始文件
			String oldName = multipartFile.getOriginalFilename();
			// 生成文件名称
			String newName = DateFormatUtil.formatDate("yyyyMMddHHmmssSSS", new Date());
			// 图片名称
			String imageName = newName + oldName.substring(oldName.lastIndexOf("."));
			// 日期格式目录
			String datePath = DateFormatUtil.formatDate("yyyyMMdd", new Date());
			// 本地图片目录
			String path = "D:" + File.separator + "upload" + File.separator + datePath;
			File file = new File(path, imageName);
			// 判断文件是否存在,若不存在则创建
			if (!file.exists()) {
				file.mkdirs();
			}
			multipartFile.transferTo(file);
			
			resultMap.put("error", 0);
			resultMap.put("message", "文件上传成功");
			resultMap.put("url", Constants.SERVER_PATH + datePath + "/" + imageName);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("error", 1);
			resultMap.put("message", "文件上传发生异常");
		}
		return resultMap;
	}

}
