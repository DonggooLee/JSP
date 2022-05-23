package org.ddongq.dto;

import java.sql.Date;

public class CommentDto {
	private int comment_id, board_id, user_id;
	private String comments;
	private Date reg_date;
	
	public CommentDto() {
	}
	public CommentDto(int comment_id, int board_id, int user_id, String comments, Date reg_date) {
		super();
		this.comment_id = comment_id;
		this.board_id = board_id;
		this.user_id = user_id;
		this.comments = comments;
		this.reg_date = reg_date;
	}

	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
