package com.my.nackryong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.nackryong.dao.PlayerDAO;
import com.my.nackryong.vo.PlayerVO;


@Controller
public class PlayerController {
	@Autowired 
	PlayerDAO dao;
	//회원가입화면이동
	@RequestMapping(value = "/player/signup", method = RequestMethod.GET)
	public String signup() {
		return "/player/signup";
	}
	//지도화면이동
	@RequestMapping(value = "/player/map3", method = RequestMethod.GET)
	public String map3() {
		return "/player/map3";
	}
	
	//지도화면이동
		@RequestMapping(value = "/player/map4", method = RequestMethod.GET)
		public String map4() {
			return "/player/map4";
		}
		//지도화면이동
		@RequestMapping(value = "/player/map5", method = RequestMethod.GET)
		public String map5() {
			return "/player/map5";
		}
		//지도화면이동
				@RequestMapping(value = "/player/map6", method = RequestMethod.GET)
				public String map6() {
					return "/player/map6";
				}
	//인서트문작동 db에 정보저장 모델과 세션 첫 활용 모델,세션 둘다 값 띄우기가능
	@RequestMapping(value = "/player/sign", method = RequestMethod.POST)
	public String sign(Model model,PlayerVO vo,HttpSession session) {
		System.out.println(vo);
		session.setAttribute("playerid", vo.getPlayerid());
		dao.signup1(vo);
		model.addAttribute("vo",vo);
		return "main";
	}
	//로그인화면이동
		@RequestMapping(value = "/player/loginForm", method = RequestMethod.GET)
		public String loginForm() {
			return "/player/loginForm";
		}
		// 로그인할때 가입된 회원인지 확인하는 메서드 호출 dao.login 셀렉트문작동
		@RequestMapping(value = "/player/login", method = RequestMethod.POST)
		public String login(PlayerVO vo, HttpSession session) {
			if(dao.login(vo) == 1) {
				session.setAttribute("playerid",vo.getPlayerid());	
			}
			return "redirect:/";
		}
		// 로그아웃
		@RequestMapping(value = "/player/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			dao.logout(session);
			return "redirect:/";
		}
}
