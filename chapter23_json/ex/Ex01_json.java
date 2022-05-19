package org.ddongq.ex;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex01_json {
	public static void main(String[] args) {
		
		// JSON
		// 예시
		// {"name":"김씨", "age":"20", "isAdult":true, "phone":null}
		// 위 예시를 자바의 String으로 생성해보자
		// 큰 따옴표를 표현하려면 \ 를 이용해야 한다.
		String jsonMsg = "{\"name\":\"김씨\", \"age\":\"20\", \"isAdult\":true, \"phone\":null}";
		JSONParser parser = new JSONParser(); 	// JSONParser(분석기), 반드시 jar 파일 포함
		JSONObject obj = null;					// JSON 객체
		
		// 변환 시 ParseException이 발생할 수 있으므로 try-catch 처리 한다.
		// 자바 String => json 객체 변환
		
		try {
			obj = (JSONObject)parser.parse(jsonMsg);
		} catch (ParseException e) {
			System.out.println("자바 String -> JSON 객체 변환 실패");
			e.printStackTrace();
		}

		// JSON 객체로 변환된 obj는 자바의 MAP을 구현한 형태를 가진다.
		System.out.println(obj.get("name"));
		System.out.println(obj.get("age"));
		System.out.println(obj.get("phone"));
		System.out.println((Boolean)obj.get("isAdult")? "성인" : "미성년자");

	}
}
