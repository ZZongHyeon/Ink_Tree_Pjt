package com.boot.trade.controller;


import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.chat.dto.ChatRoomRequest;
import com.boot.trade.dto.TradeReviewDTO;
import com.boot.trade.dto.TradeTagsDTO;
import com.boot.trade.service.TradeReviewService;
import com.boot.user.dto.BasicUserDTO;

@Controller
@RequestMapping("/trade/review")
public class TradeReviewController {
	@Autowired
	private TradeReviewService service;
	
	@GetMapping("/getChatUser")
	@ResponseBody
	public List<ChatRoomRequest> getChatUser(@RequestParam int postID) {
	    return service.getChatUser(postID);
	}
	
	// 유저를 선택하고 거래를 끝냈을 때 기록에 삽입할 예정
	@PostMapping("/record/insert")
	@ResponseBody
	public void insertTradeRecord(@RequestParam HashMap<String, Object>param, HttpServletRequest request) {
	    BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
	    param.put("userNumber", user.getUserNumber());
	    service.insertTradeRecord(param);
	}
	
	@PostMapping("/getTags/data")
	@ResponseBody
	public List<TradeTagsDTO> getTags() {
		return service.getTags();
	}
	
    @PostMapping("/insertTag")
    @ResponseBody
    public Map<String, Object> insertTag(
            @RequestParam("postID") int postID,
            @RequestParam("targetUserId") int revieweeId,
            // jQuery $.ajax({ traditional:true })로 넘어오는 배열 바인딩
            @RequestParam(value = "tags", required = false) List<Integer> tagCodes,
            HttpServletRequest request) {

        Map<String, Object> res = new HashMap<>();
        try {
            // 로그인 사용자 (리뷰어)
            BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
            int reviewerId = user.getUserNumber();

            // 선택 없을 수도 있음
            if (tagCodes == null) tagCodes = Collections.emptyList();

            // 서버에서도 5개 제한 방어
            if (tagCodes.size() > 5) {
                tagCodes = tagCodes.subList(0, 5);
            }

            // 거래기록 확보(없으면 생성) → tradeRecordId 리턴하도록 서비스 설계
//            int tradeRecordId = service.ensureTradeRecord(postID, reviewerId, revieweeId);

            // 태그 저장 (마스터에서 타입/라벨을 조인/서브쿼리로 채우는 건 서비스/매퍼에서 처리)
            service.saveReviewTags(postID, 1, reviewerId, revieweeId, tagCodes);


            res.put("success", true);
        } catch (Exception e) {
            res.put("success", false);
            res.put("message", e.getMessage());
        }
        return res;
    }

    // model로 데이터 쏴줌
    // trade/Controller/TradePostController
//	@PostMapping("/getTopTags/data")
//	@ResponseBody
//	public List<TradeReviewDTO> getTopTags(HttpServletRequest request) {
//		BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
//		
//		return service.getTopTags(user.getUserNumber());
//	}
	
    // model로 데이터 쏴줌 
    // user/controller/UserController
//	@PostMapping("/getUserTagStatistics/data")
//	@ResponseBody
//	public List<TradeReviewDTO> getUserTagStatistics(HttpServletRequest request) {
//		BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
//		
//		return service.getUserTagStatistics(user.getUserNumber());
//	}
	
	// 완료된 거래인지 확인
	@GetMapping("/isTradeCompleted")
	@ResponseBody
	public Map<String, Object> isTradeCompleted(@RequestParam int postId) {
		Map<String, Object> response = new HashMap<>();
		int check = service.isTradeCompleted(postId);
		if(check == 1) {
			response.put("success", true);
 		} else {
			response.put("success", false);
		}
		return response;
	}
	
	// 다시 판매중 또는 예약중 일때 상태 변환
	@PostMapping("/updateReviewTags")
	@ResponseBody
	public void deleteReviewTags(@RequestParam HashMap<String, Object> param, HttpServletRequest request) {
		BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
		param.put("userNumber", user.getUserNumber());
		service.updateReviewTagsForTagTable(param);
		service.updateReviewTagsForRecordTable(param);
	}
}
