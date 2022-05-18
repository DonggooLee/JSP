package org.ddongq.dao;

import org.ddongq.dto.UserDto;

public interface UserDao {
	public abstract int getInsertRegister(UserDto dto);
	public abstract UserDto getUserRegister(UserDto dto);
	public int getUpdateUser(UserDto dto);
}
