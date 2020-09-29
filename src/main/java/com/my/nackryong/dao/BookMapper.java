package com.my.nackryong.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.nackryong.vo.BookVO;
import com.my.nackryong.vo.PlayerVO;

public interface BookMapper {

	public ArrayList<BookVO> getBookList(HashMap<String, String> map);
}
