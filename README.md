[쿼리문추가.txt](https://github.com/user-attachments/files/20197607/default.txt)# 쿼리문입니다

  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 

# 📦 개발 환경 구조 요약

| 구분 | 내용
|-----|-----
| **개발 언어** | Java (JDK 8 이상), JavaScript
| **프레임워크** | Spring Boot + MyBatis
| **DB** | Oracle 11g 이상
| **빌드 도구** | Gradle
| **내장 WAS** | Spring Boot 내장 Tomcat
| **형상관리** | Git / GitHub
| **협업 도구** | Jira, Notion

# 기술 스택 (Tech Stack)

### 🌐 프론트엔드 (Frontend)

| 기술 | 설명
|-----|-----
| JSP | 서버 측에서 HTML을 생성하는 렌더링 기술<br>동적인 웹 페이지 구현에 사용
| js/jQuery | 클라이언트 측에 필요한 동작처리, 동적 콘텐츠 로딩
| MyBatis | SQL Mapper 프레임워크로 프론트와 DB간의 효율적인 데이터 매핑 활용


### ⚙️ 백엔드 (Backend)

| 기술 | 설명
|-----|-----
| Spring Framework | 컨트롤러, 서비스 계층의 구현을 위해 사용<br>표준 MVC 패턴 기반으로 구조화
| MyBatis | SQL과 서버 객체간 매핑담당 도구자, 시퀀스와 연계가 용름
| Oracle | 대규모 데이터 관리를 위한 관계형 데이터베이스 사용


### 🛠️ 개발 도구 (Development Tools)

| 도구 | 사용 목적
|-----|-----
| Visual Studio Code | JS, CSS, 프론트 등 코드 작성용 에디터
| Eclipse | Java 백엔드 및 Spring 기반 프로젝트 구현
| Jira | 이슈 관리 및 구체적인 일정 계획 수립을 위한 협업 도구
| GitHub | 코드 버전 관리 및 팀 협업
| Apache Tomcat | 웹앱 서버 구동, 테스트


# 👥 업무 분장 (Team Roles)

### 👨‍💻 정종현 (FullStack)

| 담당 업무 | 세부 내용
|-----|-----
| 🏗️ 전체 구조 설계 | 전체 form 작성
| 🔐 회원 관리 | 회원가입 & 로그인
| 📋 게시판 | 게시판 CRUD 구현
| 💬 소통 기능 | 댓글 & 대댓글 & 추천
| 📚 도서 관리 | 도서 등록 & 상세정보 & 검색 & 대출중인 도서


### 🎨 김형섭 (Frontend)

| 담당 업무 | 세부 내용
|-----|-----
| 📚 도서 기능 | 도서 추천 & 수정 & 등록
| 👤 사용자 정보 | 개인 정보 수정


### ⚙️ 이병훈 (Backend)

| 담당 업무 | 세부 내용
|-----|-----
| 📚 도서 관리 | 도서 수정
| 👤 사용자 정보 | 개인 정보 수정
| 📝 게시글 관리 | 게시글 작성 & 수정 & 삭제


### 🔧 정재윤 (Backend)


| 담당 업무 | 세부 내용
|-----|-----
| 📢 공지사항 | 공지사항 작성 & 수정 & 삭제
| 📚 도서 대출 시스템 | 도서 대출 & 반납 & 삭제 & 반납/대출기록
| 💾 데이터베이스 | DB트리거 작성


<details><summary><b>application.properties</b></summary>

<pre>spring.application.name=Metro_House_Pjt
server.port=8485

#Spring MVC
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

#Database config
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:xe
spring.datasource.username=bookmanager
spring.datasource.password=1234

#mybatis config
mybatis.config-location=classpath:mybatis-config.xml

#kakao.api.key=${KAKAO_API_KEY}
kakao.api.key=카카오 api 등록해주세요.

#naver email
smtp_id=네이버 아이디 등록해주세요.
smtp_pw=네이버 비밀번호 등록해주세요.
  
# gemini api
apiKey =

</pre></details>

## ERD
![제목 없음](https://github.com/user-attachments/assets/6fcc184a-7832-47de-9f53-7db4e7636054)

## 🔑회원가입 - 도로명 api
https://github.com/user-attachments/assets/1e1b3202-5e98-482b-ba6a-8f2281aadce5

## 🏠마이페이지 - 대출중도서, 연체도서, 총 대출 이력, 대출현황&기록
https://github.com/user-attachments/assets/21322cc8-3d86-4957-b91a-c8b608871d74

## 📖대출&반납
https://github.com/user-attachments/assets/9cf238c0-6ded-475b-a1fd-eb9e090d7dd1

## 📨게시판 작성, 수정, 삭제, 댓글, 추천
https://github.com/user-attachments/assets/295d5c3a-c79f-47a0-b290-f535c7cfbd1d

## 📕 도서 등록
https://github.com/user-attachments/assets/c25e002f-0a1c-4fdb-8285-8b6f5f99a085

## ✏️도서 수정
https://github.com/user-attachments/assets/6a497dd5-5aa5-4dac-9bef-000b31cdd8e0

## 📢공지사항 작성, 수정, 삭제
https://github.com/user-attachments/assets/5691abc0-2bc7-49a5-9be8-166daf432095
