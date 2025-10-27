package com.boot.z_util.otherMVC.service;

import java.util.*;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.z_util.otherMVC.dao.UtilDAO;



@Service
public class UtilServiceImpl implements UtilService {
	@Autowired
	private SqlSession sqlSession;
	private UtilDAO dao;

	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(UtilDAO.class);
	}
	
	@Override
	public int getTotalBooks() {
		return dao.getTotalBooks();
	}

	@Override
	public int getTotalUsers() {
		return dao.getTotalUsers();
	}

	@Override
	public int getBorrowedBooks() {
		return dao.getBorrowedBooks();
	}

	@Override
	public int getOverdueBooks() {
		return dao.getOverdueBooks();
	}

	@Override
	public int getUserOver(HashMap<String, String> param) {
		return dao.getUserOver(param);
	}

	@Override
	public int getUserBorrowed(HashMap<String, String> param) {
		return dao.getUserBorrowed(param);
	}

	@Override
	public int getUserRecord(HashMap<String, String> param) {
		return dao.getUserRecord(param);
	}
	
	@Override
	public int getBookRecordCount(HashMap<String, String> param) {
		return dao.getBookRecordCount(param);
	}

	@Override
	public void clearAllSessions() {
	    dao.clearAllSessions();
	}
}
