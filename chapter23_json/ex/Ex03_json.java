package org.ddongq.ex;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Ex03_json {
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		// JSONObject는 자바의 Map을 구현
		// Map에서 데이터 저장는 put(key, value)
		JSONObject obj = new JSONObject();
		obj.put("name","김씨");
		obj.put("age",20);
		obj.put("isAdult",true);
		obj.put("phone",null);
		
		// JSON 객체 => 자바 String으로 변환(.toJSONString() 이용)
		String jsonMsg = obj.toJSONString();
		System.out.println(jsonMsg);
		
		// JSONArray는 자바의 List를 구현
		// List에서 데이터 저장는 add(value)
		JSONArray list = new JSONArray();
		list.add(obj);
		
		// 데이터 타입확인 방법 : 변수명.getClass().getName();
		// 데이터 타입 : JSONArray
		System.out.println(list);
		// 데이터 타입 : String
		System.out.println(list.toJSONString());
	}
}
