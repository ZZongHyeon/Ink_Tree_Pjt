package com.boot.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BookDAO;
import com.boot.dao.NoticeDAO;
import com.boot.dao.UserDAO;
import com.boot.dto.BookDTO;
import com.boot.dto.BookRecordDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.ReviewDTO;
import com.boot.dto.SearchBookCriteriaDTO;
import com.boot.dto.UserBookBorrowingCriteriaDTO;
import com.boot.dto.UserDTO;



@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession session;

	@Override
	public void insertBook(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

		if (loginUser.getUserAdmin() == 1) {
			dao.insertBook(param);
		} else {
			System.out.println("Not Admin access");
		}
	}

	@Override
	public void updateBook(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dao.updateBook(param);
	}

	@Override
	public ArrayList<BookDTO> mainBookInfo() {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		ArrayList<BookDTO> list = dao.mainBookInfo();
		return list;
	}

	
	@Override
	public int getSearchBookTotalCount(SearchBookCriteriaDTO criteria, String majorCategory, String subCategory) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
	    return dao.getSearchBookTotalCount(criteria, majorCategory, subCategory);
	}
	
	
	@Override
	public ArrayList<BookDTO> searchBookInfo(SearchBookCriteriaDTO criteria, String majorCategory, String subCategory) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
	    return dao.searchBookInfo(criteria, majorCategory, subCategory);
	}

	@Override
	public BookDTO bookDetailInfo(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		BookDTO dto = dao.bookDetailInfo(param);
		return dto;
	}

	@Override
	public void bookBorrow(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dao.bookBorrow(param);
	}

	@Override
	public void bookReturn(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dao.bookReturn(param);
	}

	@Override
    public ArrayList<BookRecordDTO> bookBorrowed(
        UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO, 
        HashMap<String, String> param
    ) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        return dao.bookBorrowed(userBookBorrowingCriteriaDTO, param);
    }
    
    @Override
    public ArrayList<BookRecordDTO> bookRecord(
        UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO, 
        HashMap<String, String> param
    ) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        return dao.bookRecord(userBookBorrowingCriteriaDTO, param);
    }

	@Override
	public void deleteBook(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		dao.deleteBook(param);

	}

	@Override
	public int getBorrowedTotalCount(UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO, int userNumber) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		int total = dao.getBorrowedTotalCount(userBookBorrowingCriteriaDTO, userNumber);
		return total;
	}

	@Override
	public int getRecordTotalCount(UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO, int userNumber) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		int total = dao.getRecordTotalCount(userBookBorrowingCriteriaDTO, userNumber);
		return total;
	}

	@Override
	public int insertReview(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		return dao.insertReview(param);
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		return dao.updateReview(reviewDTO);
	}

	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		return dao.deleteReview(reviewDTO);
	}

	@Override
	public ArrayList<ReviewDTO> getReview(NoticeCriteriaDTO criteria, HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        return dao.getReview(criteria, param);
	}

	@Override
	public int getReviewCount(NoticeCriteriaDTO criteria, HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		int total = dao.getReviewCount(criteria, param);
		return total;
	}

	@Override
	public int checkReview(HashMap<String, String> param) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		return dao.checkReview(param);
	}
	@Override
	public ReviewDTO getReviewById(int reviewId) {
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		return dao.getReviewById(reviewId);
	}
}
