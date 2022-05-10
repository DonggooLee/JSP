package org.ddongq.ex;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService { // factory를 만드는게 목적이다!!
	// Field
	private static SqlSessionFactory factory = null;
	// singleton
	static {		
		try {
			String resource = "org/ddongq/ex/sqlmap.xml";	// DBCP가 들어있다
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e ) {
			e.printStackTrace();
		}
	}
	// Method
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
// SqlSessionFactoryBuilder에서 SqlSessionFactory 을 생성하고, Factory에서 SqlSession을 생성한다.
// mybaytis를 이용하려면 SqlSession이 필요하다!!!!!!

/*
https://mybatis.org/mybatis-3/ko/getting-started.html 참조
*/