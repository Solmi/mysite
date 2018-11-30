package com.javalec.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.board.service.UserService;
import com.javalec.board.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	@Qualifier("userservice")
	private UserService userservice;
	
	@RequestMapping("joininsert.do")
	public String add(@ModelAttribute UserVO vo) {
		userservice.insertuser(vo);
		return "joinpage.jsp";
	}
	
	@RequestMapping("join.do")
	public String join(UserVO vo, HttpSession session) {
		if(userservice.getuservo(vo)!=null) {
		UserVO vo2 = userservice.getuservo(vo);
		if(vo2.getPassword().equals(vo.getPassword())){
			session.setAttribute("id", vo.getId());
			session.setAttribute("password", vo.getPassword());
			return "list.do";
			
		}else {
			session.setAttribute("error", "비밀번호를 확인해주세요");
			return "joinpage.jsp";
		}
		}else {
			session.setAttribute("error", "없는아이디입니다");
			return "joinpage.jsp";
		}
			
	}
	
	@RequestMapping("findpassword.do")
	public String findpw(UserVO vo, Model model) {
		vo = userservice.getuservo(vo);
		model.addAttribute("password", vo.getPassword());
		return "findpassword.jsp";
	}
	
}
