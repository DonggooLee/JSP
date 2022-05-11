package org.ddongq.model;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class Now {
	public String process(HttpServletRequest request) {
		Date date = new Date();
		int h = date.getHours();
		int m = date.getMinutes();
		int s = date.getSeconds();
		
		String now = h+"시"+m+"분"+s+"초";
		request.setAttribute("now", now);
		
		return "view/output.jsp";
	}
}
