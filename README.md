# InkTree - 스마트 도서관 통합 플랫폼

`<div align="center">`



**현대적인 도서관 관리와 커뮤니티를 하나로 연결하는 통합 플랫폼**

[

](https://openjdk.java.net/)
[

](https://spring.io/projects/spring-boot)
[

](https://www.oracle.com/database/)
[

](LICENSE)

[🚀 빠른 시작](#-빠른-시작) • [📖 문서](#-api-문서) • [🤝 기여하기](#-기여하기) • [📞 지원](#-지원-및-문의)

`</div>`---

## 목차

- [프로젝트 개요](#-프로젝트-개요)
- [핵심 기능](#-핵심-기능)
- [기술 스택](#️-기술-스택)
- [시스템 아키텍처](#-시스템-아키텍처)
- [성능 지표](#-성능-지표)
- [데이터베이스 설계](#️-데이터베이스-설계)
- [빠른 시작](#-빠른-시작)
- [주요 화면](#-주요-화면)
- [API 문서](#-api-문서)
- [주요 특징](#-주요-특징)
- [기여하기](#-기여하기)
- [지원 및 문의](#-지원-및-문의)
- [라이선스](#-라이선스)


---

## 프로젝트 개요

InkTree는 전통적인 도서관 시스템의 한계를 뛰어넘어, **현대적인 웹 기술과 AI를 활용한 차세대 도서관 통합 플랫폼**입니다. 도서 관리, 커뮤니티, 중고거래, 실시간 소통을 하나의 생태계로 연결하여 사용자에게 완전히 새로운 도서관 경험을 제공합니다.

### 비전

> "모든 사람이 언제 어디서나 쉽게 접근할 수 있는 지능형 도서 생태계 구축"



### 미션

- **디지털 혁신**: 전통적인 도서관을 현대적 디지털 플랫폼으로 전환
- **커뮤니티 중심**: 독서 문화 확산과 지식 공유 생태계 조성
- **사용자 경험**: 직관적이고 편리한 도서 관리 서비스 제공
- **지속가능성**: 중고도서 거래를 통한 순환 경제 모델 구현


---

## 핵심 기능

`<div align="center">`| 🔐 **인증 시스템** | 📚 **도서 관리** | 💬 **커뮤니티** | 🔄 **거래 시스템**
|-----|-----|-----|-----
| JWT + OAuth2 | 스마트 검색 | 실시간 채팅 | P2P 중고거래
| 소셜 로그인 | AI 추천 | 게시판/댓글 | 관심 목록
| 이메일 인증 | 대출/반납 | 리뷰 시스템 | 거래 매칭


`</div>`### 주요 하이라이트

- **🤖 AI 기반 도서 추천**: Google Gemini API를 활용한 개인화된 도서 추천
- **⚡ 실시간 통신**: WebSocket 기반 1:1 채팅 및 알림 시스템
- **🔒 엔터프라이즈급 보안**: Spring Security + JWT + OAuth2 다층 보안
- **📱 반응형 디자인**: 모든 디바이스에서 최적화된 사용자 경험
- **🌐 외부 API 통합**: 네이버, 카카오, 구글 등 주요 플랫폼 연동


---

## ️ 기술 스택

### Frontend

`<div align="center">`












`</div>`### Backend

`<div align="center">`












`</div>`### Database & Infrastructure

`<div align="center">`









`</div>`### External Integrations

`<div align="center">`












`</div>`### Development Tools

`<div align="center">`















`</div>`---

## 시스템 아키텍처

```mermaid
Diagram.download-icon {
            cursor: pointer;
            transform-origin: center;
        }
        .download-icon .arrow-part {
            transition: transform 0.35s cubic-bezier(0.35, 0.2, 0.14, 0.95);
             transform-origin: center;
        }
        button:has(.download-icon):hover .download-icon .arrow-part, button:has(.download-icon):focus-visible .download-icon .arrow-part {
          transform: translateY(-1.5px);
        }
        #mermaid-diagram-rh40{font-family:var(--font-geist-sans);font-size:12px;fill:#000000;}#mermaid-diagram-rh40 .error-icon{fill:#552222;}#mermaid-diagram-rh40 .error-text{fill:#552222;stroke:#552222;}#mermaid-diagram-rh40 .edge-thickness-normal{stroke-width:1px;}#mermaid-diagram-rh40 .edge-thickness-thick{stroke-width:3.5px;}#mermaid-diagram-rh40 .edge-pattern-solid{stroke-dasharray:0;}#mermaid-diagram-rh40 .edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-diagram-rh40 .edge-pattern-dashed{stroke-dasharray:3;}#mermaid-diagram-rh40 .edge-pattern-dotted{stroke-dasharray:2;}#mermaid-diagram-rh40 .marker{fill:#666;stroke:#666;}#mermaid-diagram-rh40 .marker.cross{stroke:#666;}#mermaid-diagram-rh40 svg{font-family:var(--font-geist-sans);font-size:12px;}#mermaid-diagram-rh40 p{margin:0;}#mermaid-diagram-rh40 .label{font-family:var(--font-geist-sans);color:#000000;}#mermaid-diagram-rh40 .cluster-label text{fill:#333;}#mermaid-diagram-rh40 .cluster-label span{color:#333;}#mermaid-diagram-rh40 .cluster-label span p{background-color:transparent;}#mermaid-diagram-rh40 .label text,#mermaid-diagram-rh40 span{fill:#000000;color:#000000;}#mermaid-diagram-rh40 .node rect,#mermaid-diagram-rh40 .node circle,#mermaid-diagram-rh40 .node ellipse,#mermaid-diagram-rh40 .node polygon,#mermaid-diagram-rh40 .node path{fill:#eee;stroke:#999;stroke-width:1px;}#mermaid-diagram-rh40 .rough-node .label text,#mermaid-diagram-rh40 .node .label text{text-anchor:middle;}#mermaid-diagram-rh40 .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#mermaid-diagram-rh40 .node .label{text-align:center;}#mermaid-diagram-rh40 .node.clickable{cursor:pointer;}#mermaid-diagram-rh40 .arrowheadPath{fill:#333333;}#mermaid-diagram-rh40 .edgePath .path{stroke:#666;stroke-width:2.0px;}#mermaid-diagram-rh40 .flowchart-link{stroke:#666;fill:none;}#mermaid-diagram-rh40 .edgeLabel{background-color:white;text-align:center;}#mermaid-diagram-rh40 .edgeLabel p{background-color:white;}#mermaid-diagram-rh40 .edgeLabel rect{opacity:0.5;background-color:white;fill:white;}#mermaid-diagram-rh40 .labelBkg{background-color:rgba(255, 255, 255, 0.5);}#mermaid-diagram-rh40 .cluster rect{fill:hsl(0, 0%, 98.9215686275%);stroke:#707070;stroke-width:1px;}#mermaid-diagram-rh40 .cluster text{fill:#333;}#mermaid-diagram-rh40 .cluster span{color:#333;}#mermaid-diagram-rh40 div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:var(--font-geist-sans);font-size:12px;background:hsl(-160, 0%, 93.3333333333%);border:1px solid #707070;border-radius:2px;pointer-events:none;z-index:100;}#mermaid-diagram-rh40 .flowchartTitleText{text-anchor:middle;font-size:18px;fill:#000000;}#mermaid-diagram-rh40 .flowchart-link{stroke:hsl(var(--gray-400));stroke-width:1px;}#mermaid-diagram-rh40 .marker,#mermaid-diagram-rh40 marker,#mermaid-diagram-rh40 marker *{fill:hsl(var(--gray-400))!important;stroke:hsl(var(--gray-400))!important;}#mermaid-diagram-rh40 .label,#mermaid-diagram-rh40 text,#mermaid-diagram-rh40 text>tspan{fill:hsl(var(--black))!important;color:hsl(var(--black))!important;}#mermaid-diagram-rh40 .background,#mermaid-diagram-rh40 rect.relationshipLabelBox{fill:hsl(var(--white))!important;}#mermaid-diagram-rh40 .entityBox,#mermaid-diagram-rh40 .attributeBoxEven{fill:hsl(var(--gray-150))!important;}#mermaid-diagram-rh40 .attributeBoxOdd{fill:hsl(var(--white))!important;}#mermaid-diagram-rh40 .label-container,#mermaid-diagram-rh40 rect.actor{fill:hsl(var(--white))!important;stroke:hsl(var(--gray-400))!important;}#mermaid-diagram-rh40 line{stroke:hsl(var(--gray-400))!important;}#mermaid-diagram-rh40 :root{--mermaid-font-family:var(--font-geist-sans);}DatabaseExternal APIsData Access LayerBusiness LayerPresentation LayerClient LayerWeb BrowserMobile BrowserJSP ViewsREST ControllersWebSocket HandlersService LayerSecurity LayerAuthenticationMyBatis MappersDAO LayerGoogle GeminiOAuth2 ProvidersNaver SMTPKakao AddressOracle Database
```

---

## 성능 지표

`<div align="center">`| 메트릭 | 수치 | 설명
|-----|-----|-----|-----
| **응답 시간** | < 200ms | 평균 API 응답 시간
| **동시 사용자** | 1,000+ | 최대 동시 접속 지원
| **데이터 처리** | 10,000+ | 시간당 트랜잭션 처리량
| **가용성** | 99.9% | 시스템 가동률
| **보안 등급** | A+ | SSL Labs 보안 등급
| **페이지 로드** | < 2s | 평균 페이지 로딩 시간


`</div>`---

## ️ 데이터베이스 설계

### ERD 개요

```mermaid
Diagram.download-icon {
            cursor: pointer;
            transform-origin: center;
        }
        .download-icon .arrow-part {
            transition: transform 0.35s cubic-bezier(0.35, 0.2, 0.14, 0.95);
             transform-origin: center;
        }
        button:has(.download-icon):hover .download-icon .arrow-part, button:has(.download-icon):focus-visible .download-icon .arrow-part {
          transform: translateY(-1.5px);
        }
        #mermaid-diagram-rh6l{font-family:var(--font-geist-sans);font-size:12px;fill:#000000;}#mermaid-diagram-rh6l .error-icon{fill:#552222;}#mermaid-diagram-rh6l .error-text{fill:#552222;stroke:#552222;}#mermaid-diagram-rh6l .edge-thickness-normal{stroke-width:1px;}#mermaid-diagram-rh6l .edge-thickness-thick{stroke-width:3.5px;}#mermaid-diagram-rh6l .edge-pattern-solid{stroke-dasharray:0;}#mermaid-diagram-rh6l .edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-diagram-rh6l .edge-pattern-dashed{stroke-dasharray:3;}#mermaid-diagram-rh6l .edge-pattern-dotted{stroke-dasharray:2;}#mermaid-diagram-rh6l .marker{fill:#666;stroke:#666;}#mermaid-diagram-rh6l .marker.cross{stroke:#666;}#mermaid-diagram-rh6l svg{font-family:var(--font-geist-sans);font-size:12px;}#mermaid-diagram-rh6l p{margin:0;}#mermaid-diagram-rh6l .entityBox{fill:#eee;stroke:#999;}#mermaid-diagram-rh6l .attributeBoxOdd{fill:#ffffff;stroke:#999;}#mermaid-diagram-rh6l .attributeBoxEven{fill:#f2f2f2;stroke:#999;}#mermaid-diagram-rh6l .relationshipLabelBox{fill:hsl(-160, 0%, 93.3333333333%);opacity:0.7;background-color:hsl(-160, 0%, 93.3333333333%);}#mermaid-diagram-rh6l .relationshipLabelBox rect{opacity:0.5;}#mermaid-diagram-rh6l .relationshipLine{stroke:#666;}#mermaid-diagram-rh6l .entityTitleText{text-anchor:middle;font-size:18px;fill:#000000;}#mermaid-diagram-rh6l #MD_PARENT_START{fill:#f5f5f5!important;stroke:#666!important;stroke-width:1;}#mermaid-diagram-rh6l #MD_PARENT_END{fill:#f5f5f5!important;stroke:#666!important;stroke-width:1;}#mermaid-diagram-rh6l .flowchart-link{stroke:hsl(var(--gray-400));stroke-width:1px;}#mermaid-diagram-rh6l .marker,#mermaid-diagram-rh6l marker,#mermaid-diagram-rh6l marker *{fill:hsl(var(--gray-400))!important;stroke:hsl(var(--gray-400))!important;}#mermaid-diagram-rh6l .label,#mermaid-diagram-rh6l text,#mermaid-diagram-rh6l text>tspan{fill:hsl(var(--black))!important;color:hsl(var(--black))!important;}#mermaid-diagram-rh6l .background,#mermaid-diagram-rh6l rect.relationshipLabelBox{fill:hsl(var(--white))!important;}#mermaid-diagram-rh6l .entityBox,#mermaid-diagram-rh6l .attributeBoxEven{fill:hsl(var(--gray-150))!important;}#mermaid-diagram-rh6l .attributeBoxOdd{fill:hsl(var(--white))!important;}#mermaid-diagram-rh6l .label-container,#mermaid-diagram-rh6l rect.actor{fill:hsl(var(--white))!important;stroke:hsl(var(--gray-400))!important;}#mermaid-diagram-rh6l line{stroke:hsl(var(--gray-400))!important;}#mermaid-diagram-rh6l :root{--mermaid-font-family:var(--font-geist-sans);}USERINFOstringuser_idPKstringemailstringpasswordstringnamestringroledatetimecreated_atBOOK_BORROWTRADE_POSTstringpost_idPKstringuser_idFKstringtitledecimalpricestringstatusdatetimecreated_atBOARDTRADE_CHATROOMBOOKINFOstringbook_idPKstringtitlestringauthorstringpublisherstringcategoryintstock_countBOOK_REVIEWBOOK_WISHLISTTRADE_FAVORITEBOARD_COMMENTBOARD_LIKESTRADE_CHATMESSAGEborrowscreateswritesparticipatesborrowedreviewedwishlistedfavoriteddiscussedcommentedlikedcontains
```

### 주요 테이블 구조

`<details>
<summary><b>📋 테이블 상세 정보</b></summary>`#### 사용자 관리

- **USERINFO**: 사용자 기본 정보 및 권한 관리
- **USER_SESSIONS**: JWT 토큰 및 세션 상태 관리


#### 도서 관리

- **BOOKINFO**: 도서 메타데이터 및 재고 정보
- **BOOK_BORROW**: 대출/반납 이력 및 상태 추적
- **BOOK_REVIEW**: 사용자 리뷰 및 평점 시스템
- **BOOK_WISHLIST**: 관심 도서 목록 관리


#### 커뮤니티

- **BOARD**: 게시글 및 카테고리 관리
- **BOARD_COMMENT**: 계층형 댓글 시스템
- **BOARD_LIKES**: 추천 시스템
- **NOTICE**: 관리자 공지사항


#### 거래 시스템

- **TRADE_POST**: 중고도서 거래 게시글
- **TRADE_FAVORITE**: 관심 상품 등록
- **TRADE_RECORD**: 거래 완료 이력
- **TRADE_CHATROOM**: 실시간 채팅방 관리
- **TRADE_CHATMESSAGE**: 채팅 메시지 저장


#### 알림 시스템

- **NOTIFICATIONS**: 이벤트 및 메시지 알림 관리


`</details>`---

## 빠른 시작

### 사전 요구사항

```shellscript
# Java Development Kit
java -version  # Java 8 이상 필요

# Oracle Database
sqlplus / as sysdba  # Oracle 11g 이상 필요

# Gradle Build Tool
gradle --version  # Gradle 7.0 이상 권장
```

### 설치 및 실행

1. **저장소 클론**


```shellscript
git clone https://github.com/pingpingeee/Ink_Tree_Pjt.git
cd Ink_Tree_Pjt
```

2. **환경 설정**


```shellscript
# application.properties 설정
cp src/main/resources/application.properties.example src/main/resources/application.properties

# 데이터베이스 연결 정보 수정
vim src/main/resources/application.properties
```

3. **데이터베이스 초기화**


```shellscript
# 스키마 생성
sqlplus username/password@localhost:1521/xe @database/schema.sql

# 초기 데이터 삽입
sqlplus username/password@localhost:1521/xe @database/data.sql
```

4. **애플리케이션 실행**


```shellscript
# 개발 모드 실행
./gradlew bootRun

# 또는 JAR 빌드 후 실행
./gradlew build
java -jar build/libs/inktree-1.0.0.jar
```

5. **접속 확인**


```plaintext
http://localhost:8080
```

### Docker를 이용한 실행 (선택사항)

```shellscript
# Docker 이미지 빌드
docker build -t inktree:latest .

# 컨테이너 실행
docker run -p 8080:8080 inktree:latest
```

---

## 주요 화면

`<div align="center">`### 메인 대시보드





### 로그인 & 회원가입

`<div style="display: flex; gap: 10px;">
<img src="https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/1로그인화면.png?raw=true" width="45%">
<img src="https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/2_1회원가입.png?raw=true" width="45%">
</div>`### 도서 검색 & 상세

`<div style="display: flex; gap: 10px;">
<img src="https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_3도서검색.png?raw=true" width="45%">
<img src="https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/3_4도서디테일.png?raw=true" width="45%">
</div>`### 실시간 채팅 & AI 챗봇

`<div style="display: flex; gap: 10px;">
<img src="https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/8_2채팅.png?raw=true" width="45%">
<img src="https://github.com/pingpingeee/Ink_Tree_Pjt/blob/main/lib/images/front/9_1챗봇.png?raw=true" width="45%">
</div>``</div>`---

## API 문서

### 인증 API

```plaintext
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}

Response:
{
  "success": true,
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "user123",
    "name": "홍길동",
    "role": "USER"
  }
}
```

### 도서 검색 API

```plaintext
GET /api/books/search?query=자바&category=programming&page=1&size=10
Authorization: Bearer {jwt_token}

Response:
{
  "success": true,
  "data": {
    "books": [...],
    "totalCount": 150,
    "currentPage": 1,
    "totalPages": 15
  }
}
```

### 실시간 채팅 WebSocket

```javascript
const socket = new WebSocket('ws://localhost:8080/chat');

// 연결 설정
socket.onopen = function(event) {
    console.log('채팅 연결됨');
};

// 메시지 수신
socket.onmessage = function(event) {
    const message = JSON.parse(event.data);
    displayMessage(message);
};

// 메시지 전송
function sendMessage(text) {
    const message = {
        type: 'CHAT',
        content: text,
        timestamp: new Date().toISOString()
    };
    socket.send(JSON.stringify(message));
}
```

`<details>
<summary><b>📋 전체 API 목록 보기</b></summary>`#### 사용자 관리

- `POST /api/auth/register` - 회원가입
- `POST /api/auth/login` - 로그인
- `POST /api/auth/logout` - 로그아웃
- `POST /api/auth/refresh` - 토큰 갱신
- `GET /api/user/profile` - 프로필 조회
- `PUT /api/user/profile` - 프로필 수정
- `POST /api/user/verify-email` - 이메일 인증


#### 도서 관리

- `GET /api/books` - 도서 목록 조회
- `GET /api/books/{id}` - 도서 상세 조회
- `POST /api/books` - 도서 등록 (관리자)
- `PUT /api/books/{id}` - 도서 수정 (관리자)
- `DELETE /api/books/{id}` - 도서 삭제 (관리자)
- `POST /api/books/{id}/borrow` - 도서 대출
- `POST /api/books/{
