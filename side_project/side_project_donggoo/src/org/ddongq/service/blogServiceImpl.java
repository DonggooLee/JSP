package org.ddongq.service;

import java.util.List;

import org.ddongq.dao.BoardDao;
import org.ddongq.dao.BoardDaoImpl;
import org.ddongq.dao.UserDao;
import org.ddongq.dto.BoardDto;
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
}
