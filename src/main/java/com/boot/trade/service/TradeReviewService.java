package com.boot.trade.service;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.chat.dto.ChatRoomRequest;
import com.boot.trade.dao.TradePostDAO;
import com.boot.trade.dao.TradeReviewDAO;
import com.boot.trade.dto.TradeReviewDTO;
import com.boot.trade.dto.TradeTagsDTO;

@Service
public class TradeReviewService {
	@Autowired
	private SqlSession sqlSession;
	private TradeReviewDAO dao;
	
	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(TradeReviewDAO.class);
	}
	
	// 해당 거래의 채팅방 메세지룸을 보여줌
	public List<ChatRoomRequest> getChatUser(int postId){
		return dao.getChatUser(postId);
	}
	
	// 거래 완료 후 보여질 태그들
	public List<TradeTagsDTO> getTags(){
    	return null;
    }

    // 입력한 태그들
	public void insertTag(List<TradeTagsDTO> tags) {
	}
    
    // 마이페이지에 보여질 내 전체 태그들
	public List<TradeReviewDTO> getUserTagStatistics(int userId) {
		return null;
	}
    
    // 디테일뷰에 보여질 태그 탑3
	public List<TradeReviewDTO> getTopTags(int userId, int limit) {
		return null;
	}
    
    // 중복방지 하나에 하나만
	public boolean alreadyReviewed(int tradeRecordId, int reviewerId) {
		return false;
	}
    
    // 완료된 거래인지 상태체크
	public boolean isTradeCompleted(int tradeRecordId) {
		return false;
	}
    
    // 알림
//    void notifyUserAboutTagReview(int receiverId, TagNotificationPayload payload);
    // 태그 상세로그(활동이력)
//    List<TradeTagHistoryDTO> getTagHistory(int userId);
    // 관리자용 부정 태그가 급증하면 조치필요
//    List<TagTrendDTO> getGlobalTagTrend();

    
}
