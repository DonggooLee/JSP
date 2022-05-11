package org.ddongq.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ddongq.dto.PersonVO;

public class PersonAction {
	public String process(HttpServletRequest request) {
		// insert.jsp -> controller -> 현재위치 (request 이용)
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String self = request.getParameter("self");
		
		// 1. request 이용
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("phone", phone);
		request.setAttribute("addr", addr);
		request.setAttribute("self", self);
		
		// 2. session 이용
		// session은 JSP의 내장 객체라서 곧바로 사용할 수 있었다.
		// java에서는 request를 통해서 session을 얻어낸다.(getSession()메소드 이용)
		HttpSession session = request.getSession();
		session.setAttribute("name", "session's : " + name);
		session.setAttribute("age", "session's : " + age);
		session.setAttribute("phone", "session's : " + phone);
		session.setAttribute("addr", "session's : " + addr);
		session.setAttribute("self", "session's : " + self);
		
		// 3. VO 이용
		PersonVO vo = new PersonVO();
		vo.setAddr(addr);
		vo.setAge(age);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setSelf(self);
		session.setAttribute("vo", vo);
		
		// 4. Map 이용 (참고용. 다양한 타입을 저장하기 힘듦)
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("age", age);
		map.put("phone", phone);
		map.put("addr", addr);
		map.put("self", self);
		session.setAttribute("map", map);
		
		return "view/output.jsp";
	}
}
