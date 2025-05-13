package com.boot.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.book.dao.BookReviewDAO;
import com.boot.book.dto.BookDTO;

@Service
public class BookRecommendServiceImpl implements BookRecommendService {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession session;

	@Override
	public ArrayList<BookDTO> Top5Recommend(HashMap<String, String> param) {
		BookReviewDAO dao = sqlSession.getMapper(BookReviewDAO.class);
		ArrayList<BookDTO> list = dao.Top5Recommend(param);
		return list;
	}

	@Override
	public ArrayList<BookDTO> Top3Borrow() {
		BookReviewDAO dao = sqlSession.getMapper(BookReviewDAO.class);
		ArrayList<BookDTO> list = dao.Top3Borrow();
		return list;
	}

	@Override
	public ArrayList<BookDTO> Top5Random(HashMap<String, String> param) {
		BookReviewDAO dao = sqlSession.getMapper(BookReviewDAO.class);
		ArrayList<BookDTO> list = dao.Top5Random(param);
		return list;
	}

	@Override
	public String CategoryNum(HashMap<String, String> param) {
		BookReviewDAO dao = sqlSession.getMapper(BookReviewDAO.class);
		String categoryNum = dao.CategoryNum(param);
		return categoryNum;
	}
}
