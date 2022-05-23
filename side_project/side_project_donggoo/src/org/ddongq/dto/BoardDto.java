package org.ddongq.dto;

import java.sql.Date;

public class BoardDto {
	private int board_id, user_id, hit;
	private String title, content, filename;
	private Date reg_date;
	public BoardDto() {
	}
	public BoardDto(int board_id, int user_id, int hit, String title, String content, String filename, Date reg_date) {
		super();
		this.board_id = board_id;
		this.user_id = user_id;
		this.hit = hit;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
