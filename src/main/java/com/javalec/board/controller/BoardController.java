package com.javalec.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.board.service.BoardService;
import com.javalec.board.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	@Qualifier("boardservice")
	private BoardService boardservice;

	@RequestMapping("list.do")
	public String list(Model model, HttpServletRequest req) {

		String keyword = req.getParameter("keyword");
		String type = req.getParameter("searchCondition");
		if (keyword == null) {
			model.addAttribute("list", boardservice.getboardVOlist());
		} else {
			keyword = "%" + req.getParameter("keyword") + "%";
			if (type.equals("content")) {
				model.addAttribute("list", boardservice.searchcontent(keyword));
			} else {
				model.addAttribute("list", boardservice.searchtitle(keyword));
			}
		}
		return "getBoardList.jsp";
	}

	@RequestMapping("writeBoard.do")
	public String write(BoardVO vo){
		boardservice.write(vo);
		return "list.do";
	}

	@RequestMapping("searchone.do")
	public String searchone(BoardVO vo, Model model) {
		vo = boardservice.searchone(vo);
		int cnt = vo.getCnt()+1;
		vo.setCnt(cnt);
		boardservice.cntplus(vo);
		model.addAttribute("vo", vo);
		return "getBoard.jsp";
	}

	@RequestMapping("delete.do")
	public String delete(BoardVO vo) {
		boardservice.delete(vo);
		return "list.do";
	}

	@RequestMapping("update.do")
	public String update(BoardVO vo) {
		boardservice.update(vo);
		return "list.do";
	}

	@RequestMapping("updateform.do")
	public String updateform(BoardVO vo, Model model) {
		vo = boardservice.searchone(vo);
		model.addAttribute("vo", vo);
		return "modifyBoard.jsp";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "joinpage.jsp";
	}
}
