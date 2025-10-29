package com.boot.trade.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TradeTagsDTO {
	private int tagCode;
	private String tagType;
	private String tagLabel;
	private String tagExplan;
}
