package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.dto.BookDTO;
import com.boot.dto.BookRecordDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.ReviewDTO;
import com.boot.dto.SearchBookCriteriaDTO;
import com.boot.dto.UserBookBorrowingCriteriaDTO;

public interface BookService {
	public void insertBook(HashMap<String, String> param);

	public void updateBook(HashMap<String, String> param);

	public ArrayList<BookDTO> mainBookInfo();

	public int getSearchBookTotalCount(SearchBookCriteriaDTO searchBookCriteriaDTO, String majorCategory,
			String subCategory);

	public ArrayList<BookDTO> searchBookInfo(SearchBookCriteriaDTO criteria, String majorCategory, String subCategory);

	public BookDTO bookDetailInfo(HashMap<String, String> param);

	public void bookBorrow(HashMap<String, String> param);

	public void bookReturn(HashMap<String, String> param);

	public ArrayList<BookRecordDTO> bookBorrowed(
			@Param("criteria") UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO,
			@Param("param") HashMap<String, String> param);

	public ArrayList<BookRecordDTO> bookRecord(
			@Param("criteria") UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO,
			@Param("param") HashMap<String, String> param);

	public void deleteBook(HashMap<String, String> param);

	public int getBorrowedTotalCount(@Param("criteria") UserBookBorrowingCriteriaDTO criteria,
			@Param("userNumber") int userNumber);

	public int getRecordTotalCount(@Param("criteria") UserBookBorrowingCriteriaDTO criteria,
			@Param("userNumber") int userNumber);

	public int checkReview(HashMap<String, String> param);

	public ArrayList<ReviewDTO> getReview(@Param("criteria") NoticeCriteriaDTO criteria,
			@Param("param") HashMap<String, String> param);

	public int getReviewCount(@Param("criteria") NoticeCriteriaDTO criteria,
			@Param("param") HashMap<String, String> param);

	public int insertReview(HashMap<String, String> param);

	public int updateReview(ReviewDTO reviewDTO);

	public int deleteReview(ReviewDTO reviewDTO);

	public ReviewDTO getReviewById(int reviewId);

	// 도서별 리뷰 통계 조회 (페이징 없이 모든 리뷰 가져오기)
	public ArrayList<ReviewDTO> getAllReviewsByBookNumber(int bookNumber);

	// 리뷰 도움됨 추가
	boolean addReviewHelpful(int reviewId, int userNumber);

	// 리뷰 도움됨 취소
	boolean removeReviewHelpful(int reviewId, int userNumber);

	// 리뷰 도움됨 여부 확인
	boolean checkReviewHelpful(int reviewId, int userNumber);

	// 리뷰별 도움됨 개수 조회
	int getReviewHelpfulCount(int reviewId);

	public ArrayList<BookDTO> Top5Recommend(HashMap<String, String> param);

	public ArrayList<BookDTO> Top3Borrow();

	public ArrayList<BookDTO> Top5Random(HashMap<String, String> param);

	public String CategoryNum(HashMap<String, String> param);

}
