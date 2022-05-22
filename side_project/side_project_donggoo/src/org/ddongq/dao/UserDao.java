package org.ddongq.dao;

import java.util.List;

import org.ddongq.dto.UserDto;

public interface UserDao {
	public abstract int getInsertRegister(UserDto dto);
	public abstract UserDto getUserRegister(UserDto dto);
	public int getUpdateUser(UserDto dto);
	public List<UserDto> getUser_ALLRegister();
}
