## 개발 환경 구성

<div>



</div>| 🏷️ **항목** | 🔧 **상세 내용**
|-----|-----
| 

 | **Java (JDK 8+)**, **JavaScript**
| 

 | **Spring Boot** (Spring MVC, Spring Security 포함)
| 

 | **MyBatis**
| 

 | **Oracle 11g 이상**
| 

 | **Gradle**
| 

 | **Spring Boot Embedded Tomcat**
| 

 | **Git**, **GitHub**
| 

 | **Jira**, **Notion**
| 

 | **Postman**


---

## ️ 기술 스택 (Tech Stack)

<div>### **Frontend Technologies**














</div>| 💻 **기술** | 📝 **설명**
|-----|-----
| **🎨 JSP** | 서버 사이드 렌더링 기반 동적 HTML 생성
| **⚡ JavaScript / jQuery** | 클라이언트 상호작용 구현 및 Ajax 요청 처리
| **📱 Bootstrap** | 반응형 UI 디자인 구현
| **🔗 MyBatis** | View와 DB 간의 데이터 매핑 처리 (JSP ↔ DAO)


<div>### ️ **Backend Technologies**














</div>| 🔧 **기술** | 📝 **설명**
|-----|-----
| **🚀 Spring Boot** | RESTful API 구현, 설정 자동화, 내장 톰캣 기반 서버 환경
| **🏗️ Spring MVC** | 계층화된 컨트롤러-서비스 구조로 웹 애플리케이션 구현
| **🗃️ MyBatis** | SQL 중심 ORM, DB 연동 및 동적 쿼리 처리
| **💾 Oracle** | 게시글/댓글/좋아요/거래 데이터 관리용 RDBMS
| **🔐 Spring Security** | 사용자 인증/인가 및 세션 관리 구현
| **🎫 JWT** | 토큰 기반 인증 구조, 무상태 인증 처리 방식 적용
| **💬 WebSocket** | 1:1 실시간 채팅 서비스


---

## 외부 연동 API

<div>



</div>| 🌐 **API** | 📋 **설명** | 🏷️ **태그**
|-----|-----
| **📧 Naver SMTP** | 이메일 인증 시스템 구현 | 


| **🏠 Kakao 주소 API** | 회원가입 주소 자동입력 | 


| **🔑 OAuth2** | 소셜 로그인 연동 (Naver, Kakao, Google) | 


| **🤖 Google Gemini API** | 도서 추천용 AI 챗봇 | 


| **💬 WebSocket** | 1:1 실시간 채팅 서비스 | 




---

## 개발 도구

<div>



</div>| 🛠️ **도구** | 🎯 **역할** | 🏷️ **카테고리**
|-----|-----
| **💡 IntelliJ IDEA / Eclipse** | Java 백엔드 및 Spring Boot 개발 | 


| **📝 Visual Studio Code** | 프론트엔드, JSP 및 JS 개발 | 


| **🧪 Postman** | API 테스트 및 디버깅 | 


| **📚 GitHub** | 프로젝트 버전 관리 및 협업 | 


| **📋 Notion** | 기획/기록/문서화 | 


| **📊 Jira** | 업무 프로세스 관리, 일정 계획 | 




---

## 개발 특징

<div>



</div>### **보안 & 인증**

- **JWT + OAuth2** 기반 로그인/인증 시스템
- **Spring Security** 기반 권한 분기 및 접근 제어 구현


### **데이터 관리**

- **Oracle + MyBatis** 활용한 데이터 핸들링
- **REST API** 설계 최적화 및 클린 아키텍처 적용


### **실시간 기능**

- **실시간 1:1 채팅** 및 AI 챗봇 통합 기능 구현
- **WebSocket** 기반 양방향 통신
