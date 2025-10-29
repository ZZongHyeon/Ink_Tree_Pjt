package com.boot.trade.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.chat.dto.ChatRoomRequest;
import com.boot.trade.dto.TradeReviewDTO;
import com.boot.trade.dto.TradeTagsDTO;

@Mapper
public interface TradeReviewDAO {

    // 해당 거래 게시글과 연결된 채팅방 사용자 조회
    List<ChatRoomRequest> getChatUser(int postId);

    // 기록에 입력
    void insertTradeRecord(@Param("postId") int postId, @Param("targetUserId") int targetUserId, @Param("userNumber")int userNumber);
    
    // 거래 완료 후 선택할 태그 목록 조회
    List<TradeTagsDTO> getTags();

    // 사용자가 등록한 태그 저장
    int insertReviewTags(@Param("postId") int postId,
            @Param("tradeRecordId") int tradeRecordId,
            @Param("reviewerId") int reviewerId,
            @Param("revieweeId") int revieweeId,
            @Param("tagCodes") List<Integer> tagCodes);

    // 마이페이지 – 내가 받은 모든 태그 통계
    List<TradeReviewDTO> getUserTagStatistics(int userId);

    // 게시글 상세페이지 – Top N 태그
    List<TradeReviewDTO> getTopTags(@Param("userId") int userId, @Param("limit") int limit);

    // 태그 중복 등록 방지 (한 거래에서 한 번만)
    int alreadyReviewed(@Param("tradeRecordId") int tradeRecordId, @Param("reviewerId") int reviewerId);

    // 거래 완료 상태 체크
    int isTradeCompleted(int tradeRecordId);
}
