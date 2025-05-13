package com.boot.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.board.dao.NoticeDAO;
import com.boot.board.dto.NoticeDTO;
import com.boot.z_page.criteria.CriteriaDTO;
import com.boot.z_page.criteria.NoticeCriteriaDTO;



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
	@Override
    public Map<String, Integer> getAllCategoryCounts() {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
        return dao.getAllCategoryCounts();
    }
}