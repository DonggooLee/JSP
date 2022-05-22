package org.ddongq.dto;

import java.sql.Date;

public class UserBoardJoinDto {
	private int board_id, user_id;
	private String id, pw, name, email, introduce, title, content, filename;;
	private Date reg_date;
	
	public UserBoardJoinDto() {
	}
	public UserBoardJoinDto(int board_id, int user_id, String id, String pw, String name, String email,
			String introduce, String title, String content, String filename, Date reg_date) {
		super();
		this.board_id = board_id;
		this.user_id = user_id;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.introduce = introduce;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.reg_date = reg_date;
	}
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
