package com.boot.book.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.book.dao.WishlistDAO;
import com.boot.book.dto.BookDTO;
import com.boot.z_page.criteria.WishlistCriteriaDTO;

@Service
public class WishlistServiceImpl implements WishlistService {
	@Autowired
	private WishlistDAO wishlistDao;

	@Override
	public String addWishlist(int userNumber, int bookNumber) {
		try {

			if (wishlistDao.isAlreadyInWishlist(userNumber, bookNumber)) {
				return "already";
			}

			wishlistDao.addToWishlist(userNumber, bookNumber);
			return "Success";
		} catch (Exception e) {
			System.err.println("위시리스트 추가 서비스 오류: " + e.getMessage());
			e.printStackTrace();
			return "Error";
		}
	}

	@Override
	public List<BookDTO> Wishlist(int userNumber, int page) {
		WishlistCriteriaDTO criteria = new WishlistCriteriaDTO();
		criteria.setPage(page);
		HashMap<String, Object> param = new HashMap<>();
		param.put("userNumber", userNumber);
		return wishlistDao.getWishlist(criteria, param);
	}

	@Override
	public int WishlistCount(int userNumber) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("userNumber", userNumber);
		return wishlistDao.getWishlistCount(param);
	}

	@Override
	public String removeWishlist(int userNumber, int bookNumber) {
		try {

			boolean exists = wishlistDao.isAlreadyInWishlist(userNumber, bookNumber);
			if (!exists) {
				return "not_exists";
			}

			wishlistDao.removeFromWishlist(userNumber, bookNumber);
			return "Success";
		} catch (Exception e) {
			System.err.println("위시리스트 삭제 서비스 오류: " + e.getMessage());
			e.printStackTrace();
			return "Error";
		}
	}
}
