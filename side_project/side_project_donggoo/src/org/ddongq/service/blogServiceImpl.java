package org.ddongq.service;

import java.util.List;

import org.ddongq.dao.BoardDao;
import org.ddongq.dao.BoardDaoImpl;
import org.ddongq.dao.UserDao;
import org.ddongq.dto.BoardDto;
import org.ddongq.dto.CommentCountDto;
import org.ddongq.dto.CommentDto;
import org.ddongq.dto.UserDto;
import org.ddongq.dao.UserDaoImpl;

public class blogServiceImpl implements blogService{
	private UserDao dao1 = UserDaoImpl.getInstance();
	private BoardDao dao2 = BoardDaoImpl.getInstance();
	@Override
	public int getInsert(UserDto dto) {
		return dao1.getInsertRegister(dto);
	}
	@Override
	public UserDto getUser(UserDto dto) {
		return dao1.getUserRegister(dto);
	}
	@Override
	public int getInsertBoard(BoardDto dto) {
		return dao2.getInsertBoard_(dto);
	}
	@Override
	public int getUpdate(UserDto dto) {
		return dao1.getUpdateUser(dto);
	}
	@Override
	public List<BoardDto> getBoard(int user_id) {
		return dao2.getBoard_(user_id);
	}
	@Override
	public BoardDto getBoardIdx(int board_id) {
		return dao2.getBoardIdx_(board_id);
	}
	@Override
	public int getUpdateBoard(BoardDto dto) {
		return dao2.getUpdateBoard_(dto);
	}
	@Override
	public int getRemoveBoard(int board_id) {
		return dao2.getRemoveBoard_(board_id);
	}
	@Override
	public List<BoardDto> getBoard_ALL() {
		return dao2.getBoardAll_();
	}
	@Override
	public List<UserDto> getUser_ALL() {
		return dao1.getUser_ALLRegister();
	}
	@Override
	public List<BoardDto> getBoard_ALL_ORDER_REG() {
		return dao2.getBoard_ALL_ORDER_REG_();
	}
	@Override
	public List<BoardDto> getBoard_ALL_ORDER_HIT() {
		return dao2.getBoard_ALL_ORDER_HIT_();
	}
	@Override
	public int getUpdateByHit(BoardDto dto) {
		return dao2.getUpdateByHit_(dto);
	}
	@Override
	public int getInsertComment(CommentDto dto) {
		return dao2.getInsertComment_(dto);
	}
	@Override
	public List<CommentDto> getComment(int board_id) {
		return dao2.getComment_(board_id);
	}
	@Override
	public int getRemoveComment(int comment_id) {
		return dao2.getRemoveComment_(comment_id);
	}
	@Override
	public int getUpdateComment(CommentDto dto) {
		return dao2.getUpdateComment_(dto);
	}
	@Override
	public int getCountComment(int board_id) {
		return dao2.getCountComment_(board_id);
	}
	@Override
	public List<CommentCountDto> getCountComments() {
		return dao2.getCountComments_();
	}
	@Override
	public List<BoardDto> getSearch(String search) {
		return dao2.getSearch_(search);
	}
}
