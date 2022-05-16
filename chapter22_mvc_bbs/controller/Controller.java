package org.ddongq.controller;

import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ddongq.dto.BDto;
import org.ddongq.dto.CDto;
import org.ddongq.model.Paging;
import org.ddongq.service.bbsService;
import org.ddongq.service.bbsServiceImpl;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String paramCmd = request.getParameter("cmd");
		String cmd = "allList";
		if( paramCmd != null && !paramCmd.isEmpty() ) {
			cmd = paramCmd;
		}
		
		// session 객체 생성 (JSP 내장객체라서 request를 통해 값을 가져와야 한다) => 조회수 올릴때 사용
		HttpSession session = request.getSession();
		// service 객체 생성
		bbsService service = new bbsServiceImpl();
		// 데이터를 담을 객체(?)를 미리 초기화
		List<BDto> list1 = null;
		List<CDto> list2 = null;
		BDto bdto = null;
		int b_idx, c_idx, result = 0;
		MultipartRequest mr = null;
		String realPath = null;
		String path = null;
		String open = "";
		
		switch (cmd) {
			case "allList" :
				// 1. Paging 객체 생성
				Paging pvo = new Paging();
				// 2. 전체 게시글의 개수 구하기
				pvo.setTotalRecord(service.total_record_());
				// 3. 전체 페이지 개수 구하기
				pvo.setTotalPage();
				// 4. 현재 페이지 번호 구하기
				String currentPage = request.getParameter("currentPage");
				if(currentPage!=null && !currentPage.isEmpty()){
					pvo.setNowPage(Integer.parseInt(currentPage));
				}
				// 5. 현재 페이지 번호에 따른 begin, end 구하기
				pvo.setBegin((pvo.getNowPage()-1) * pvo.getRecordPerPage()+1);
				pvo.setEnd(pvo.getBegin() + pvo.getRecordPerPage()-1);
				/**** begin, end 사이의 게시글을 DB에서 가져오기 ****/
				// 1. begin, end 변수 저장
				int begin = pvo.getBegin();
				int end = pvo.getEnd();
				// 2. begin, end 를 저장하는 Map 생성 
				Map<String,Integer> map = new HashMap<String,Integer>();
				// Map에 데이터를 집어 넣기
				map.put("begin", begin);
				map.put("end", end);
				// 전체 게시글 조회
				list1 = service.getList(map);
				request.setAttribute("list", list1);
				/**** 페이징 처리를 위한 block 계산 ****/
				// 1. beginBlock, endBlock 계산
				pvo.setBeginBlock( ((pvo.getNowPage() - 1) / pvo.getPagePerBlock()) * pvo.getPagePerBlock() + 1 );
				pvo.setEndBlock( pvo.getBeginBlock() + pvo.getPagePerBlock() - 1 );
				// 2. endBlock 조정하기
				if(pvo.getEndBlock() > pvo.getTotalPage()){
					pvo.setEndBlock(pvo.getTotalPage());
				}
				request.setAttribute("pvo", pvo);
				open = (String)session.getAttribute("open");
				if(open!=null){
					session.removeAttribute("open");
				}
				path = "index.jsp";
				break;
				
			case "view":
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				bdto = new BDto();
				// 해당 인덱스 번호에 해당하는 게시글 데이터를 bdto 객체에 저장
				bdto = service.getView(b_idx);
				// 해당 인덱스 번호에 해당하는 댓글 데이터를 list 객체에 저장
				list2 = service.getAllComment(b_idx);
				// 해당 페이지로 왔을 때 세션에 open 이라는 속성명을 저장
				open = (String)session.getAttribute("open");
				if(open==null){
					// open이 null이면 해당 게시물을 처음 열었다는 의미
					session.setAttribute("open", "YES"); 	// value값은 아무거나 상관없음!
					// 표시할 게시글의 기존 hit 수 + 1 처리를 한다.
					int hit = bdto.getHit() + 1;
					bdto.setHit(hit);						// hit가 증가된 bdto를 생성
					service.getUpdateByHit_(bdto);
				}
				request.setAttribute("bdto", bdto);
				request.setAttribute("list", list2);
				path = "view.jsp";
				break;
				
			case "insert_page":
				path = "insert_page.jsp";
				break;
				
			case "insert":
				realPath = request.getServletContext().getRealPath("/upload");
				mr = new MultipartRequest(
						request,											// 원래 받아야되는 request
						realPath, 											// 업로드 파일이 저장될 경로 
						1024*1024*10,										// 업로드 가능한 파일 사이즈
						"UTF-8",											// 인코딩
						new DefaultFileRenamePolicy()						// 동일한 이름의 파일 저장시 처리방법	
						);
				bdto = new BDto();
				bdto.setWriter(mr.getParameter("writer"));
				bdto.setTitle(mr.getParameter("title"));
				bdto.setContent(mr.getParameter("content"));
				bdto.setPw(mr.getParameter("pw"));
				bdto.setIp(Inet4Address.getLocalHost().getHostAddress());	// IPv4
				if (mr.getFile("filename") != null) {						// 먼저 저장된 파일 유무를 확인하고
					bdto.setFilename(mr.getFilesystemName("filename"));		// 파일의 원본 이름으로 확인
				} else {
					bdto.setFilename("");
				}
				result = service.getInsert(bdto);
				request.setAttribute("result", result);
				path = "insert.jsp";
				break;
				
			case "update_page":
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				bdto = new BDto();
				// 해당 인덱스 번호에 해당하는 데이터를 가져오기
				bdto = service.getView(b_idx);
				request.setAttribute("bdto", bdto);
				path = "update_page.jsp";
				break;
			
			case "update":
				realPath = request.getServletContext().getRealPath("/upload");
				mr = new MultipartRequest(
						request,
						realPath,
						1024 * 1024 * 10,
						"UTF-8",
						new DefaultFileRenamePolicy()
						);	
				bdto = new BDto();
				bdto.setB_idx( Integer.parseInt(mr.getParameter("b_idx")));
				bdto.setWriter( mr.getParameter("writer") );
				bdto.setTitle( mr.getParameter("title") );
				bdto.setPw( mr.getParameter("pw") );
				bdto.setContent( mr.getParameter("content") );
				bdto.setIp( request.getRemoteAddr() );				// ip 확인은 mr이 아닌 request!!
			 	/*
			 		첨부 파일 수정
			 		1. 기존 첨부가 있는 경우
			 			1) 새 첨부가 없으면 기존 첨부 그대로 사용
			 	 		2) 새 첨부가 있으면 기존 첨부 삭제 후 새 첨부 사용
			 		2. 기존 첨부가 없는 경우
			 			새 첨부 사용
			 	*/
			 	File newfile = mr.getFile("filename");				// 새 첨부 파일 (newfile)
			 	String oldfile = mr.getParameter("oldfile");		// 기존 첨부 파일(oldfile)
				if(newfile != null ){ 								// 새 첨부 파일 O
					if( oldfile != null){							// 기존 첨부 파일 O
						File removefile = new File(realPath + "/" + oldfile);
						if ( removefile.exists() ){					// 기존 첨부 파일 유무 확인
							removefile.delete();					// 기존 첨부 파일 삭제
						}			
					}
					bdto.setFilename( newfile.getName() );			// 새 첨부 파일의 이름 가져오기
				} else {											// 새 첨부 파일 X
					if( oldfile != null){							// 기존 첨부 파일 O
						bdto.setFilename(oldfile);					// 기존 첨부 파일 이름 그대로 쓰기
					} else {
						bdto.setFilename("");						// 새 첨부 파일 X, 기존 첨부 파일 X
					}
				}
				result = service.getUpdate(bdto);
				// update.jsp 에서 데이터 수정 성공시 해당 인덱스의 view 페이지로 이동하기 위함
				request.setAttribute("b_idx", mr.getParameter("b_idx"));
				request.setAttribute("result", result);
				path = "update.jsp";
				break;
				
			case "remove_page":
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				bdto = new BDto();
				// 해당 인덱스 번호에 해당하는 데이터를 가져오기
				bdto = service.getView(b_idx);
				request.setAttribute("bdto", bdto);
				path = "remove_page.jsp";
				break;
				
			case "remove":
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				result = service.getRemove(b_idx);
				request.setAttribute("result", result);
				path = "remove.jsp";
				break;
				
			case "insert_comment":
				CDto cdto = new CDto();
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				cdto.setB_idx(b_idx);
				cdto.setWriter(request.getParameter("writer"));
				cdto.setContent(request.getParameter("content"));
				cdto.setPw(request.getParameter("pw"));
				cdto.setIp(request.getRemoteAddr());
				result = service.getInsertComment(cdto);
				// insert_comment.jsp 에서 댓글 저장 성공시 해당 인덱스의 view 페이지로 이동하기 위함
				request.setAttribute("b_idx", b_idx);
				request.setAttribute("result", result);
				path = "insert_comment.jsp";
				break;
				
			case "remove_comment":
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
				result = service.getRemoveComment(c_idx);
				request.setAttribute("b_idx", b_idx);
				request.setAttribute("result", result);
				path = "remove_comment.jsp";
				break;
		}
		request.getRequestDispatcher(path).forward(request, response);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
