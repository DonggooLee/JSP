package org.ddongq.dto;

import java.sql.Date;

public class UserDto {
	private int user_id;
	private String id, pw, name, email, introduce;
	private Date reg_date;
	public UserDto() {}
	public UserDto(int user_id, String id, String pw, String name, String email, String introduce, Date reg_date) {
		super();
		this.user_id = user_id;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.introduce = introduce;
		this.reg_date = reg_date;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
