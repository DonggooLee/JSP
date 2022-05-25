package org.ddongq.service;

import java.util.List;

import org.ddongq.dao.MemberDao;
import org.ddongq.dao.MemberDaoImpl;
import org.ddongq.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDao dao = MemberDaoImpl.getInstance();
	
	@Override
	public List<MemberVO> getMember() {
		return dao.getMember_();
	}
	
}
