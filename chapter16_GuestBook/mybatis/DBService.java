package org.ddongq.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService { // factory를 만드는게 목적이다!!
	private static SqlSessionFactory factory = null;
	
	static {		
		try {
			String resource = "org/ddongq/mybatis/sqlmap.xml";	// DBCP가 들어있다
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
