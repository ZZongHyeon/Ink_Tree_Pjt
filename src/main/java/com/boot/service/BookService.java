package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boot.dto.BookDTO;
import com.boot.dto.BookRecordDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.SearchBookCriteriaDTO;
import com.boot.dto.UserBookBorrowingCriteriaDTO;

public interface BookService {
	public void insertBook(HashMap<String, String> param);

	public void updateBook(HashMap<String, String> param);

	public ArrayList<BookDTO> mainBookInfo();

	public int getSearchBookTotalCount(SearchBookCriteriaDTO searchBookCriteriaDTO, String majorCategory, String subCategory);

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
}
