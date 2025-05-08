package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.boot.dto.BookDTO;
import com.boot.dto.BookRecordDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.PageDTO;
import com.boot.dto.ReviewDTO;
import com.boot.dto.SearchBookCriteriaDTO;
import com.boot.dto.UserBookBorrowingCriteriaDTO;
import com.boot.dto.UserDTO;
import com.boot.service.BoardCommentServiceImpl;
import com.boot.service.BookService;
import com.boot.service.UtilService;


@Controller
public class BookController {

    private final BoardCommentServiceImpl boardCommentServiceImpl;

	@Autowired
	private BookService service;
	@Autowired
	private UtilService utilService;

    BookController(BoardCommentServiceImpl boardCommentServiceImpl) {
        this.boardCommentServiceImpl = boardCommentServiceImpl;
    }
	
    

    
//	@PostMapping("/checkReview")
//	public ResponseEntity<Map<String, Object>> checkReview(@RequestParam HashMap<String, String> param){
//		Map<String, Object> response = new HashMap<>();
//	    // 이미 리뷰를 작성했는지 확인
//	    if (service.checkReview(param) == 1) {
//	        response.put("success", false);
//	        response.put("message", "이미 이 도서에 대한 리뷰를 작성하셨습니다.");
//	        return ResponseEntity.status(HttpStatus.CONFLICT).body(response);
//	    }
//	}
    
	@PostMapping("/insertReview")
	public ResponseEntity<Map<String, Object>> insertReview(
	        @RequestParam HashMap<String, String> param,
	        HttpSession session) {
	    
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	    	
	    	System.out.println("전달된 파라미터: " + param);

	        // 로그인 확인
	        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
	        
	        if (!param.containsKey("reviewRating") || param.get("reviewRating").trim().isEmpty()) {
	            response.put("success", false);
	            response.put("message", "평점을 선택해주세요.");
	            return ResponseEntity.badRequest().body(response);
	        }
	        
	        if (!param.containsKey("reviewTitle") || param.get("reviewTitle").trim().isEmpty()) {
	            response.put("success", false);
	            response.put("message", "제목을 입력해주세요.");
	            return ResponseEntity.badRequest().body(response);
	        }
	        
	        if (!param.containsKey("reviewContent") || param.get("reviewContent").trim().isEmpty()) {
	            response.put("success", false);
	            response.put("message", "내용을 입력해주세요.");
	            return ResponseEntity.badRequest().body(response);
	        }
	        
	        
	        // 사용자 정보 추가
	        param.put("userNumber", String.valueOf(loginUser.getUserNumber()));
	        
		    // 이미 리뷰를 작성했는지 확인
//		    if (service.checkReview(param) == 1) {
//		        response.put("success", false);
//		        response.put("message", "이미 이 도서에 대한 리뷰를 작성하셨습니다.");
//		        return ResponseEntity.status(HttpStatus.CONFLICT).body(response);
//		    }
	        // 리뷰 등록
	        int result = service.insertReview(param);
	        
	        if (result > 0) {
	            response.put("success", true);
	            response.put("message", "리뷰가 성공적으로 등록되었습니다.");
	            return ResponseEntity.ok(response);
	        } else {
	            response.put("success", false);
	            response.put("message", "리뷰 등록에 실패했습니다.");
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}

	
	@RequestMapping("/book_insert")
	public String insertBook(HttpServletRequest request, @RequestParam HashMap<String, String> param) {
		service.insertBook(param);

		return "admin_view";
	}
	
	
	@RequestMapping("/update_book")
	   public String updateBookView(@RequestParam HashMap<String, String> param, BookDTO book, Model model, HttpServletRequest request) {
	      UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");

	      if (user == null || user.getUserAdmin() != 1) {
	         return "main";
	      }
	      book = service.bookDetailInfo(param);
	      model.addAttribute("book", book);
	      return "book_update";
	   }

	@RequestMapping("/update_book_ok")
	public String updateBook(@RequestParam HashMap<String, String> param) {
		service.updateBook(param);
		return "main";
	}

	@RequestMapping("/book_search_view")
	public String searchBookView(
	        @ModelAttribute("searchBookCriteriaDTO") SearchBookCriteriaDTO searchBookCriteriaDTO,
	        @RequestParam(value = "majorCategory", required = false) String majorCategory,
	        @RequestParam(value = "subCategory", required = false) String subCategory,
	        Model model) {
	    
	    // amount가 0이면 기본값 설정
	    if (searchBookCriteriaDTO.getAmount() <= 0) {
	        searchBookCriteriaDTO.setAmount(10);
	    }
	    
	    // 서비스 메서드 호출
	    List<BookDTO> list = service.searchBookInfo(searchBookCriteriaDTO, majorCategory, subCategory);
	    
	    int total = service.getSearchBookTotalCount(searchBookCriteriaDTO, majorCategory, subCategory);
	    
	    model.addAttribute("bookList", list);
	    model.addAttribute("total", total);
	    model.addAttribute("pageMaker", new PageDTO(total, searchBookCriteriaDTO));
	    
	    return "book_search";
	}

	@RequestMapping("/book_detail")
	public String bookDetail(NoticeCriteriaDTO noticeCriteriaDTO, @RequestParam HashMap<String, String> param, Model model) {
		System.out.println("param => " + param);
		BookDTO dto = service.bookDetailInfo(param);
		
		int total = service.getReviewCount(noticeCriteriaDTO, param);
		
		List<ReviewDTO> list = service.getReview(noticeCriteriaDTO, param);
		
		model.addAttribute("book", dto);
		model.addAttribute("reviewList", list);
	    model.addAttribute("total", total);
	    model.addAttribute("pageMaker", new PageDTO(total, noticeCriteriaDTO));
		return "book_detail";
	}

	@RequestMapping("/book_delete")
	   public ResponseEntity<String> bookDelete(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
	      UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");

	      if (user == null || user.getUserAdmin() != 1) {
	         return ResponseEntity.status(HttpStatus.CONFLICT).body("noUser");
	      }

	      param.put("userNumber", String.valueOf(user.getUserNumber()));

	      try {
	         service.deleteBook(param);
	         return ResponseEntity.ok("successDelete");
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("unexpectedServerError");
	      }
	   }
	
	@RequestMapping("/book_borrow")
	public ResponseEntity<String> bookBorrow(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");

		if (user == null) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("noUser");
		}

		param.put("userNumber", String.valueOf(user.getUserNumber()));

		try {
			service.bookBorrow(param);
			return ResponseEntity.ok("successBorrow");
		} catch (Exception e) {
			e.printStackTrace();
			String msg = (e.getMessage() != null) ? e.getMessage() : "";

			if (msg.contains("ORA-20001")) {
				return ResponseEntity.status(HttpStatus.CONFLICT).body("userInfoError");
			} else if (msg.contains("ORA-20002")) {
				return ResponseEntity.status(HttpStatus.CONFLICT).body("userCanBorrowOver");
			} else if (msg.contains("ORA-20004")) {
				return ResponseEntity.status(HttpStatus.CONFLICT).body("alreadyBorrow");
			}

			// ❗ 조건 다 안 맞을 때를 위한 기본 응답
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("unexpectedServerError");
		}
	}

	@RequestMapping("/book_return")
	public String bookReturn(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
		if (user == null) {
			return "redirect:main"; // 로그인 안 되어 있으면 메인으로 이동
		}
		int userNumber = user.getUserNumber();

		param.put("userNumber", String.valueOf(userNumber)); // 사용자 번호를 param에 추가
		try {
			service.bookReturn(param);
		} catch (Exception e) {
			e.printStackTrace(); // 개발 시 에러 확인용
			// db에서 발생한 사용자 정의 예외 처리

			String message = e.getMessage();
			if (message != null && message.contains("ORA-20004")) {
				model.addAttribute("return_errorMsg", "대출 정보가 존재하지 않아 반납할 수 없습니다.");
			} else {
				model.addAttribute("return_errorMsg", "알 수 없는 오류: " + message);
			}
			return "mypage";
		}
		model.addAttribute("return_successMSG", "도서 반납이 성공적으로 완료되었습니다!");
		return "mypage";
	}
	
	@RequestMapping("/user_book_recommend")
	public String bookRecomm() {
		return "user_book_recommend";
	}
	@RequestMapping("/user_book_borrowing")
	public String bookBorrow(HttpServletRequest request, 
	                         @RequestParam HashMap<String, String> param, 
	                         Model model, 
	                         UserBookBorrowingCriteriaDTO userBookBorrowingCriteriaDTO,
	                         @RequestParam(required = false) String activeTab) {
	    UserDTO dto = (UserDTO) request.getSession().getAttribute("loginUser");

	    param.put("userNumber", String.valueOf(dto.getUserNumber()));
	    
	    // 대출 중인 도서 목록을 가져오기 위한 별도의 DTO 생성
	    // 페이지네이션 없이 모든 대출 중인 도서를 가져오기 위함
	    UserBookBorrowingCriteriaDTO borrowedCriteria = new UserBookBorrowingCriteriaDTO();
	    borrowedCriteria.setPageNum(1);  // 항상 첫 페이지 (전체 데이터)
	    borrowedCriteria.setAmount(100); // 충분히 큰 수로 설정하여 모든 대출 중인 도서를 가져옴
	    
	    // 대출 중인 도서는 항상 모두 가져옴 (페이지네이션 없이)
	    ArrayList<BookRecordDTO> bookBorrowedList = service.bookBorrowed(borrowedCriteria, param);
	    
	    // 대출 기록은 페이지네이션 적용
	    ArrayList<BookRecordDTO> bookBorrowList = service.bookRecord(userBookBorrowingCriteriaDTO, param);
	    
	    int userBorrowedBooks = utilService.getUserBorrowed(param);
	    int userRecord = utilService.getUserRecord(param);
	    int userOver = utilService.getUserOver(param);
	    int userRecordCount = utilService.getBookRecordCount(param);
	    
	    model.addAttribute("bookBorrowedList", bookBorrowedList);
	    model.addAttribute("bookBorrowList", bookBorrowList);
	    model.addAttribute("userBorrowedBooks", userBorrowedBooks);
	    model.addAttribute("userRecord", userRecord);
	    model.addAttribute("userOver", userOver);
	    model.addAttribute("userRecordCount", userRecordCount);
	    model.addAttribute("currentPage", "user_book_borrowing"); // 헤더 식별용
	    
	    // 활성 탭 정보 모델에 추가 (없으면 기본값은 'borrowed')
	    model.addAttribute("activeTab", activeTab != null ? activeTab : "borrowed");
	    
	    System.out.println("test : " + param.get("userNumber"));
	    System.out.println("prarma => " + param);
	    
	    // 대출 기록에 대한 페이지네이션 정보만 설정
	    int recordTotal = service.getRecordTotalCount(userBookBorrowingCriteriaDTO, Integer.parseInt(param.get("userNumber")));
	    model.addAttribute("pageMaker", new PageDTO(recordTotal, userBookBorrowingCriteriaDTO));
	    
	    return "user_book_borrowing";
	}
}
