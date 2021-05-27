package com.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	public static boolean deleteFile(String path) {
		boolean done = false;
		try {
			
			File file = new File(path);
			done = file.delete();
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return done;
	}
	public static boolean saveFile(InputStream is, String path) {
		boolean done = false;
		try {
			
			byte[] b = new byte[is.available()];
			is.read(b);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			done = true;
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return done;
	}
}
