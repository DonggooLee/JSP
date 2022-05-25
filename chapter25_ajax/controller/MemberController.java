package org.ddongq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ddongq.service.MemberService;
import org.ddongq.service.MemberServiceImpl;
import org.ddongq.vo.MemberVO;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 요청 확인
    	String requstURI = request.getRequestURI();				// 전체경로 : /chapter25_ajax/xxxx.do
    	String contextPath = request.getContextPath();			// 컨텍스트 : /chapter25_ajax
    	String cmd = requstURI.substring(contextPath.length()); // 요청확인 : /xxxx.do
		
    	// 추가 부분 (response가 다시 index.jsp 돌아가기 때문에)
    	PrintWriter out = response.getWriter();
    	String result = null;
    	
    	MemberService service = new MemberServiceImpl();
    	List<MemberVO> list = null;
    	StringBuffer sb = new StringBuffer();
    	
    	// cmd 에 따른 구분
    	switch (cmd) {
			case "/csv.do":
				list = service.getMember();
				if(list != null) {
					for(MemberVO vo : list) {
						sb.append(vo.getMidx() + ",");
						sb.append(vo.getMid() + ",");
						sb.append(vo.getMname() + ",");
						sb.append(vo.getMemail() + ",");
						sb.append(vo.getMphone() + ",");
						sb.append(vo.getMaddr() + "/");
					}
				}
				// toString() => String 타입으로 형변환, substring을 통해 마지막 "/"를 제거해준다
				result = sb.toString().substring(0, sb.toString().length()-1);
				break;
			case "/xmlTag.do":
				list = service.getMember();
				sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				sb.append("<members>");
				for(MemberVO vo : list) {
					sb.append("<member>");
					sb.append("<idx>"+vo.getMidx()+"</idx>");
					sb.append("<id>"+vo.getMid()+"</id>");
					sb.append("<name>"+vo.getMname()+"</name>");
					sb.append("<email>"+vo.getMemail()+"</email>");
					sb.append("<phone>"+vo.getMphone()+"</phone>");
					sb.append("<addr>"+vo.getMaddr()+"</addr>");
					sb.append("</member>");
				}
				sb.append("</members>");
				// sb의 데이터 타입 : StringBuffer
				System.out.println(sb.getClass().getName());
				result = sb.toString();
				// result의 데이터 타입 : String
				System.out.println(result.getClass().getName());
				break;
			case "/xmlProp.do":
				list = service.getMember();
				sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				sb.append("<members>");
				// <member idx = "" id="" pw="" ... />
				for(MemberVO vo : list) {
					sb.append("<member ");
					sb.append(" idx='" + vo.getMidx() + "'");
					sb.append(" id='" + vo.getMid() + "'");
					sb.append(" pw='" + vo.getMpw() + "'");
					sb.append(" name='" + vo.getMname() + "'");
					sb.append(" email='" + vo.getMemail() + "'");
					sb.append(" phone='" + vo.getMphone() + "'");
					sb.append(" addr='" + vo.getMaddr() + "'");
					sb.append(" />");	
				}
				sb.append("</members>");
				result = sb.toString();
				break;
			case "/json.do" :
				list = service.getMember();
				sb.append("[");
				for( MemberVO vo : list ) {
					sb.append("{");
					sb.append("\"idx\":" + vo.getMidx() + ",");
					sb.append("\"id\":\"" + vo.getMid() + "\",");
					sb.append("\"pw\":\"" + vo.getMpw() + "\",");
					sb.append("\"name\":\"" + vo.getMname() + "\",");
					sb.append("\"email\":\"" + vo.getMemail() + "\",");
					sb.append("\"phone\":\"" + vo.getMphone() + "\",");
					sb.append("\"addr\":\"" + vo.getMaddr() + "\"");
					sb.append("},");
				}	
				// 마지막에 포함된 쉼표 제거 : substring(0, sb.toString().length() - 1)
				result = sb.toString().substring(0, sb.toString().length() - 1) + "]";
				System.out.println(result);
				break;
		}
    	
    	out.print(result);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
