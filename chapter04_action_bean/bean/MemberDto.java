package org.ddongq.bean;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private int age;
	private String addr;
	private String gender;
	private String[] hobbies;
	private String[] likeFood;
	private String[] dislikeFood;
	
	public MemberDto() {
	}
	public MemberDto(String id, String pw, String name, int age, String addr, String gender, String[] hobbies,
			String[] likeFood, String[] dislikeFood) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.gender = gender;
		this.hobbies = hobbies;
		this.likeFood = likeFood;
		this.dislikeFood = dislikeFood;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getHobbies() {
		return hobbies;
	}

	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}

	public String[] getLikeFood() {
		return likeFood;
	}

	public void setLikeFood(String[] likeFood) {
		this.likeFood = likeFood;
	}

	public String[] getDislikeFood() {
		return dislikeFood;
	}

	public void setDislikeFood(String[] dislikeFood) {
		this.dislikeFood = dislikeFood;
	}
}
