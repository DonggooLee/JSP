package org.ddongq.mybatis.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	
	// Field
	private static SqlSessionFactory factory = null;
	
	// static 초기화
	static {		
		try {
			String resource = "org/ddongq/mybatis/config/sqlmap.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	// factory를 리턴하는 getFactory() 메소드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
}
