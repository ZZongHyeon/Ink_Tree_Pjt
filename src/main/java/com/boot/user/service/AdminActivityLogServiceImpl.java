package com.boot.user.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.user.dao.AdminActivityLogDAO;
import com.boot.user.dto.AdminActivityLogDTO;
import com.boot.z_page.criteria.AdminActivityLogCriteriaDTO;



@Service
public class AdminActivityLogServiceImpl implements AdminActivityLogService {
    
    @Autowired
    private SqlSession sqlSession;
    private AdminActivityLogDAO dao;
    
    @PostConstruct
    public void init() {
        dao = sqlSession.getMapper(AdminActivityLogDAO.class);
    }
    
    @Override
    public void createActivityLog(AdminActivityLogDTO log) {
        
        // 로그 시간이 설정되지 않았으면 현재 시간 설정
        if (log.getLogDate() == null) {
            log.setLogDate(LocalDateTime.now());
        }
        
        try {
            dao.insertActivityLog(log);
        } catch (Exception e) {
            // 오류 발생 시 로그만 기록하고 예외는 삼킴 (사용자 흐름에 영향 없도록)
            e.printStackTrace();
        }
    }
    
    @Override
    public void createActivityLog(String activityType, String actorType, int actorId, 
                                 String actorName, String targetName, String description) {
    	AdminActivityLogDTO log = new AdminActivityLogDTO();
        log.setActivityType(activityType);
        log.setActorType(actorType);
        log.setActorId(actorId);
        log.setActorName(actorName);
        log.setTargetName(targetName);
        log.setDescription(description);
        log.setLogDate(LocalDateTime.now());
        
        createActivityLog(log);
    }

    @Override
    public void addActivityLog(AdminActivityLogDTO log) {
        createActivityLog(log);
    }
    
    @Override
    public ArrayList<AdminActivityLogDTO> getRecentActivities(int limit) {
        return dao.getRecentActivities(limit);
    }
    
    @Override
    public ArrayList<AdminActivityLogDTO> getActivitiesByType(String activityType, int limit) {
        return dao.getActivitiesByType(activityType, limit);
    }
    
    @Override
    public ArrayList<AdminActivityLogDTO> getAllActivities(HashMap<String, Object> params) {
        return dao.getAllActivities(params);
    }
    
    @Override
    public int getTotalLogCount() {
        return dao.getTotalLogCount();
    }
    
    @Override
    public ArrayList<AdminActivityLogDTO> getAllActivities(AdminActivityLogCriteriaDTO cri) {
        return dao.getAllActivities(cri);
    }
    
    @Override
    public int getTotalLogCount(AdminActivityLogCriteriaDTO cri) {
        return dao.getTotalLogCount(cri);
    }
} 