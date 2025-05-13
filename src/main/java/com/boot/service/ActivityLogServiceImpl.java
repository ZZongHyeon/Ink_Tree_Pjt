package com.boot.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.ActivityLogDAO;
import com.boot.dto.ActivityLogDTO;

@Service
public class ActivityLogServiceImpl implements ActivityLogService {
    
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public void createActivityLog(ActivityLogDTO log) {
        ActivityLogDAO dao = sqlSession.getMapper(ActivityLogDAO.class);
        
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
        ActivityLogDTO log = new ActivityLogDTO();
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
    public ArrayList<ActivityLogDTO> getRecentActivities(int limit) {
        ActivityLogDAO dao = sqlSession.getMapper(ActivityLogDAO.class);
        return dao.getRecentActivities(limit);
    }
    
    @Override
    public ArrayList<ActivityLogDTO> getActivitiesByType(String activityType, int limit) {
        ActivityLogDAO dao = sqlSession.getMapper(ActivityLogDAO.class);
        return dao.getActivitiesByType(activityType, limit);
    }
    
    @Override
    public ArrayList<ActivityLogDTO> getAllActivities(HashMap<String, Object> params) {
        ActivityLogDAO dao = sqlSession.getMapper(ActivityLogDAO.class);
        return dao.getAllActivities(params);
    }
    
    @Override
    public int getTotalLogCount() {
        ActivityLogDAO dao = sqlSession.getMapper(ActivityLogDAO.class);
        return dao.getTotalLogCount();
    }
} 