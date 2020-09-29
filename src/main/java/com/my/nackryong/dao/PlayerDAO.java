package com.my.nackryong.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.nackryong.vo.PlayerVO;
@Repository
public class PlayerDAO {
	@Autowired
	private SqlSession sqlSession;
	// 회원가입
		public void signup1(PlayerVO vo) {
			try {
				PlayerMapper mapper = sqlSession.getMapper(PlayerMapper.class);
				mapper.sign1(vo);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		// 로그인
		public int login(PlayerVO vo) {
			int result=0;
			try {
				PlayerMapper mapper = sqlSession.getMapper(PlayerMapper.class);
				result=mapper.login(vo);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	
		// 로그아웃
		public boolean logout(HttpSession session) {
			session.invalidate();
			return true;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
