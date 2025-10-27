package com.boot.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.board.dao.NoticeDAO;
import com.boot.board.dto.NoticeDTO;
import com.boot.user.dto.BasicUserDTO;
import com.boot.z_page.criteria.NoticeCriteriaDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSession sqlSession;
	private NoticeDAO dao;
	
	@PostConstruct
	public void init() {
	    dao = sqlSession.getMapper(NoticeDAO.class);
	}
	
	@Autowired
	private AdminActivityLogService activityLogService;
	@Autowired
	private HttpServletRequest request;

	@Override
	public void NoticeWrite(HashMap<String, String> param) {
		dao.NoticeWrite(param);

		// 활동 로그 추가
		BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
		if (user != null) {
			String noticeTitle = param.get("noticeTitle");
			String description = "\"" + noticeTitle + "\" 공지사항이 등록되었습니다.";
			
			String actorType = user.getUserAdmin() == 1 ? "admin" : "user";
			activityLogService.createActivityLog(
				"notice_add", 
				actorType, 
				user.getUserNumber(), 
				user.getUserName(), 
				noticeTitle, 
				description
			);
		}
	}

	@Override
	public ArrayList<NoticeDTO> NoticeView(NoticeCriteriaDTO noticeCriteriaDTO) {
		ArrayList<NoticeDTO> list = dao.NoticeView(noticeCriteriaDTO);
		return list;
	}

	@Override
	public NoticeDTO NoticeDetailView(HashMap<String, String> param) {
		dao.NoticeHit(param);
		NoticeDTO dto = dao.NoticeDetailView(param);
		return dto;
	}

	@Override
	public void NoticeModify(HashMap<String, String> param) {
		dao.NoticeModify(param);

		// 활동 로그 추가
		BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
		if (user != null) {
			String noticeTitle = param.get("noticeTitle");
			String description = "\"" + noticeTitle + "\" 공지사항이 수정되었습니다.";
			
			String actorType = user.getUserAdmin() == 1 ? "admin" : "user";
			activityLogService.createActivityLog(
				"notice_modify", 
				actorType, 
				user.getUserNumber(), 
				user.getUserName(), 
				noticeTitle, 
				description
			);
		}
	}

	@Override
	public void NoticeDelete(HashMap<String, String> param) {
		// 공지사항 정보 조회
		NoticeDTO notice = dao.NoticeDetailView(param);
		
		// 공지사항 삭제
		dao.NoticeDelete(param);
		
		// 활동 로그 추가
		BasicUserDTO user = (BasicUserDTO) request.getAttribute("user");
		if (user != null && notice != null) {
			String noticeTitle = notice.getNoticeTitle();
			String description = "\"" + noticeTitle + "\" 공지사항이 삭제되었습니다.";
			
			String actorType = user.getUserAdmin() == 1 ? "admin" : "user";
			activityLogService.createActivityLog(
				"notice_delete", 
				actorType, 
				user.getUserNumber(), 
				user.getUserName(), 
				noticeTitle, 
				description
			);
		}
	}

	@Override
	public int getTotalCount(NoticeCriteriaDTO noticeCriteriaDTO) {
		int total = dao.getTotalCount(noticeCriteriaDTO);
		return total;
	}
	@Override
    public Map<String, Integer> getAllCategoryCounts() {
        return dao.getAllCategoryCounts();
    }
}
