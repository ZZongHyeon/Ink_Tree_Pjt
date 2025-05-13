package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.ActivityLogDTO;

public interface ActivityLogService {
    // 로그 생성
    public void createActivityLog(ActivityLogDTO log);
    
    // 로그 생성 (파라미터 기반)
    public void createActivityLog(String activityType, String actorType, int actorId, 
                                  String actorName, String targetName, String description);
    
    // 최근 활동 가져오기
    public ArrayList<ActivityLogDTO> getRecentActivities(int limit);
    
    // 특정 유형의 활동 로그만 가져오기
    public ArrayList<ActivityLogDTO> getActivitiesByType(String activityType, int limit);
    
    // 모든 로그 가져오기 (페이징 처리)
    public ArrayList<ActivityLogDTO> getAllActivities(HashMap<String, Object> params);
    
    // 총 로그 수 가져오기
    public int getTotalLogCount();
} 