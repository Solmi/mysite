package com.javalec.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.board.vo.UserVO;


@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(UserVO vo) {
		mybatis.insert("UserDao.insert",vo);
	}
	
	public UserVO getuservo(UserVO vo) {
		return mybatis.selectOne("UserDao.getuservo",vo);
	}
	
	
	
}
