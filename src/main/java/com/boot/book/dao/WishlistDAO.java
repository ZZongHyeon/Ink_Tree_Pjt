package com.boot.book.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.boot.book.dto.BookDTO;
import com.boot.z_page.criteria.WishlistCriteriaDTO;

@Repository
public class WishlistDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	 // 이미 위시리스트에 있는지 확인
    public boolean isAlreadyInWishlist(int userNumber, int bookNumber) {
        try {
            System.out.println("isAlreadyInWishlist 호출됨 - userNumber: " + userNumber + ", bookNumber: " + bookNumber);
            String sql = "SELECT COUNT(*) FROM BOOK_WISHLIST WHERE userNumber = ? AND bookNumber = ?";
            Integer count = jdbcTemplate.queryForObject(sql, Integer.class, userNumber, bookNumber);
            System.out.println("isAlreadyInWishlist 결과: " + count);
            return count != null && count > 0;
        } catch (Exception e) {
            System.err.println("isAlreadyInWishlist 오류: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 위시리스트에 추가
    public void addToWishlist(int userNumber, int bookNumber) {
        try {
            System.out.println("addToWishlist 호출됨 - userNumber: " + userNumber + ", bookNumber: " + bookNumber);
            String sql = "INSERT INTO BOOK_WISHLIST (userNumber, bookNumber) VALUES (?, ?)";
            int result = jdbcTemplate.update(sql, userNumber, bookNumber);
            System.out.println("위시리스트 추가 결과: " + result + "행 삽입됨");
        } catch (Exception e) {
            System.err.println("addToWishlist 오류: " + e.getMessage());
            e.printStackTrace();
            throw e; // 상위로 예외 전파
        }
    }

    // 위시리스트에서 삭제
    public void removeFromWishlist(int userNumber, int bookNumber) {
        try {
            System.out.println("removeFromWishlist 호출됨 - userNumber: " + userNumber + ", bookNumber: " + bookNumber);
            String sql = "DELETE FROM BOOK_WISHLIST WHERE userNumber = ? AND bookNumber = ?";
            int result = jdbcTemplate.update(sql, userNumber, bookNumber);
            System.out.println("위시리스트 삭제 결과: " + result + "행 삭제됨");
        } catch (Exception e) {
            System.err.println("removeFromWishlist 오류: " + e.getMessage());
            e.printStackTrace();
            throw e; // 상위로 예외 전파
        }
    }

    public List<BookDTO> getWishlist(WishlistCriteriaDTO criteria, HashMap<String, Object> param) {
        int userNumber = (int) param.get("userNumber");
        int startRow = criteria.getStartRow();
        int amount = criteria.getAmount();

        try {
            System.out.println("WishlistDAO - getWishlist 호출됨");
            System.out.println("userNumber: " + userNumber);
            System.out.println("startRow: " + startRow);
            System.out.println("amount: " + amount);
            System.out.println("페이지 크기: " + criteria.getAmount());
            
            // ROW_NUMBER() OVER()를 사용한 Oracle 페이징 쿼리
            String sql = """
                SELECT * FROM (
                    SELECT b.bookNumber, b.bookTitle, b.bookWrite, b.bookPub, b.bookMajorCategory, 
                           ROW_NUMBER() OVER (ORDER BY w.bookNumber DESC) as rn
                    FROM BOOKINFO b
                    JOIN BOOK_WISHLIST w ON b.bookNumber = w.bookNumber
                    WHERE w.userNumber = ?
                )
                WHERE rn BETWEEN ? AND ?
            """;

            List<BookDTO> result = jdbcTemplate.query(sql, (rs, rowNum) -> {
                BookDTO book = new BookDTO();
                book.setBookNumber(rs.getInt("bookNumber"));
                book.setBookTitle(rs.getString("bookTitle"));
                book.setBookWrite(rs.getString("bookWrite"));
                book.setBookPub(rs.getString("bookPub"));
                book.setBookMajorCategory(rs.getString("bookMajorCategory"));
                return book;
            }, userNumber, startRow + 1, startRow + amount);

            System.out.println("쿼리 결과 개수: " + (result != null ? result.size() : "null"));
            return result;
        } catch (Exception e) {
            System.err.println("위시리스트 조회 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return java.util.Collections.emptyList();
        }
    }

    public int getWishlistCount(HashMap<String, Object> param) {
        int userNumber = (int) param.get("userNumber");
        System.out.println("getWishlistCount 호출 - userNumber: " + userNumber);
        
        try {
            String sql = "SELECT COUNT(*) FROM BOOK_WISHLIST WHERE userNumber = ?";
            Integer count = jdbcTemplate.queryForObject(sql, Integer.class, userNumber);
            System.out.println("위시리스트 카운트 결과: " + count);
            return count != null ? count : 0;
        } catch (Exception e) {
            System.err.println("위시리스트 카운트 조회 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }
}
