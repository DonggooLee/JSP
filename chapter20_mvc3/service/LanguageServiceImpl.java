package org.ddongq.service;

public class LanguageServiceImpl implements LanguageService {

	@Override
	public String executeHangeul() {
		return "안녕";
	}

	@Override
	public String executeEnglish() {
		return "Hello";
	}
	
}
