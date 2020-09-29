package com.my.nackryong.dao;

import com.my.nackryong.vo.PlayerVO;

public interface PlayerMapper {
	public void sign1(PlayerVO vo);
	public int login(PlayerVO vo);
}
