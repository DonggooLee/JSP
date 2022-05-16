package org.ddongq.dto;

import java.sql.Date;

public class BDto {
	private int b_idx, hit;
	private Date reg_date;
	private String writer, title, content, pw, ip, filename;

	public BDto() {}
	public BDto(int b_idx, int hit, Date reg_date, String writer, String title, String content, String pw, String ip,
			String filename) {
		super();
		this.b_idx = b_idx;
		this.hit = hit;
		this.reg_date = reg_date;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.pw = pw;
		this.ip = ip;
		this.filename = filename;
	}

	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
