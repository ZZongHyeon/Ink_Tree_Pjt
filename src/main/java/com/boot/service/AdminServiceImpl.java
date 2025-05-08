package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.NoticeDAO;
import com.boot.dto.CriteriaDTO;
import com.boot.dto.NoticeCriteriaDTO;
import com.boot.dto.NoticeDTO;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void NoticeWrite(HashMap<String, String> param) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.NoticeWrite(param);
	}

	@Override
	public ArrayList<NoticeDTO> NoticeView(NoticeCriteriaDTO noticeCriteriaDTO) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		ArrayList<NoticeDTO> list = dao.NoticeView(noticeCriteriaDTO);
		return list;
	}

	@Override
	public NoticeDTO NoticeDetailView(HashMap<String, String> param) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.NoticeHit(param);
		NoticeDTO dto = dao.NoticeDetailView(param);
		return dto;
	}

	@Override
	public void NoticeModify(HashMap<String, String> param) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.NoticeModify(param);
	}

	@Override
	public void NoticeDelete(HashMap<String, String> param) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.NoticeDelete(param);
	}

	@Override
	public int getTotalCount(NoticeCriteriaDTO noticeCriteriaDTO) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		int total = dao.getTotalCount(noticeCriteriaDTO);
		return total;
	}
}
