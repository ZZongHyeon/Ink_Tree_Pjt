package com.boot.trade.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.chat.dto.ChatRoomRequest;
import com.boot.trade.service.TradeReviewService;

@Controller
@RequestMapping("/trade/review")
public class TradeReviewController {
	@Autowired
	private TradeReviewService service;
	
	@GetMapping("/getChatUser")
	@ResponseBody
	public List<ChatRoomRequest> getChatUser(@RequestParam int postID) {
		System.out.println("test : "+ service.getChatUser(postID));
		System.out.println("test : "+ postID);
	    return service.getChatUser(postID);
	}
}
