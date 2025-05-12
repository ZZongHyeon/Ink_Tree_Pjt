package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.boot.dto.CriteriaDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.NoticeDTO;

public interface AdminService {
	public void NoticeWrite(HashMap<String, String> param);

	public ArrayList<NoticeDTO> NoticeView(NoticeCriteriaDTO noticeCriteriaDTO);

	public NoticeDTO NoticeDetailView(HashMap<String, String> param);

	public void NoticeModify(HashMap<String, String> param);

	public void NoticeDelete(HashMap<String, String> param);

	public int getTotalCount(NoticeCriteriaDTO noticeCriteriaDTO);

	public Map<String, Integer> getAllCategoryCounts();
}
