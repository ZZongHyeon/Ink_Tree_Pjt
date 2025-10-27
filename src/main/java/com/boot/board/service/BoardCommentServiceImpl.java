package com.boot.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.board.dao.BoardCommentDAO;
import com.boot.board.dto.BoardCommentDTO;
import com.boot.z_page.criteria.CriteriaDTO;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {
	@Autowired
	private SqlSession sqlSession;
	private BoardCommentDAO dao;

	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(BoardCommentDAO.class);
	}
	
	@Override
	public ArrayList<BoardCommentDTO> bcView(HashMap<String, String> param, CriteriaDTO criteriaDTO) {
		ArrayList<BoardCommentDTO> list = dao.bcView(param, criteriaDTO);
		return list;
	}

	@Override
	public void bcWrite(HashMap<String, String> param) {
		dao.bcWrite(param);
	}

	@Override
	public void bcModify(HashMap<String, String> param) {
		dao.bcModify(param);
	}

	@Override
	public void bcDelete(HashMap<String, String> param) {
		dao.bcDelete(param);
	}

	@Override
	public int getTotalCount(HashMap<String, String> param) {
		int total = dao.getTotalCount(param);
		return total;
	}

	@Override
	public int getAllCount(HashMap<String, String> param) {
		int total = dao.getAllCount(param);
		return total;
	}
}
