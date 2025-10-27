package com.boot.trade.service;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.z_page.criteria.SearchBookCriteriaDTO;
import com.boot.trade.dao.TradeFavoriteDAO;
import com.boot.trade.dto.TradeFavoriteDTO;

@Service
public class TradeFavoriteServiceImpl implements TradeFavoriteService{
	@Autowired
	private SqlSession sqlSession;
	private TradeFavoriteDAO dao;

	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(TradeFavoriteDAO.class);
	}
	
	@Override
	public boolean addFavorite(TradeFavoriteDTO tradeFavoriteDTO) {
		return dao.addFavorite(tradeFavoriteDTO) == 1;
	}

	@Override
	public boolean removeFavorite(TradeFavoriteDTO tradeFavoriteDTO) {
		return dao.removeFavorite(tradeFavoriteDTO) == 1;
	}

	@Override
	public List<TradeFavoriteDTO> getFavoriteWithPaging(SearchBookCriteriaDTO criteriaDTO) {
		return dao.getFavoriteWithPaging(criteriaDTO);
	}

	@Override
	public int getTotalCount(SearchBookCriteriaDTO criteriaDTO) {
		return dao.getTotalCount(criteriaDTO);
	}

	@Override
	public boolean checkFavorite(TradeFavoriteDTO tradeFavoriteDTO) {
		return dao.checkFavorite(tradeFavoriteDTO) == 1;
	}

}
