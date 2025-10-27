package com.boot.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.book.dao.BookReviewDAO;
import com.boot.book.dto.ReviewDTO;
import com.boot.book.dto.ReviewHelpfulDTO;
import com.boot.z_page.criteria.NoticeCriteriaDTO;

@Service
public class BookReviewServiceImpl implements BookReviewService {
	@Autowired
	private SqlSession sqlSession;
	private BookReviewDAO dao;
	
	
	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(BookReviewDAO.class);
	}
	
	@Override
	public int insertReview(HashMap<String, String> param) {
		return dao.insertReview(param);
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		return dao.updateReview(reviewDTO);
	}

	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		return dao.deleteReview(reviewDTO);
	}

	@Override
	public ArrayList<ReviewDTO> getReview(NoticeCriteriaDTO criteria, HashMap<String, String> param) {
		return dao.getReview(criteria, param);
	}

	@Override
	public int getReviewCount(NoticeCriteriaDTO criteria, HashMap<String, String> param) {
		int total = dao.getReviewCount(criteria, param);
		return total;
	}

	@Override
	public int checkReview(HashMap<String, String> param) {
		return dao.checkReview(param);
	}

	@Override
	public ReviewDTO getReviewById(int reviewId) {
		return dao.getReviewById(reviewId);
	}

	@Override
	public ArrayList<ReviewDTO> getAllReviewsByBookNumber(int bookNumber) {
		return dao.getAllReviewsByBookNumber(bookNumber);
	}

	@Override
	public boolean addReviewHelpful(int reviewId, int userNumber) {
		// 이미 도움됨 표시를 했는지 확인
		ReviewHelpfulDTO checkDTO = new ReviewHelpfulDTO();
		checkDTO.setReviewId(reviewId);
		checkDTO.setUserNumber(userNumber);

		if (dao.checkReviewHelpful(checkDTO) > 0) {
			return false; // 이미 도움됨 표시를 한 경우
		}

		// 도움됨 추가
		ReviewHelpfulDTO helpfulDTO = new ReviewHelpfulDTO();
		helpfulDTO.setReviewId(reviewId);
		helpfulDTO.setUserNumber(userNumber);

		return dao.addReviewHelpful(helpfulDTO) > 0;
	}

	@Override
	public boolean removeReviewHelpful(int reviewId, int userNumber) {

		ReviewHelpfulDTO helpfulDTO = new ReviewHelpfulDTO();
		helpfulDTO.setReviewId(reviewId);
		helpfulDTO.setUserNumber(userNumber);

		return dao.removeReviewHelpful(helpfulDTO) > 0;
	}

	@Override
	public boolean checkReviewHelpful(int reviewId, int userNumber) {

		ReviewHelpfulDTO helpfulDTO = new ReviewHelpfulDTO();
		helpfulDTO.setReviewId(reviewId);
		helpfulDTO.setUserNumber(userNumber);

		return dao.checkReviewHelpful(helpfulDTO) > 0;
	}

	@Override
	public int getReviewHelpfulCount(int reviewId) {
		return dao.getReviewHelpfulCount(reviewId);
	}
}