package org.ddongq.bean;

public class StudentDTO {
	
	private String no;
	private String name;
	private String dept;
	private int age;
	
	public StudentDTO() {
		
	}
	public StudentDTO(String no, String name, String dept, int age) {
		super();
		this.no = no;
		this.name = name;
		this.dept = dept;
		this.age = age;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
