package com.javalec.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.board.dao.UserDao;
import com.javalec.board.vo.UserVO;
@Service("userservice")
public class UserService {
	
	@Autowired
	private UserDao dao;
	
	
	public void insertuser(UserVO vo) {
		dao.insert(vo);
	}
	
	public UserVO getuservo(UserVO vo) {
		return dao.getuservo(vo);
	}
	
}
