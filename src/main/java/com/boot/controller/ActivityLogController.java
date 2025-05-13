//package com.boot.controller;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.boot.dto.ActivityLogCriteriaDTO;
//import com.boot.dto.ActivityLogDTO;
//import com.boot.dto.PageDTO;
//import com.boot.service.ActivityLogService;
//
//@Controller
//public class ActivityLogController {
//    
//    @Autowired
//    private ActivityLogService activityLogService;
//    
//    // 활동 로그 전체 보기 페이지
//    @RequestMapping("/activity_log")
//    public String viewActivityLog(Model model, 
//                                 @RequestParam(defaultValue = "1") int page,
//                                 @RequestParam(defaultValue = "10") int size) {
//        
//        // 페이징 처리를 위한 파라미터
//        HashMap<String, Object> params = new HashMap<>();
//        params.put("offset", (page - 1) * size);
//        params.put("limit", size);
//        
//        // 활동 로그 목록 조회
//        ArrayList<ActivityLogDTO> logList = activityLogService.getAllActivities(params);
//        model.addAttribute("logList", logList);
//        
//        // 페이징 처리를 위한 총 로그 수 조회
//        int totalLogs = activityLogService.getTotalLogCount();
//        model.addAttribute("pageMaker", new PageDTO(totalLogs, page, size));
//        
//        return "activity_log";
//    }
//} 