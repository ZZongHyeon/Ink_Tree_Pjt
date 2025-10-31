package com.boot.trade.service;

import java.util.HashMap;
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
	
	// 기록에 입력
	public void insertTradeRecord(HashMap<String, Object>param) {
	    dao.insertTradeRecord(param);
	    System.out.println("all : "+ param);
	    System.out.println("postId : "+ param.get("postId"));
	    System.out.println("buyerNumber : "+ param.get("buyerNumber"));
	    System.out.println("userNumber : "+ param.get("userNumber"));
	}

	// 거래 완료 후 보여질 태그들
	public List<TradeTagsDTO> getTags(){
    	return dao.getTags();
    }

    // 입력한 태그들
    public void saveReviewTags(int postId, int tradeRecordId, int reviewerId, int revieweeId, List<Integer> tagCodes) {
        if (tagCodes == null || tagCodes.isEmpty()) return;
        if (tagCodes.size() > 5) tagCodes = tagCodes.subList(0, 5);
        dao.insertReviewTags(postId, tradeRecordId, reviewerId, revieweeId, tagCodes);
    }
    
    // 디테일뷰에 보여질 태그 탑3
	public List<TradeReviewDTO> getTopTags(int userNumber) {
		return dao.getTopTags(userNumber);
	}
	
    // 마이페이지에 보여질 내 전체 태그들
	public List<TradeReviewDTO> getUserTagStatistics(int userNumber) {
		return dao.getUserTagStatistics(userNumber);
	}
    
    // 중복방지 하나에 하나만
	public int alreadyReviewed(HashMap<String, String> param) {
		return dao.alreadyReviewed(param);
	}
    
    // 다시 판매중으로 바꿀 때 태그 상태 업데이트
    public int deleteReviewTags(HashMap<String, String> param) {
    	return dao.deleteReviewTags(param);
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
