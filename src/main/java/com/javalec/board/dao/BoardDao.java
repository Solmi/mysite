package com.javalec.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.BoardVO;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> getboardVOList(){
		return mybatis.selectList("BoardDao.getList");
	}

	public void write(BoardVO vo) {
		mybatis.update("BoardDao.write", vo);
	}
	
	public List<BoardVO> searchtitle(String keyword){
		return mybatis.selectList("BoardDao.searchtitle",keyword);
	}
	public List<BoardVO> searchcontent(String keyword){
		return mybatis.selectList("BoardDao.searchcontent",keyword);
	}
	
	public BoardVO searchone(BoardVO vo) {
		return mybatis.selectOne("BoardDao.searchone",vo);
	}
	
	public void cntplus(BoardVO vo) {
		mybatis.update("BoardDao.cntplus", vo);
	}

	public void delete(BoardVO vo) {
		mybatis.update("BoardDao.delete",vo);
	}

	public void update(BoardVO vo) {
		mybatis.update("BoardDao.update",vo);
	}
}
