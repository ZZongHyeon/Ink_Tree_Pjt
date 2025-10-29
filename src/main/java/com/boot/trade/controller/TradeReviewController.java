package com.boot.trade.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.chat.dto.ChatRoomRequest;
import com.boot.trade.dto.TradeTagsDTO;
import com.boot.trade.service.TradeReviewService;

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
	
	@PostMapping("/record/insert")
	@ResponseBody
	public Map<String, Object> insertTradeRecord(int postID, int buyerNumber) {
	    Map<String, Object> map = new HashMap<>();

	    try {
	        service.insertTradeRecord(postID, buyerNumber);
	        map.put("success", true);
	    } catch(Exception e) {
	        map.put("success", false);
	    }

	    return map;
	    
	    /**
	     * 
	     * TODO::
	     * 기록 저장, 태그 20개 불러오기, 선택(3개), 패스하면 그냥 저장, 
	     */
	}
	
	@PostMapping("/getTags/data")
	@ResponseBody
	public List<TradeTagsDTO> getTags() {
		return service.getTags();
	}
}
