package com.my.nackryong.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.my.nackryong.dao.BookDAO;
import com.my.nackryong.dao.PlayerDAO;
import com.my.nackryong.vo.BookVO;
import com.my.nackryong.vo.PlayerVO;


@Controller
public class BookController {
	@Autowired 
	private BookDAO dao;
	//방명록리스트화면이동
		@RequestMapping(value = "/book/bookList", method = RequestMethod.GET)
		public String bookList(String searchItem, String searchKeyword, Model model) {
			ArrayList<BookVO> list=dao.bookList(searchItem,searchKeyword);
			System.out.println(searchItem);
			System.out.println(searchKeyword);
			model.addAttribute("list",list);
			return "/book/bookList";
		}
	
	
	
	
	
	
	
	
}
