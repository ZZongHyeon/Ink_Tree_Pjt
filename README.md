# Ink_Tree_Pjt

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


<details>
  <summary>쿼리문 (트리거 개별 실행)</summary>
  <pre><code>
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, 
      CREATE SYNONYM, CREATE PROCEDURE, CREATE TRIGGER, CREATE MATERIALIZED VIEW 
TO bookmanager;
GRANT SELECT ANY TABLE, INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE
TO bookmanager;
ALTER USER bookmanager DEFAULT TABLESPACE USERS;
ALTER USER bookmanager QUOTA UNLIMITED ON USERS;


CREATE TABLE USERINFO (
userNumber      NUMBER PRIMARY KEY,
userId          VARCHAR2(100),
userPw          VARCHAR2(100),
userName        VARCHAR2(100),
userTel         VARCHAR2(20),
userEmail       VARCHAR2(200),
userBirth       VARCHAR2(50),
userZipCode     VARCHAR2(50),
userAddress     VARCHAR2(300),
userDetailAddress VARCHAR2(500),
userBorrow      NUMBER DEFAULT 0,
userCanBorrow      NUMBER DEFAULT 5,
userAdmin       NUMBER DEFAULT 0,
userRegdate     DATE DEFAULT SYSDATE
);


CREATE TABLE user_sessions (
userId VARCHAR(50) PRIMARY KEY,
sessionId VARCHAR(100) NOT NULL,
loginTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE BOOKINFO (
bookNumber          NUMBER PRIMARY KEY,
bookIsbn            VARCHAR2(50) DEFAULT 0,
bookTitle           VARCHAR2(400),
bookComent          VARCHAR2(4000),
bookWrite           VARCHAR2(100),
bookPub             VARCHAR2(100),
bookDate            DATE,
bookMajorCategory   NVARCHAR2(100),
bookSubCategory     NVARCHAR2(100),
bookCount           NUMBER,
bookBorrowCount     NUMBER DEFAULT 0
);


CREATE TABLE NOTICE(
noticeNum            NUMBER PRIMARY KEY,
noticeTitle          VARCHAR2(500) NOT NULL,
noticeContent        VARCHAR2(4000) NOT NULL,
noticewriter         VARCHAR2(100) DEFAULT '관리자',
noticeregdate        DATE DEFAULT SYSDATE,
noticeviews          NUMBER DEFAULT 0,
noticeCategory       VARCHAR2(30)
);


CREATE TABLE BOARD (
boardNumber     NUMBER PRIMARY KEY,
userNumber      NUMBER,
userName        VARCHAR2(50),
boardTitle      VARCHAR2(1000),
boardContent    VARCHAR2(4000),
boardWriteDate  DATE DEFAULT SYSDATE,
boardHit        NUMBER DEFAULT 0,
boardViews      NUMBER DEFAULT 0,
boardLikes      NUMBER DEFAULT 0,
FOREIGN KEY (userNumber) REFERENCES USERINFO(userNumber)ON DELETE CASCADE
);


CREATE TABLE board_likes (
boardNumber number,
userNumber number,
PRIMARY KEY (boardNumber, userNumber)
);


CREATE TABLE BOARD_COMMENT (
commentNumber       NUMBER PRIMARY KEY,
commentSubNumber    NUMBER,
commentSubStepNumber NUMBER,
boardNumber         NUMBER,
userNumber          NUMBER,
userName            VARCHAR2(50),
commentContent      VARCHAR2(4000),
commentWriteDate    DATE DEFAULT SYSDATE,
COMMENTSTATUS VARCHAR2(10) DEFAULT 'ACTIVE'
);


ALTER TABLE BOARD_COMMENT
ADD CONSTRAINT fk_comment_board
FOREIGN KEY (boardNumber)
REFERENCES BOARD(boardNumber)
ON DELETE CASCADE;


ALTER TABLE BOARD_COMMENT
ADD CONSTRAINT fk_comment_user
FOREIGN KEY (userNumber)
REFERENCES USERINFO(userNumber)
ON DELETE CASCADE;
DESC board_comment;


CREATE TABLE BOOK_BORROW (
borrowNumber        NUMBER PRIMARY KEY,
userNumber          NUMBER,
bookNumber          NUMBER,
bookTitle           VARCHAR2 (400),
bookWrite           VARCHAR2 (100),
bookBorrowDate      DATE DEFAULT SYSDATE,
bookReturnDate      DATE,
bookMajorCategory   NVARCHAR2(100),
bookSubCategory     NVARCHAR2(100),
FOREIGN KEY (userNumber) REFERENCES USERINFO(userNumber)ON DELETE CASCADE,
FOREIGN KEY (bookNumber) REFERENCES BOOKINFO(bookNumber)ON DELETE CASCADE
);
CREATE TABLE Book_RECORD (
recordNumber  NUMBER PRIMARY KEY,
userNumber          NUMBER,
bookNumber          NUMBER,
bookTitle           VARCHAR2 (400),
bookWrite           VARCHAR2 (100),
bookBorrowDate      DATE,
bookReturnDate      DATE,
bookMajorCategory   NVARCHAR2(100),
bookSubCategory     NVARCHAR2(100),
FOREIGN KEY (userNumber) REFERENCES USERINFO(userNumber),
FOREIGN KEY (bookNumber) REFERENCES BOOKINFO(bookNumber)
);


CREATE TABLE BOOK_REVIEW (
REVIEWID NUMBER PRIMARY KEY,                -- 리뷰 고유 ID (시퀀스 사용)
BOOKNUMBER NUMBER NOT NULL,                 -- 도서 번호 (외래키) - 실제 타입으로 수정 필요
USERNUMBER NUMBER NOT NULL,                 -- 사용자 ID (외래키) - VARCHAR2(50)에서 NUMBER로 수정
REVIEWTITLE VARCHAR2(200) NOT NULL,         -- 리뷰 제목
REVIEWCONTENT CLOB NOT NULL,                -- 리뷰 내용 (긴 텍스트)
REVIEWRATING NUMBER(1) NOT NULL,            -- 평점 (1-5)
REVIEWDATE DATE DEFAULT SYSDATE,            -- 작성일
REVIEWMODIFIED_DATE DATE,                   -- 수정일
REVIEWSTATUS VARCHAR2(10) DEFAULT 'ACTIVE',           -- 상태 (Y: 활성, N: 삭제)


CONSTRAINT FK_REVIEW_BOOK FOREIGN KEY (BOOKNUMBER) REFERENCES BOOKINFO(BOOKNUMBER),
CONSTRAINT FK_REVIEW_USER FOREIGN KEY (USERNUMBER) REFERENCES USERINFO(USERNUMBER),
CONSTRAINT CHK_REVIEW_RATING CHECK (REVIEWRATING BETWEEN 1 AND 5)

    

  

);
-- 리뷰 ID 시퀀스
CREATE SEQUENCE SEQ_REVIEW_ID
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE TABLE REVIEW_HELPFUL (
HELPFUL_ID NUMBER PRIMARY KEY,
REVIEWID NUMBER NOT NULL,
USERNUMBER NUMBER NOT NULL,
HELPFUL_DATE DATE DEFAULT SYSDATE,
CONSTRAINT FK_REVIEW_HELPFUL_REVIEW FOREIGN KEY (REVIEWID) REFERENCES BOOK_REVIEW(REVIEWID),
CONSTRAINT FK_REVIEW_HELPFUL_USER FOREIGN KEY (USERNUMBER) REFERENCES USERINFO(USERNUMBER),
CONSTRAINT UQ_REVIEW_HELPFUL UNIQUE (REVIEWID, USERNUMBER)
);


-- 리뷰(도움됨)시퀀스 생성
CREATE SEQUENCE SEQ_HELPFUL_ID
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- 거래게시판
CREATE TABLE Trade_Post (
    postID NUMBER PRIMARY KEY,
    userNumber NUMBER NOT NULL,  -- userID에서 userNumber로 변경
    title VARCHAR2(100) NOT NULL,
    content CLOB NOT NULL,
    price NUMBER NOT NULL,
    status VARCHAR2(20) DEFAULT 'AVAILABLE', -- AVAILABLE, RESERVED, SOLD
    location VARCHAR2(100),
    viewCount NUMBER DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    BOOKMAJORCATEGORY VARCHAR2(100),
    BOOKSUBCATEGORY VARCHAR2(100),
    CONSTRAINT fk_tradePost_user FOREIGN KEY (userNumber) REFERENCES userinfo(userNumber)  -- 참조 컬럼 변경
);

-- 시퀀스 생성
CREATE SEQUENCE seqPostID START WITH 1 INCREMENT BY 1;

-- 채팅방
CREATE TABLE Trade_ChatRoom (
    roomID NUMBER PRIMARY KEY,
    postID NUMBER NOT NULL,
    sellerNumber NUMBER NOT NULL,  -- sellerID에서 sellerNumber로 변경
    buyerNumber NUMBER NOT NULL,   -- buyerID에서 buyerNumber로 변경
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastMessageAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20) DEFAULT 'ACTIVE', -- ACTIVE, INACTIVE, BLOCKED
    CONSTRAINT fk_chatRoom_post FOREIGN KEY (postID) REFERENCES TradePost(postID),
    CONSTRAINT fk_chatRoom_seller FOREIGN KEY (sellerNumber) REFERENCES userinfo(userNumber),  -- 참조 컬럼 변경
    CONSTRAINT fk_chatRoom_buyer FOREIGN KEY (buyerNumber) REFERENCES userinfo(userNumber),    -- 참조 컬럼 변경
    CONSTRAINT uq_chatRoom UNIQUE (postID, sellerNumber, buyerNumber)  -- 제약조건 컬럼명 변경
);

-- 시퀀스 생성
CREATE SEQUENCE seqRoomID START WITH 1 INCREMENT BY 1;

-- 채팅방 메세지
CREATE TABLE Trade_ChatMessage (
    messageID NUMBER PRIMARY KEY,
    roomID NUMBER NOT NULL,
    senderNumber NUMBER NOT NULL,  -- senderID에서 senderNumber로 변경
    message CLOB NOT NULL,
    readStatus VARCHAR2(10) DEFAULT 'UNREAD', -- READ, UNREAD
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_chatMessage_room FOREIGN KEY (roomID) REFERENCES ChatRoom(roomID),
    CONSTRAINT fk_chatMessage_sender FOREIGN KEY (senderNumber) REFERENCES userinfo(userNumber)  -- 참조 컬럼 변경
);

-- 시퀀스 생성
CREATE SEQUENCE seqMessageID START WITH 1 INCREMENT BY 1;

-- 중고도서 관심
CREATE TABLE Trade_Favorite (
    favoriteID NUMBER PRIMARY KEY,
    postID NUMBER NOT NULL,
    userNumber NUMBER NOT NULL,  -- userID에서 userNumber로 변경
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tradeFavorite_post FOREIGN KEY (postID) REFERENCES TradePost(postID),
    CONSTRAINT fk_tradeFavorite_user FOREIGN KEY (userNumber) REFERENCES userinfo(userNumber),  -- 참조 컬럼 변경
    CONSTRAINT uq_tradeFavorite UNIQUE (postID, userNumber)  -- 제약조건 컬럼명 변경
);

-- 시퀀스 생성
CREATE SEQUENCE seqFavoriteID START WITH 1 INCREMENT BY 1;

-- 거래내역
CREATE TABLE Trade_record (
    transactionID NUMBER PRIMARY KEY,
    postID NUMBER NOT NULL,
    sellerNumber NUMBER NOT NULL,  -- sellerID에서 sellerNumber로 변경
    buyerNumber NUMBER NOT NULL,   -- buyerID에서 buyerNumber로 변경
    price NUMBER NOT NULL,
    status VARCHAR2(20) DEFAULT 'PENDING', -- PENDING, COMPLETED, CANCELED
    completedAt TIMESTAMP,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transaction_post FOREIGN KEY (postID) REFERENCES TradePost(postID),
    CONSTRAINT fk_transaction_seller FOREIGN KEY (sellerNumber) REFERENCES userinfo(userNumber),  -- 참조 컬럼 변경
    CONSTRAINT fk_transaction_buyer FOREIGN KEY (buyerNumber) REFERENCES userinfo(userNumber)     -- 참조 컬럼 변경
);

-- 시퀀스 생성
CREATE SEQUENCE seqTransactionID START WITH 1 INCREMENT BY 1;

-- 거래 후기
CREATE TABLE Trade_Review (
    reviewID NUMBER PRIMARY KEY,z
    transactionID NUMBER NOT NULL,
    reviewerNumber NUMBER NOT NULL,  -- reviewerID에서 reviewerNumber로 변경
    revieweeNumber NUMBER NOT NULL,  -- revieweeID에서 revieweeNumber로 변경
    rating NUMBER(2,1) NOT NULL,
    content VARCHAR2(500),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_transaction FOREIGN KEY (transactionID) REFERENCES TradeTransaction(transactionID),
    CONSTRAINT fk_review_reviewer FOREIGN KEY (reviewerNumber) REFERENCES userinfo(userNumber),  -- 참조 컬럼 변경
    CONSTRAINT fk_review_reviewee FOREIGN KEY (revieweeNumber) REFERENCES userinfo(userNumber),  -- 참조 컬럼 변경
    CONSTRAINT uq_tradeReview UNIQUE (transactionID, reviewerNumber)  -- 제약조건 컬럼명 변경
);

-- 시퀀스 생성
CREATE SEQUENCE seqReviewID START WITH 1 INCREMENT BY 1;



--------------------------------------------- 시퀀스 드래그로 개별 컴파일
CREATE SEQUENCE  "BOOKMANAGER"."BORROWRECORD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE


--------------------------------------------- 트리거 드래그로 개별 컴파일
create or replace TRIGGER after_book_record_insert
after INSERT ON book_record
FOR EACH ROW

BEGIN
-- BOOKINFO 업데이트
UPDATE BOOKINFO
SET
BOOKCOUNT = BOOKCOUNT + 1
WHERE BOOKNUMBER = :NEW.BOOKNUMBER;

-- USERINFO 업데이트
UPDATE USERINFO
SET
    USERCANBORROW = USERCANBORROW + 1
WHERE USERNUMBER = :NEW.USERNUMBER;

END;
--------------------------------------------- 트리거 드래그로 개별 컴파일
create or replace TRIGGER before_book_record_insert
BEFORE INSERT ON book_record
FOR EACH ROW
DECLARE
v_borrowDate DATE;
v_borrowNumber NUMBER;
v_booktitle varchar2(400);
v_bookwrite varchar2(100);
v_bookmajor varchar2(100);
v_booksub   varchar2(100);
v_recordNumber number;
v_returnDate date default SYSDATE;
ex_no_borrow EXCEPTION;
BEGIN
-- 해당 대출 정보 유무 확인
SELECT borrowNumber, bookBorrowDate
INTO v_borrowNumber, v_borrowDate
FROM book_borrow
WHERE bookNumber = :NEW.bookNumber
AND userNumber = :NEW.userNumber;

select booktitle, bookwrite, bookmajorcategory, booksubcategory
into v_booktitle, v_bookwrite, v_bookmajor, v_booksub
from bookinfo
where bookNumber = :NEW.bookNumber;

 -- 새로운 borrowRecordNumber 미리 생성
SELECT NVL(MAX(recordNumber), 0) + 1
INTO v_recordNumber
FROM book_record;

:NEW.bookBorrowDate := v_borrowDate;
:NEW.bookReturnDate := v_returnDate;
:NEW.booktitle := v_booktitle;
:NEW.bookwrite := v_bookwrite;
:new.bookmajorcategory := v_bookmajor;
:new.booksubcategory := v_booksub;

-- 그 다음 BOOK_BORROW에서 삭제
DELETE FROM book_borrow
WHERE bookNumber = :NEW.bookNumber
  AND userNumber = :NEW.userNumber;
  
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20004, '대출 정보가 존재하지 않아 반납할 수 없습니다.');
END;
--------------------------------------------- 트리거 드래그로 개별 컴파일
create or replace TRIGGER trg_after_book_borrow_insert
-- AFTER 에서 BEFORE로 바뀜
-- 중복 대출 체크(조회)를 위해 before로 수정
BEFORE INSERT ON BOOK_BORROW
FOR EACH ROW
DECLARE
v_bookcount     NUMBER;
v_usercanborrow NUMBER;
v_count    NUMBER;
v_booktitle     varchar2(400);
v_bookwrite     varchar2(100);
v_bookmajor     varchar2(100);
v_booksub       varchar2(100);
ex_no_stock     EXCEPTION;
ex_no_quota     EXCEPTION;
ex_already_borrowed EXCEPTION;
BEGIN
-- 책 재고, 제목, 저자 확인
SELECT BOOKCOUNT, booktitle, bookwrite, bookmajorcategory, booksubcategory
INTO v_bookcount, v_booktitle, v_bookwrite, v_bookmajor, v_booksub
FROM BOOKINFO
WHERE BOOKNUMBER = :NEW.BOOKNUMBER;

:NEW.booktitle := v_booktitle;
:NEW.bookwrite := v_bookwrite;
:NEW.bookReturnDate := SYSDATE + 30;
:new.bookmajorcategory := v_bookmajor;
:new.booksubcategory := v_booksub;

-- 사용자 대출 가능 횟수 확인
SELECT USERCANBORROW INTO v_usercanborrow
FROM USERINFO
WHERE USERNUMBER = :NEW.USERNUMBER;

-- 중복 대출 체크
SELECT COUNT(*) INTO v_count
FROM BOOK_BORROW
WHERE USERNUMBER = :NEW.USERNUMBER
 AND BOOKNUMBER = :NEW.BOOKNUMBER;

IF v_count > 0 THEN
RAISE ex_already_borrowed;
END IF;

-- 예외 조건 검사
IF v_bookcount <= 0 THEN
    RAISE ex_no_stock;
ELSIF v_usercanborrow <= 0 THEN
    RAISE ex_no_quota;
END IF;

-- BOOKINFO 업데이트
UPDATE BOOKINFO
SET
    BOOKBORROWCOUNT = BOOKBORROWCOUNT + 1,
    BOOKCOUNT = BOOKCOUNT - 1
WHERE BOOKNUMBER = :NEW.BOOKNUMBER;

-- USERINFO 업데이트
UPDATE USERINFO
SET
    USERCANBORROW = USERCANBORROW - 1,
    USERBORROW = USERBORROW + 1
WHERE USERNUMBER = :NEW.USERNUMBER;

EXCEPTION
WHEN ex_no_stock THEN
RAISE_APPLICATION_ERROR(-20001, '도서 재고가 부족하여 대출할 수 없습니다.');
WHEN ex_no_quota THEN
RAISE_APPLICATION_ERROR(-20002, '회원의 대출 가능 권수가 0입니다.');
WHEN ex_already_borrowed THEN
RAISE_APPLICATION_ERROR(-20004, '이미 빌린 책 입니다');
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20003, '트리거 처리 중 오류 발생: ' || SQLERRM);
END;
  </code></pre>
</details>

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
