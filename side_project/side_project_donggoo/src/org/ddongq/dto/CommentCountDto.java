package org.ddongq.dto;

public class CommentCountDto {
	private int count, board_id;
	public CommentCountDto() {
	}
	public CommentCountDto(int count, int board_id) {
		super();
		this.count = count;
		this.board_id = board_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
}
