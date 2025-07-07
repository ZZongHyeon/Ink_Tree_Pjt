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

## 🖥️상세구현내용

<details>
<summary>🖥️로그인 & 회원가입</summary>
  
  ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/1로그인화면.png?raw=true)

1. 일반 로그인
비회원은 회원가입을 통해 로그인을 할 수 있습니다.
로그인시 JWT토큰을 발급받고 사용자는 해당 서비스를 이용 할 수 있습니다.
2. 소셜 로그인
네이버, 카카오, 구글 등을 통해 일반 회원가입을 진행 할 수 있습니다.
소셜 로그인 또한 JWT토큰을 발급받고 해당 서비스를 이용 할 수 있습니다.

---

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
<summary>메인화면</summary>

![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_1메인.png?raw=true)

1. 토큰
로그인시 사용자의 토큰 만료시간과 해당 토큰의 만료값을 초기화시켜 다시 30분의 시간을 가지도록 구현하였습니다.
UI상 창모드 및 모바일로 사용 시 사용자경험을 상승시키기 위해 축소 및 일정 width이하가 되면 숨김처리 되도록 구현하였습니다.
2. 검색
텍스트입력기반 검색을 통하여 사용자가 원하는 도서 제목, 저자, 출판사 등으로 검색하여 도서를 검색 할 수 있습니다.
실제 도서에서도 분류별로 나뉘기에 대분류, 중분류로 나누어 사용자 경험을 향상시켰습니다.

---

![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_2메인.png?raw=true)

1. 추천 도서
	도서 대여 횟수를 기준으로 인기 도서 4원을 추천 도서 영역에 노출합니다.
	향후 더미데이터를 활용해 사용자 대여 이력을 기반으로 카테고리별 맞춤 추천 기능으로 확장할 예정입니다.
2. 일반 채팅 & AI채팅
	WebSocket 기반 일반 채팅 기능을 구현하였으며 Gemini API 기반 AI 챗봇은 프롬프트 제한을 통해
	도서 관련 질문에만 응답하도록 구성했습니다.
</details>

<details>
<summary>도서 검색</summary>
	
![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_3도서검색.png?raw=true)

메인 도서검색과 연결되며 사용자는 도서명, 저자명, 출판사 등 다양한 기준으로 도서를 효율적으로 검색할 수 있습니다.
검색 결과는 페이지당 8권씩 출력하여 시스템의 응답 속도를 최적화하고, 사용자에게 쾌적한 탐색 환경을 제공합니다.

</details>

<summary>도서 상세 정보</summary>

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_4도서디테일.png?raw=true)

1. 페이지 진입 시 해당 도서의 기본 정보와 상세 소개가 최우선으로 노출됩니다.
2. 사용자는 도서에 대해 대출 신청 또는 관심 도서 등록(위시리스트 추가) 기능을 바로 이용할 수 있습니다.
3. 관리자 권한을 가진 사용자는 도서 정보에 대한 수정 및 삭제 작업을 수행할 수 있습니다.
4. 사용자는 각 도서에 대해 한 번만 리뷰를 작성할 수 있으며, 자신의 리뷰는 수정 및 삭제가 가능합니다.
5. 리뷰 평균 평점은 도서 상단에 시각적으로 집계되어 표시되며, 전체 이용자의 평가 흐름을 한눈에 확인할 수 있습니다.
6. 관리자는 모든 리뷰에 대해 제한 없이 수정 및 삭제 권한을 갖습니다.

</details>

<summary>공지사항 & 일반 게시판</summary>

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/4_1공지.png?raw=true)

1. 공지사항 기능은 사이트 운영에 필요한 주요 정보 전달 수단으로 운영 정책에 따라 관리자 계정으로만 작성이 가능하도록 권한을 제한하였습니다.
2. 권한 제어는 데이터 무결성과 운영 신뢰성을 유지하는데 목적이 있으며 게시글 생성 시 로그인 계정의 역할을 기반으로 접근을 제어하도록 구현하였습니다.
3. 공지사항은 중요공지, 이벤트, 업데이트의 세 가지 카테고리로 분류되며 사용자는 원하는 정보만 골라서 볼 수 있도록 카테고리 필터 기능을 제공합니다.
4. 이를 통해 정보 전달의 효율성을 높이고 사용자 경험을 개선하였습니다.

---

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/4_2게시판.png?raw=true)

1. 게시판은 커뮤니티 기능의 중심이 되는 구성 요소로 데이터가 많아질수록 성능과 사용 편의성에 영향을 주기 때문에 페이지당 10개씩 불러오는 페이징 처리를 적용하여 초기 로딩 속도와 데이터 접근 효율성을 개선하였습니다.
2. 게시글 목록에서는 추천 수와 댓글 수를 사전 노출 하여 사용자가 리스트를 탐색하면서도 활발한 게시글, 인기 게시글을 직관적으로 파악할 수 있도록 UI/UX를 강화하였습니다.
3. 다양한 검색 조건을 적용할 수 있도록 제목, 본문 내용, 작성자 기준의 검색 기능을 구현하였습니다.
4. 이로 인해 사용자는 키워드 기반으로 빠르고 정확하게 원하는 게시글을 탐색할 수 있습니다.

---

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/4_2게시글.png?raw=true)

1. 게시글 상세 기능에서는 사용자의 반응을 유도하고 콘텐츠의 신뢰도를 높이기 위해 추천 기능을 도입하였습니다.
2. 사용자는 특정 게시글에 공감하거나 유익하다고 판단될 경우 추천 버튼을 통해 피드백을 줄 수 있으며 이는 커뮤니티 내에서 콘텐츠 품질을 자연스럽게 평가할 수 있는 간접적인 장치로 작용합니다.
3. 댓글 시스템에서는 계층형 구조를 구현하기 위해 SubNumber 컬럼을 활용하였습니다.
4. 댓글 작성 시 부모 댓글의 ID와 함께 계층 구조를 판단할 수 있도록 설계하여 일반 댓글과 대댓글의 관계를 명확하게 구분하고 프론트엔드에서는 이를 바탕으로 들여쓰기 형식의 계층 UI를 구현할 수 있게 하였습니다.

</details>

<summary>거래 게시판</summary>

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/4_4거래게시판.png?raw=true)

1. 거래게시판에서는 사용자의 편의를 고려하여 다양한 조건 기반의 검색 및 정렬 기능을 구현하였습니다.
2. 사용자는 카테고리 또는 게시글 제목을 기준으로 도서를 검색할 수 있으며, 게시글의 상태를 판매중, 예약중, 판매완료로 나누어 상태별 필터링이 가능하도록 설계하였습니다.
3. 또한 사용자가 게시글을 효율적으로 탐색할 수 있도록 가격순, 조회순 정렬 기능도 함께 구현하여 단순 나열이 아닌 사용자 중심의 탐색을 제공하였습니다.

---

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/4_5거래게시글.png?raw=true)

1. 거래 게시글 상세 페이지에서는 사용자가 상품에 대해 더욱 직관적으로 판단하고 소통할 수 있도록 다양한 기능을 제공합니다. 사용자는 해당 게시글에 대해 관심 등록, 1:1 채팅 요청, 게시글 수정 및 삭제( 관리자 및 작성자 권한)를 할 수 있으며 이 모든 기능은 권한 검증을 기반으로 처리됩니다.
2. 또한 단일 게시글 정보 외에도 해당 판매자가 현재 등록한 다른 판매중인 게시글 목록, 해당 게시글의 조회수, 누적 관심 수, 열린 채팅 수 등의 데이터가 함께 노출되도록 구성하여 구매자는 판매자의 신뢰도와 활동 내역을 종합적으로 확인할 수 있습니다. 
3. 이러한 설계를 통해 사용자 간 거래에서 발생할 수 있는 불신을 줄이고 더 투명한 중고 거래 경험을 제공합니다.
</details>

<summary>관심목록</summary>
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/5_1일반도서관심.png?raw=true)
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/5_2거래도서관심.png?raw=true)
    
1. 사용자가 거래 게시글에 관심 등록을 하면 해당 게시글은 별도의 관심 목록 페이지에 자동으로 저장됩니다.
2. 관심 목록에서는 등록된 게시글들을 한눈에 확인할 수 있으며 제목 또는 카테고리 기반 검색, 판매 상태(판매중, 예약중, 판매완료)필터, 정렬옵션(최신순, 낮은 가격순, 높은 가격순, 조회순) 등 다양한 조건을 통해 원하는 상품을 쉽게 탐색할 수 있도록 구현하였습니다.
3. 사용자는 해당 화면에서 직접 관심 게시글을 삭제할 수 있으며 이를 통해 관심 상품을 간편하게 관리할 수 있는 UX흐름을 제공하였습니다. 추가적으로 관심 목록과 일반 게시판, 상세 페이지 간 이동 동선도 유기적으로 연결되어 이탈없이 자연스러운 사용자 흐름이 가능하도록 설계했으며 관심등록된 거래 게시글은 한 곳에 모아 효율적으로 탐색할 수 있도록 구성했습니다. 이 또한 제목, 카테고리 별로 검색 할 수 있고 판매중, 예약중, 판매완료, 최신순, 낮은 가격순, 높은 가격순, 조회순등으로 정렬 및 탐색 가능 바로 관심목록 삭제도 가능합니다.
</details>

<summary>도서대출기록</summary>
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/6_1기록1.png?raw=true)
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/6_2기록.png?raw=true)
    
1. 도서 대출 내역 페이지는 사용자가 자신의 전체 도서 이용 이력과 현재 상태를 종합적으로 확인할 수 있도록 구성되어 있습니다.
2. 페이지 내에서는 현재 대출 중인 도서, 연체 도서, 총 대출 완료 이력을 구분하여 표시하였으며 현재 대출 중인 도서는 해당 페이지에서 즉시 반납 처리가 가능하도록 기능을 구현하였습니다.
3. 각 대출 이력 항목에는 도서 상세 페이지로 직접 이동할 수 있는 링크가 포함되어 있어 사용자가 과거에 읽었던 책에 대한 정보를 다시 확인하거나 다시 대출하고 싶은 책을 빠르게 찾을 수 있는 구조를 마련하였습니다.

</details>

<summary>기타 관리자 기능/summary>
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/7_1관리자.png?raw=true)
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/7_2활동로그.png?raw=true)
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/7_3도서등록.png?raw=true)

1. 관리자 페이지 내에서 도서 등록 및 공지사항 등록 등 주요 기능에 신속하게 접근할 수 있도록 설계하였습니다.
2. 사용자는 대출 및 반납 기록을 간편하게 조회하고 관리할 수 있습니다.
3. 도서 등록 기능을 통해 새로운 도서를 효율적으로 추가할 수 있습니다.
4. 도서 상세 페이지에서 관리자는 도서 정보를 손쉽게 수정 및 업데이트할 수 있도록 구현하였습니다.

</details>

<summary>1:1채팅 & 챗봇/summary>
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/8_1채팅.png?raw=true)
	
해당 버튼을 누르면 해당 판매자와의 채팅이 열리게 됩니다.
	
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/8_2채팅.png?raw=true)
    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/8_3채팅.png?raw=true)

메시지를 받은 판매자는 알림이 뜨고 메시지를 보낼 수 있게 됩니다.

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/8_4채팅.png?raw=true)

---

    ![InkTree ERD](https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/9_1챗봇.png?raw=true)

1. Google Gemini API를 활용하여 도서 관련 질의에만 응답하는 AI 챗봇을 구현하였습니다.
2. 챗봇은 사용자의 질문을 분석한 후 도서 정보에 한정된 답변만을 제공하며 불필요한 정보나 장황한 설명을 배제하고 핵심적인 내용만 간결하게 전달하도록 설계되었습니다.
3. 사용자는 신속하고 정확하게 도서 관련 정보를 얻을 수 있고 Gemini API의 자연어 처리 능력을 적극 활용하여 다양한 형태의 도서 관련 질문에도 신뢰성 높은 응답이 가능합니다.

</details>
