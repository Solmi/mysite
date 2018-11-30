package com.javalec.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.board.dao.BoardDao;
import com.javalec.board.vo.BoardVO;


@Service("boardservice")
public class BoardService{
	@Autowired
	private BoardDao dao;
	
	
	public List<BoardVO> getboardVOlist() {
		return dao.getboardVOList();
	}


	public void write(BoardVO vo) {
		dao.write(vo);
	}
	
	public List<BoardVO> searchtitle(String keyword){
		return dao.searchtitle(keyword);
	}
	public List<BoardVO> searchcontent(String keyword){
		return dao.searchcontent(keyword);
	}
	
	public BoardVO searchone(BoardVO vo) {
		return dao.searchone(vo);
	}
	
	public void cntplus(BoardVO vo) {
		dao.cntplus(vo);
	}


	public void delete(BoardVO vo) {
		dao.delete(vo);
	}


	public void update(BoardVO vo) {
		dao.update(vo);
	}
}
