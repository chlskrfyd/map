package com.my.nackryong.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.my.nackryong.vo.BookVO;
import com.my.nackryong.vo.PlayerVO;
@Repository
public class BookDAO {
	@Autowired
	private SqlSession sqlSession;
	
		public ArrayList<BookVO> bookList(String searchItem, String searchKeyword) {
			HashMap<String,String>map=new HashMap<>();
			map.put("searchItem",searchItem);
			map.put("searchKeyword",searchKeyword);
			ArrayList<BookVO>list=null;
			try {
				BookMapper mapper=sqlSession.getMapper(BookMapper.class);
				list=mapper.getBookList(map);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
