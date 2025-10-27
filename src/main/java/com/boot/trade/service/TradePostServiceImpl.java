package com.boot.trade.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.trade.dao.TradePostDAO;
import com.boot.trade.dto.TradePostDTO;
import com.boot.z_page.criteria.SearchBookCriteriaDTO;

@Service
public class TradePostServiceImpl implements TradePostService {
	@Autowired
	private SqlSession sqlSession;
	private TradePostDAO dao;

	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(TradePostDAO.class);
	}
	
	@Override
	public void tradePostWrite(HashMap<String, String> param) {
		dao.tradePostWrite(param);
	}

	@Override
	public ArrayList<TradePostDTO> tradePostView(SearchBookCriteriaDTO criteriaDTO) {
		ArrayList<TradePostDTO> list = dao.tradePostView(criteriaDTO);
		return list;
	}

	@Override
	public TradePostDTO tradePostDetailView(HashMap<String, String> param) {
		TradePostDTO dto = dao.tradePostDetailView(param);
		return dto;
	}

	@Override
	public void tradePostModify(HashMap<String, String> param) {
		dao.tradePostModify(param);
	}

	@Override
	public void tradePostDelete(HashMap<String, String> param) {
		dao.tradePostDelete(param);
	}

	@Override
	public void tradePostHit(HashMap<String, String> param) {
		dao.tradePostHit(param);
	}

	@Override
	public boolean tradePostCheckFavorite(HashMap<String, String> param) {
		return dao.tradePostCheckFavorite(param) > 0;
	}

	@Override
	public void tradePostAddFavorite(HashMap<String, String> param) {
		dao.tradePostAddFavorite(param);
	}

	@Override
	public void tradePostRemoveFavorite(HashMap<String, String> param) {
		dao.tradePostRemoveFavorite(param);
	}

	@Override
	public int getTotalCount(SearchBookCriteriaDTO criteriaDTO) {
		int total = dao.getTotalCount(criteriaDTO);
		return total;
	}

	@Override
	public void updateTradeStatus(HashMap<String, String> param) {
		dao.updateTradeStatus(param);
	}

	@Override
	public ArrayList<TradePostDTO> getAvailablePosts(HashMap<String, String> param) {
		return dao.getAvailablePosts(param);
	}

	@Override
	public int getLikeCountByPostID(int postID) {
		return dao.getLikeCountByPostID(postID);
	}

	@Override
	public int getChatCountByPostID(int postID) {
		return dao.getChatCountByPostID(postID);
	}

	@Override
	public TradePostDTO getTradePostById(Long postID) {
		return dao.getTradePostById(postID);
	}
}