## 📦 개발 환경 구성

| 항목 | 상세 내용 |
|------|-----------|
| **개발 언어** | Java (JDK 8+), JavaScript |
| **프레임워크** | Spring Boot (Spring MVC, Spring Security 포함), MyBatis |
| **데이터베이스** | Oracle 11g 이상 |
| **빌드 도구** | Gradle |
| **WAS** | Spring Boot Embedded Tomcat |
| **형상 관리** | Git, GitHub |
| **협업 도구** | Jira, Notion |
| **API 테스트** | Postman |



## 🛠️ 기술 스택 (Tech Stack)

### 🌐 Frontend

| 기술 | 설명 |
|------|------|
| **JSP** | 서버 사이드 렌더링 기반 동적 HTML 생성 |
| **JavaScript / jQuery** | 클라이언트 상호작용 구현 및 Ajax 요청 처리 |
| **Bootstrap** | 반응형 UI 디자인 구현 |
| **MyBatis** | View와 DB 간의 데이터 매핑 처리 (JSP ↔ DAO) |

### ⚙ Backend

| 기술 | 설명 |
|------|------|
| **Spring Framework** | MVC 아키텍처 기반 컨트롤러/서비스 설계 |
| **Spring Boot** | 설정 자동화, 내장 WAS, RESTful API 설계 |
| **Spring Security** | 인증/인가 처리 (JWT + OAuth2 지원) |
| **MyBatis** | SQL Mapper 프레임워크, DAO 역할 |
| **OracleDB** | 안정적인 트랜잭션 관리와 데이터 저장 |

### 🔗 API 연동 및 외부 서비스

- **Naver SMTP** – 이메일 인증 시스템 구현  
- **Kakao 주소 API** – 회원가입 주소 자동입력  
- **OAuth2 (Naver, Kakao, Google)** – 소셜 로그인 연동  
- **Google Gemini API** – 도서 추천용 AI 챗봇  
- **WebSocket** – 1:1 실시간 채팅 서비스  



## 💻 개발 도구 및 환경

| 도구 | 역할 |
|------|------|
| **IntelliJ IDEA / Eclipse** | Java 백엔드 및 Spring Boot 개발 |
| **Visual Studio Code** | 프론트엔드, JSP 및 JS 개발 |
| **Postman** | API 테스트 및 디버깅 |
| **GitHub** | 프로젝트 버전 관리 및 협업 |
| **Notion** | 기획/기록/문서화 |
| **Jira** | 업무 프로세스 관리, 일정 계획 |
| **Apache Tomcat** | 내장 웹 서버 (Spring Boot Embedded) |



## ✅ 개발 특징

- **JWT + OAuth2 로그인 구현**
- **Spring Security 기반 권한 관리 및 접근 제어**
- **Oracle + MyBatis를 활용한 실시간 데이터 처리**
- **AI 연동 챗봇 및 실시간 채팅 기능 구현**
- **JSP 기반 다이내믹 페이지 구성**
- **REST API 설계 및 통신 구조 최적화**

<details>
<summary>📊 ERD 구조 설명 보기</summary>
  <br>
<ul>
  <li><b>사용자 관리</b>
    <ul>
      <li>USERINFO: 사용자 기본 정보</li>
      <li>USER_SESSIONS: 유저 세션 관리</li>
    </ul>
  </li>
<br>
  <li><b>도서 관리</b>
    <ul>
      <li>BOOKINFO: 도서 정보</li>
      <li>BOOK_BORROW / BOOK_RECORD: 도서 대출 및 반납 기록</li>
      <li>BOOK_REVIEW / BOOK_WISHLIST: 도서 리뷰 및 관심 도서 목록</li>
    </ul>
  </li>
<br>
  <li><b>커뮤니티 기능</b>
    <ul>
      <li>BOARD: 게시판</li>
      <li>BOARD_COMMENT: 댓글</li>
      <li>BOARD_LIKES: 게시글 추천</li>
    </ul>
  </li>
<br>
  <li><b>공지사항</b>
    <ul>
      <li>NOTICE: 운영자 공지사항 관리</li>
    </ul>
  </li>
<br>
  <li><b>중고 도서 거래</b>
    <ul>
      <li>TRADE_POST: 중고 도서 게시글</li>
      <li>TRADE_FAVORITE: 관심 등록 기능</li>
      <li>TRADE_RECORD: 거래 완료 기록</li>
    </ul>
  </li>
<br>
  <li><b>실시간 채팅</b>
    <ul>
      <li>TRADE_CHATROOM: 채팅방</li>
      <li>TRADE_CHATMESSAGE: 채팅 메시지</li>
    </ul>
  </li>
<br>
  <li><b>사용자 알림</b>
    <ul>
      <li>NOTIFICATIONS: 이벤트 및 메시지 알림 시스템</li>
    </ul>
  </li>
</ul>
<br>
  
## 전체 ERD
![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/erd/ERD_전체.png?raw=true)

## 1차 ERD
![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/erd/ERD_1차.png?raw=true)

## 2차 ERD
![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/erd/ERD_2차.png?raw=true)
</details>

<details>
<summary>🖥️로그인 & 회원가입</summary>
</details>

<details>
<summary>🖥️로그인 & 회원가입</summary>
  
  ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/1로그인화면.png?raw=true)

1. 일반 로그인
비회원은 회원가입을 통해 로그인을 할 수 있습니다.
로그인시 JWT토큰을 발급받고 사용자는 해당 서비스를 이용 할 수 있습니다.
2. 소셜 로그인
네이버, 카카오, 구글 등을 통해 일반 회원가입을 진행 할 수 있습니다.
소셜 로그인 또한 JWT토큰을 발급받고 해당 서비스를 이용 할 수 있습니다.

  ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/2_1회원가입.png?raw=true)
  ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/2_2이메일인증.png?raw=true)

1. 이메일 인증
네이버 SMTP를 활용하여 이메일 인증 시스템을 구현했습니다.
이메일 중복 여부를 확인한 후 숫자를 포함한 8자리 무작위 인증번호를 생성해 해당 주소로 전송합니다.
인증번호 전송 후 사용자가 이메일을 수정하면 최종 입력된 이메일로 가입되는 현상이 발생하여 인증번호 전송과 동시에 이메일 입력 필드와 전송 버튼을 비활성화하여 입력값 변경을 막는 방식으로 수정하였습니다.
2. 정보 입력
모든 input태그는 해당 패턴에 맞도록 예외처리를 하였습니다.
카카오 API를 활용하여 사용자가 주소를 입력하면 우편번호와 도로명이 자동으로 삽입되도록 구현하였습니다.
</details>

<details>
<summary>🖥️메인화면</summary>

![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_1메인.png?raw=true)

1. 토큰
로그인시 사용자의 토큰 만료시간과 해당 토큰의 만료값을 초기화시켜 다시 30분의 시간을 가지도록 구현하였습니다.
UI상 창모드 및 모바일로 사용 시 사용자경험을 상승시키기 위해 축소 및 일정 width이하가 되면 숨김처리 되도록 구현하였습니다.
2. 검색
텍스트입력기반 검색을 통하여 사용자가 원하는 도서 제목, 저자, 출판사 등으로 검색하여 도서를 검색 할 수 있습니다.
실제 도서에서도 분류별로 나뉘기에 대분류, 중분류로 나누어 사용자 경험을 향상시켰습니다.

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_2메인.png?raw=true)

1. 추천 도서
	도서 대여 횟수를 기준으로 인기 도서 4원을 추천 도서 영역에 노출합니다.
	향후 더미데이터를 활용해 사용자 대여 이력을 기반으로 카테고리별 맞춤 추천 기능으로 확장할 예정입니다.
2. 일반 채팅 & AI채팅
	WebSocket 기반 일반 채팅 기능을 구현하였으며 Gemini API 기반 AI 챗봇은 프롬프트 제한을 통해
	도서 관련 질문에만 응답하도록 구성했습니다.
</details>
