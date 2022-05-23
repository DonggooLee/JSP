package org.ddongq.service;

import java.util.List;

import org.ddongq.dto.BoardDto;
import org.ddongq.dto.CommentDto;
import org.ddongq.dto.UserDto;

public interface blogService {
	// 회원가입
	public int getInsert(UserDto dto);
	// 로그인 데이터 가져오기
	public UserDto getUser(UserDto dto);
	// 로그인한 아이디로 게시글 작성
	public int getInsertBoard(BoardDto dto);
	// 로그인한 회원의 정보 수정
	public int getUpdate(UserDto dto);
	// 로그인한 회원의 게시글 가져오기
	public List<BoardDto> getBoard(int user_id);
	// 내 게시글 페이지에서 선택한 게시글만 데이터 가져오기
	public BoardDto getBoardIdx(int board_id);
	// 게시글 수정
	public int getUpdateBoard(BoardDto dto);
	// 게시글 삭제
	public int getRemoveBoard(int board_id);
	// 게시글 조회 (모든 게시글)
	public List<BoardDto> getBoard_ALL();
	// 회원테이블 조회 (모든 회원)
	public List<UserDto> getUser_ALL();
	// 게시글 조회 (최신순)
	public List<BoardDto> getBoard_ALL_ORDER_REG();
	// 게시글 조회 (조회수순)
	public List<BoardDto> getBoard_ALL_ORDER_HIT();
	// 선택한 게시글 조회수 업데이트
	public int getUpdateByHit(BoardDto dto);
	// 게시판 댓글 추가
	public int getInsertComment(CommentDto dto);
	// 게시판 댓글 조회
	public List<CommentDto> getComment(int board_id);
}
