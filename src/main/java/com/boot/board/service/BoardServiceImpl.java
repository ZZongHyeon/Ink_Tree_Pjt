package com.boot.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.board.dao.BoardDAO;
import com.boot.board.dto.BoardDTO;
import com.boot.z_page.criteria.CriteriaDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSession sqlSession;
	private BoardDAO dao;
	
	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(BoardDAO.class);
	}

	@Override
	public void boardWrite(HashMap<String, String> param) {
		dao.boardWrite(param);
	}

	@Override
	public ArrayList<BoardDTO> boardView(CriteriaDTO criteriaDTO) {
		ArrayList<BoardDTO> list = dao.boardView(criteriaDTO);
		return list;
	}

	@Override
	public BoardDTO boardDetailView(HashMap<String, String> param) {
		BoardDTO dto = dao.boardDetailView(param);
		return dto;
	}

	@Override
	public void boardModify(HashMap<String, String> param) {
		dao.boardModify(param);

	}

	@Override
	public void boardDelete(HashMap<String, String> param) {
		dao.boardDelete(param);
	}

	@Override
	public boolean boardHasLiked(HashMap<String, String> param) {
		return dao.boardCheckLiked(param) > 0;
	}

	@Override
	public int boardAddLike(HashMap<String, String> param) {
		dao.boardAddLike(param);
		dao.boardIncrementLike(param);
		return dao.boardgetLike(param);
	}

	@Override
	public int getTotalCount(CriteriaDTO criteriaDTO) {
		int total = dao.getTotalCount(criteriaDTO);
		return total;
	}

	@Override
	public void boardHit(HashMap<String, String> param) {
		dao.boardHit(param);
		
	}

	// BoardServiceImpl.java에 추가
	@Override
	public void boardRemoveLike(HashMap<String, String> param) {
	    // 좋아요 테이블에서 해당 레코드 삭제
		dao.boardRemoveLike(param);
	    // 게시글의 좋아요 수 감소
		dao.boardDecrementLike(param);
	}

	@Override
    public int getCommentCountByBoardNumber(int boardNumber) {
        return dao.getCommentCountByBoardNumber(boardNumber);
    }

}
