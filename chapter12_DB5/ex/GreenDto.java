package org.ddongq.ex;

import java.sql.Date;

public class GreenDto {
	private int idx;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String addr;
	private Date reg_date;
	
	public GreenDto() {
	}
	public GreenDto(int idx, String id, String pw, String name, int age, String addr, Date date) {
		super();
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.reg_date = date;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getDate() {
		return reg_date;
	}
	public void setDate(Date date) {
		this.reg_date = date;
	}
	
}
