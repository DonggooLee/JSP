package org.ddongq.dao;

import java.util.List;

import org.ddongq.dto.BoardDto;
import org.ddongq.dto.CommentCountDto;
import org.ddongq.dto.CommentDto;

public interface BoardDao {
	// 로그인한 아이디로 게시글 작성
	public int getInsertBoard_(BoardDto dto);
	// 로그인한 회원의 게시글 가져오기
	public List<BoardDto> getBoard_(int user_id);
	// 내 게시글 페이지에서 선택한 게시글만 데이터 가져오기
	public BoardDto getBoardIdx_(int board_id);
	// 게시글 수정
	public int getUpdateBoard_(BoardDto dto);
	// 게시글 삭제
	public int getRemoveBoard_(int board_id);
	// 전체 게시글 조회
	public List<BoardDto> getBoardAll_();
	// 전체 게시글 조회 (최신순)
	public List<BoardDto> getBoard_ALL_ORDER_REG_();
	// 전체 게시글 조회 (조회수순)
	public List<BoardDto> getBoard_ALL_ORDER_HIT_();
	// 선택한 게시글 조회수 업데이트
	public int getUpdateByHit_(BoardDto dto);
	// 게시글 댓글 추가
	public int getInsertComment_(CommentDto dto);
	// 전체 댓글 조회
	public List<CommentDto> getComment_(int board_id);
	// 게시글 댓글 삭제
	public int getRemoveComment_(int comment_id);
	// 게시판 댓글 수정
	public int getUpdateComment_(CommentDto dto);
	// 게시판 댓글 개수
	public int getCountComment_(int board_id);
	// 메인 홈페이지 게시판 댓글 개수
	public List<CommentCountDto> getCountComments_();
	// 검색
	public List<BoardDto> getSearch_(String search);
}
