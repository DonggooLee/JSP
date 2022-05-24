package org.ddongq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ddongq.dto.BoardDto;
import org.ddongq.dto.CommentCountDto;
import org.ddongq.dto.CommentDto;
import org.ddongq.dto.UserDto;
import org.ddongq.service.blogService;
import org.ddongq.service.blogServiceImpl;

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
		String cmd = "index";
		if( paramCmd != null && !paramCmd.isEmpty() ) {
			cmd = paramCmd;
		}
		MultipartRequest mr = null;
		UserDto u_dto = null;
		BoardDto b_dto = null;
		CommentDto c_dto = null;
		List<UserDto> list_1 = null;
		List<BoardDto> list_2 = null;
		List<CommentDto> list_3 = null;
		List<CommentCountDto> list_4 = null;
		int result = 0;
		int user_id = 0;
		int board_id = 0;
		int comment_id = 0;
		String path = null;
		String open = null;
		String realPath = null;
		HttpSession session = request.getSession();
		blogService service = new blogServiceImpl();
		
		switch (cmd) {
			// 메인 페이지
			case "index":
				open = (String)session.getAttribute("open");
				if(open!=null){
					session.removeAttribute("open");
				}
				list_1 = service.getUser_ALL();
				list_2 = service.getBoard_ALL();
				list_4 = service.getCountComment();
				request.setAttribute("user_list", list_1);
				request.setAttribute("board_list", list_2);
				request.setAttribute("count_list", list_4);
				path = "index.jsp";
				break;
			// 로그인 페이지 이동
			case "log_in_page":
				path = "log_in_page.jsp";
				break;
			// 로그인
			case "log_in":
				u_dto = new UserDto();
				u_dto.setId(request.getParameter("id"));
				u_dto.setPw(request.getParameter("pw"));
				UserDto dto_ = new UserDto();
				dto_ = service.getUser(u_dto);
				session.setAttribute("login_info", dto_);
				path = "log_in.jsp";
				break;
			// 회원가입 페이지 이동
			case "register_page":
				path = "register_page.jsp";
				break;
			// 회원가입
			case "register":
				u_dto = new UserDto();
				u_dto.setName(request.getParameter("name"));
				u_dto.setEmail(request.getParameter("email"));
				u_dto.setId(request.getParameter("id"));
				u_dto.setPw(request.getParameter("pw"));
				u_dto.setIntroduce(request.getParameter("introduce"));
				result = service.getInsert(u_dto);
				request.setAttribute("result", result);
				path = "register.jsp";
				break;
			// 글쓰기 페이지 이동 (로그인 할 경우)
			case "write_page":	
				path = "write_page.jsp";
				break;
			// 글쓰기
			case "write":	
				realPath = request.getServletContext().getRealPath("/upload");
				mr = new MultipartRequest(
						request,											// 원래 받아야되는 request
						realPath, 											// 업로드 파일이 저장될 경로 
						1024*1024*10,										// 업로드 가능한 파일 사이즈
						"UTF-8",											// 인코딩
						new DefaultFileRenamePolicy()						// 동일한 이름의 파일 저장시 처리방법	
						);
				b_dto = new BoardDto();
				b_dto.setTitle(mr.getParameter("title"));
				b_dto.setContent(mr.getParameter("content"));
				b_dto.setFilename(mr.getFilesystemName("filename"));
				b_dto.setUser_id(Integer.parseInt(mr.getParameter("user_id")));
				result = service.getInsertBoard(b_dto);
				request.setAttribute("result", result);
				path = "write.jsp";
				break;
			// 회원정보 업데이트 페이지
			case "update_user_page":
				path = "update_user_page.jsp";
				break;
			// 회원정보 업데이트
			case "update_user":
				u_dto = new UserDto();
				u_dto.setEmail(request.getParameter("email"));
				u_dto.setId(request.getParameter("id"));
				u_dto.setPw(request.getParameter("new_pw"));
				u_dto.setIntroduce(request.getParameter("introduce"));
				u_dto.setUser_id(Integer.parseInt(request.getParameter("user_id")));
				result = service.getUpdate(u_dto);
				request.setAttribute("result", result);
				path = "update_user.jsp";
				break;
			// 로그아웃 버튼 클릭시 이동
			case "logout":
				path = "logout.jsp";
				break;
			// 내 게시글 페이지 이동
			case "my_post_page":
				user_id = Integer.parseInt(request.getParameter("user_id"));
				list_2 = service.getBoard(user_id);
				request.setAttribute("board_list", list_2);
				path = "my_post_page.jsp";
				break;
			// 내 게시글 페이지에서 수정할 게시글 선택시 페이지 이동
			case "update_board_page":
				board_id = Integer.parseInt(request.getParameter("board_id"));
				b_dto = service.getBoardIdx(board_id);
				request.setAttribute("select_board", b_dto);
				path = "update_board_page.jsp";
				break;
			// 선택한 게시글 수정
			case "update_board":
				b_dto = new BoardDto();
				board_id = Integer.parseInt(request.getParameter("board_id"));
				b_dto.setBoard_id(board_id);
				b_dto.setContent(request.getParameter("content"));
				b_dto.setTitle(request.getParameter("title"));
				result = service.getUpdateBoard(b_dto);
				request.setAttribute("user_id", request.getParameter("user_id"));
				request.setAttribute("result", result);
				path = "update_board.jsp";
				break;
			// 내 게시글 보기에서 선택한 게시글 삭제
			case "remove_board":
				board_id = Integer.parseInt(request.getParameter("board_id"));
				result = service.getRemoveBoard(board_id);
				request.setAttribute("result", result);
				path = "remove_board.jsp";
				break;
			// index 페이지에서 게시글을 클릭하면 해당 게시글이 가지고 있는 정보 페이지로 이동
			case "view_page":
				board_id = Integer.parseInt(request.getParameter("board_id"));
				list_3 = service.getComment(board_id);
				b_dto = service.getBoardIdx(board_id);
				open = (String)session.getAttribute("open");
				if(open==null){
					session.setAttribute("open", "YES");
					int hit = b_dto.getHit()+1;
					b_dto.setHit(hit);
					b_dto.setBoard_id(board_id);
					service.getUpdateByHit(b_dto);
				}
				// DB 저장된 모든 회원 조회
				list_1 = service.getUser_ALL();
				// 게시판 번호에 해당하는 댓글 개수 조회
				int count = service.getCountComment(board_id);
				session.setAttribute("user_list", list_1);
				request.setAttribute("comment_count", count);
				request.setAttribute("comment_list", list_3);
				request.setAttribute("select_board", b_dto);
				path = "view_page.jsp";
				break;
			// 게시글 정렬 인덱스(최신날짜순)
			case "index_order_reg":
				list_1 = service.getUser_ALL();
				list_2 = service.getBoard_ALL_ORDER_REG();
				request.setAttribute("user_list", list_1);
				request.setAttribute("board_list", list_2);
				path = "index.jsp";
				break;
			// 게시글 정렬 인덱스(조회수순)
			case "index_order_hit":
				list_1 = service.getUser_ALL();
				list_2 = service.getBoard_ALL_ORDER_HIT();
				request.setAttribute("user_list", list_1);
				request.setAttribute("board_list", list_2);
				path = "index.jsp";
				break;
			// 댓글 추가
			case "insert_comment":
				user_id = Integer.parseInt(request.getParameter("user_id"));
				board_id = Integer.parseInt(request.getParameter("board_id"));
				String comment = request.getParameter("comment");
				c_dto = new CommentDto();
				c_dto.setUser_id(user_id);
				c_dto.setBoard_id(board_id);
				c_dto.setComments(comment);
				result = service.getInsertComment(c_dto);
				request.setAttribute("board_id", board_id);
				request.setAttribute("result", result);
				path = "insert_comment.jsp";
				break;
			// 댓글 삭제
			case "remove_comment":
				board_id = Integer.parseInt(request.getParameter("board_id"));
				comment_id = Integer.parseInt(request.getParameter("comment_id"));
				result = service.getRemoveComment(comment_id);
				request.setAttribute("board_id", board_id);
				request.setAttribute("result", result);
				path = "remove_comment.jsp";
				break;
			// 댓글 수정 페이지
			case "update_comment_page":
				board_id = Integer.parseInt(request.getParameter("board_id"));
				comment_id = Integer.parseInt(request.getParameter("comment_id"));
				request.setAttribute("board_id", board_id);
				request.setAttribute("comment_id", comment_id);
				path = "update_comment_page.jsp";
				break;
			// 댓글 수정
			case "update_comment":
				board_id = Integer.parseInt(request.getParameter("board_id"));
				comment_id = Integer.parseInt(request.getParameter("comment_id"));
				c_dto = new CommentDto();
				c_dto.setComment_id(comment_id);
				c_dto.setComments(request.getParameter("comments"));
				result = service.getUpdateComment(c_dto);
				request.setAttribute("board_id", board_id);
				request.setAttribute("result", result);
				path = "update_comment.jsp";
				break;
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
