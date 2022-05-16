package org.ddongq.dao;

import java.util.List;
import java.util.Map;

import org.ddongq.dto.BDto;

public interface BDao {
	public abstract int total_record_p();
	public List<BDto> getList_(Map<String, Integer> map);
	public abstract BDto getViewBidx(int b_idx);
	public abstract int getUpdateByHit(BDto bdto);
	public abstract int getInsertBBS(BDto bdto);
	public abstract int getUpdateBidx(BDto bdto);
	public abstract int getRemoveBidx(int b_idx);
}
