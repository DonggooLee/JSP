package org.ddongq.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class Today {
	public String process(HttpServletRequest request) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get((Calendar.MONTH)+1);
		int day = cal.get(Calendar.DATE);
		
		String today = year + "년" + month + "월" + day + "일";
		// 현재 날짜 (요청에 대한 응답 정보)
		// request나 session에 속성정보를 저장한다.
		request.setAttribute("today", today);
		
		return "view/output.jsp";
	}
}
