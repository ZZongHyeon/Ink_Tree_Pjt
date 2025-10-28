package com.boot.trade.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TradeReviewDTO {
	private int tagId;
	private int tradeRecordId;
	private int reviewerId;
	private int revieweeId;
	private String tagType;
	private String tagLabel;
	private String createdAt;
	
}
