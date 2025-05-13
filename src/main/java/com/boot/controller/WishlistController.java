//package com.boot.controller;
//
//import java.util.HashMap;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.boot.dao.WishlistDAO;
//import com.boot.dto.BookDTO;
//import com.boot.dto.PageDTO;
//import com.boot.dto.UserDTO;
//import com.boot.dto.WishlistCriteriaDTO;
//import com.boot.service.WishlistServiceImpl;
//
//@Controller
//@RequestMapping("/wishlist")
//public class WishlistController {
//
//	@Autowired
//	private WishlistServiceImpl wishlistService;
//	
//	@Autowired
//	private WishlistDAO wishlistDAO;
//
//	@PostMapping(value = "/add_wishlist", produces = "text/plain;charset=UTF-8")
//	public @ResponseBody String addToWishlist(@RequestParam("bookNumber") int bookNumber, HttpSession session) {
//		System.out.println("=== 위시리스트 추가 요청 받음 ===");
//		System.out.println("bookNumber: " + bookNumber);
//		
//		Object object = session.getAttribute("loginUser");
//		System.out.println("세션 ID: " + session.getId());
//		System.out.println("세션 사용자 존재 여부: " + (object != null ? "존재함" : "존재하지 않음"));
//		
//		if (object == null) {
//			return "Not_login";
//		}
//		
//		try {
//			int userNumber = ((UserDTO) object).getUserNumber();
//			System.out.println("userNumber: " + userNumber);
//			
//			String result = wishlistService.addWishlist(userNumber, bookNumber);
//			System.out.println("추가 결과: " + result);
//			return result;
//		} catch (Exception e) {
//			System.err.println("위시리스트 추가 중 오류 발생: " + e.getMessage());
//			e.printStackTrace();
//			return "Error";
//		}
//	}
//
//	@PostMapping(value = "/remove_wishlist", produces = "text/plain;charset=UTF-8")
//	public @ResponseBody String removeFromWishlist(@RequestParam("bookNumber") int bookNumber, HttpSession session) {
//		System.out.println("=== 위시리스트 삭제 요청 받음 ===");
//		System.out.println("bookNumber: " + bookNumber);
//		
//		Object object = session.getAttribute("loginUser");
//		System.out.println("세션 ID: " + session.getId());
//		System.out.println("세션 사용자 존재 여부: " + (object != null ? "존재함" : "존재하지 않음"));
//		
//		if (object == null) {
//			return "Not_login";
//		}
//		
//		try {
//			int userNumber = ((UserDTO) object).getUserNumber();
//			System.out.println("userNumber: " + userNumber);
//			
//			String result = wishlistService.removeWishlist(userNumber, bookNumber);
//			System.out.println("삭제 결과: " + result);
//			return result;
//		} catch (Exception e) {
//			System.err.println("위시리스트 삭제 중 오류 발생: " + e.getMessage());
//			e.printStackTrace();
//			return "Error";
//		}
//	}
//
//	@PostMapping(value = "/check_wishlist", produces = "text/plain;charset=UTF-8")
//	public @ResponseBody String checkWishlist(@RequestParam("bookNumber") int bookNumber, HttpSession session) {
//		System.out.println("=== 위시리스트 상태 확인 요청 받음 ===");
//		System.out.println("bookNumber: " + bookNumber);
//		
//		Object object = session.getAttribute("loginUser");
//		System.out.println("세션 ID: " + session.getId());
//		System.out.println("세션 사용자 존재 여부: " + (object != null ? "존재함" : "존재하지 않음"));
//		
//		if (object == null) {
//			return "Not_login";
//		}
//		
//		try {
//			int userNumber = ((UserDTO) object).getUserNumber();
//			System.out.println("userNumber: " + userNumber);
//			
//			boolean isInWishlist = wishlistDAO.isAlreadyInWishlist(userNumber, bookNumber);
//			System.out.println("위시리스트 상태 확인 결과: " + isInWishlist);
//			
//			return isInWishlist ? "in_wishlist" : "not_in_wishlist";
//		} catch (Exception e) {
//			System.err.println("위시리스트 상태 확인 중 오류 발생: " + e.getMessage());
//			e.printStackTrace();
//			return "Error";
//		}
//	}
//
//	@GetMapping("/list")
//	public String wishlistList(@RequestParam(defaultValue = "1") int page,
//                           HttpSession session, Model model) {
//    UserDTO user = (UserDTO) session.getAttribute("loginUser");
//    if (user == null) return "redirect:/loginView";
//
//    WishlistCriteriaDTO criteria = new WishlistCriteriaDTO();
//    criteria.setPage(page);
//
//    HashMap<String, Object> param = new HashMap<>();
//    param.put("userNumber", user.getUserNumber());
//
//    try {
//        List<BookDTO> wishlist = wishlistDAO.getWishlist(criteria, param);
//        int total = wishlistDAO.getWishlistCount(param);
//
//        System.out.println("위시리스트 디버그 정보 ===================");
//        System.out.println("유저 번호: " + user.getUserNumber());
//        System.out.println("위시리스트 개수: " + (wishlist != null ? wishlist.size() : "null"));
//        System.out.println("전체 개수: " + total);
//        System.out.println("======================================");
//
//        PageDTO pageMaker = new PageDTO(total, criteria);
//
//        // 로그 추가
//        System.out.println("모델에 데이터 추가:");
//        System.out.println("  wishlist: " + (wishlist != null ? "있음 (" + wishlist.size() + "개)" : "null"));
//        System.out.println("  pageMaker: " + (pageMaker != null ? "있음" : "null"));
//
//        // 모델에 데이터 추가
//        model.addAttribute("wishlist", wishlist);
//        model.addAttribute("pageMaker", pageMaker);
//        
//        // 데이터가 비어있는지 확인
//        if (wishlist == null || wishlist.isEmpty()) {
//            System.out.println("위시리스트가 비어있습니다.");
//        }
//        
//        return "book_wishlist";
//    } catch (Exception e) {
//        System.err.println("위시리스트 조회 중 오류 발생: " + e.getMessage());
//        e.printStackTrace();
//        
//        // 에러 페이지로 리다이렉트하거나 기본 빈 리스트 표시
//        model.addAttribute("wishlist", new java.util.ArrayList<BookDTO>());
//        model.addAttribute("errorMsg", "위시리스트를 불러오는 중 오류가 발생했습니다.");
//        return "book_wishlist";
//    }
//}
//
//}
