package org.ddongq.dec;

import java.io.UnsupportedEncodingException;

public class CharsetEncoding { // 혹시라도 나중에 JSP작성시 인코딩을 하지 못하였다면 이용하자!
	
	public static String toHangul(String str) throws UnsupportedEncodingException {
		if( str == null ) {
			return null;
		}
		return new String(str.getBytes(), "UTF-8");
	}
}
