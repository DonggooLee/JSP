package org.ddongq.service;

import java.util.List;
import java.util.Map;

import org.ddongq.dto.BDto;
import org.ddongq.dto.CDto;

public interface bbsService {
	// 전체 게시글의 개수 구하기
	public int total_record_();
	// 전체 게시글 조회
	public List<BDto> getList(Map<String, Integer> map);
	// 해당 인덱스 번호에 해당하는 게시글 데이터를 bdto 객체에 저장
	public BDto getView(int b_idx);
	// 해당 인덱스 번호에 해당하는 댓글 데이터를 list 객체에 저장
	public List<CDto> getAllComment(int b_idx);
	// session 에 open 속성명이 없다면 조회수 증가 시키기
	public abstract int getUpdateByHit_(BDto bdto);
	// 게시물 저장
	public int getInsert(BDto bdto);
	// 게시물 수정
	public int getUpdate(BDto bdto);
	// 게시물 삭제
	public int getRemove(int b_idx);
	// 댓글 저장
	public int getInsertComment(CDto cdto);
	// 댓글 삭제
	public int getRemoveComment(int c_idx);
}
