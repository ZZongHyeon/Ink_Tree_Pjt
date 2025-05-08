package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.CriteriaDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.NoticeDTO;

public interface NoticeDAO {
	public void NoticeWrite(HashMap<String, String> param);

	public ArrayList<NoticeDTO> NoticeView(NoticeCriteriaDTO noticeCriteriaDTO);

	public NoticeDTO NoticeDetailView(HashMap<String, String> param);

	public void NoticeModify(HashMap<String, String> param);

	public void NoticeDelete(HashMap<String, String> param);

	public void NoticeHit(HashMap<String, String> param);

	public int getTotalCount(NoticeCriteriaDTO noticeCriteriaDTO);
}
