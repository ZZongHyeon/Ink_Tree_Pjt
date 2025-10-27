package com.boot.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.book.dao.BookRecommendDAO;
import com.boot.book.dto.BookDTO;

@Service
public class BookRecommendServiceImpl implements BookRecommendService {
	@Autowired
	private SqlSession sqlSession;
	private BookRecommendDAO dao;
	
	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(BookRecommendDAO.class);
	}

	@Override
	public ArrayList<BookDTO> Top5Recommend(HashMap<String, String> param) {
		ArrayList<BookDTO> list = dao.Top5Recommend(param);
		return list;
	}

	@Override
	public ArrayList<BookDTO> Top3Borrow() {
		ArrayList<BookDTO> list = dao.Top3Borrow();
		return list;
	}

	@Override
	public ArrayList<BookDTO> Top5Random(HashMap<String, String> param) {
		ArrayList<BookDTO> list = dao.Top5Random(param);
		return list;
	}

	@Override
	public String CategoryNum(HashMap<String, String> param) {
		String categoryNum = dao.CategoryNum(param);
		return categoryNum;
	}
}
