package org.ddongq.dao;

import java.util.List;

import org.ddongq.dto.BoardDto;

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
}
