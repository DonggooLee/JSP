package org.ddongq.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	
	// 1. getConnection() 메소드는 매개변수가 없다.
	// 2. getConnection() 메소드의 리턴 타입은 Connection 이다.
	// 3. new DBConnect() 의 호출 없이(인스턴스 생성없이) getConnection 메소드가 호출되므로 static 메소드이다.
	// 4. ClassNotFoundException, SQLException 예외 클래스를 던져야 한다.
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String user = "scott";
		String pw = "tiger";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521:포트번호, xe:오라클버전
		
		Connection conn = DriverManager.getConnection(url, user, pw);
		
		return conn;
		//return DriverManager.getConnection(url, user, password); 간략하게 줄여서도 가능
	}
}
