package org.ddongq.dao;

import java.util.List;

import org.ddongq.dto.CDto;

public interface CDao {
	public abstract List<CDto> getAllListCommnet(int b_idx);
	public abstract int getInsertCommentBidx(CDto cdto);
	public abstract int getRemoveCommnetCidx(int c_idx);
}
