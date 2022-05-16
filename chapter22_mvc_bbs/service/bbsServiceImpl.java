package org.ddongq.service;

import java.util.List;
import java.util.Map;

import org.ddongq.dao.BDao;
import org.ddongq.dao.BDaoImpl;
import org.ddongq.dao.CDao;
import org.ddongq.dao.CDaoImpl;
import org.ddongq.dto.BDto;
import org.ddongq.dto.CDto;

public class bbsServiceImpl implements bbsService{
	private BDao dao1 = BDaoImpl.getInstance();
	private CDao dao2 = CDaoImpl.getInstance();
	@Override
	public int total_record_() {
		return dao1.total_record_p();
	}
	@Override
	public List<BDto> getList(Map<String, Integer> map) {
		return dao1.getList_(map);
	}
	@Override
	public BDto getView(int b_idx) {
		return dao1.getViewBidx(b_idx);
	}
	@Override
	public List<CDto> getAllComment(int b_idx) {
		return dao2.getAllListCommnet(b_idx);
	}
	@Override
	public int getUpdateByHit_(BDto bdto) {
		return dao1.getUpdateByHit(bdto);
	}
	@Override
	public int getInsert(BDto bdto) {
		return dao1.getInsertBBS(bdto);
	}
	@Override
	public int getUpdate(BDto bdto) {
		return dao1.getUpdateBidx(bdto);
	}
	@Override
	public int getRemove(int b_idx) {
		return dao1.getRemoveBidx(b_idx);
	}
	@Override
	public int getInsertComment(CDto cdto) {
		return dao2.getInsertCommentBidx(cdto);
	}
	@Override
	public int getRemoveComment(int c_idx) {
		return dao2.getRemoveCommnetCidx(c_idx);
	}
}
