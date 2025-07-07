<div align="center">

# 📚 InkTree
### 통합 도서관리 & 중고도서 거래 플랫폼

[![Java](https://img.shields.io/badge/Java-8+-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.0+-6DB33F?style=for-the-badge&logo=spring&logoColor=white)](https://spring.io/projects/spring-boot)
[![Oracle](https://img.shields.io/badge/Oracle-11g+-F80000?style=for-the-badge&logo=oracle&logoColor=white)](https://www.oracle.com/database/)
[![WebSocket](https://img.shields.io/badge/WebSocket-Real--time-4A90E2?style=for-the-badge&logo=websocket&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)

*현대적인 도서관리 시스템과 P2P 중고도서 거래를 하나의 플랫폼에서*

[🚀 Live Demo](#) • [📖 Documentation](#) • [🐛 Issues](https://github.com/your-repo/issues) • [💬 Discussions](https://github.com/your-repo/discussions)

</div>

---

## 🎯 프로젝트 개요

**InkTree**는 전통적인 도서관리 시스템의 한계를 극복하고, 사용자 중심의 통합 도서 생태계를 구축하기 위해 개발된 풀스택 웹 애플리케이션입니다. 

### 🌟 핵심 가치
- **📚 통합 관리**: 도서 대출부터 중고거래까지 원스톱 서비스
- **🔒 보안 우선**: JWT + OAuth2 기반 다층 보안 아키텍처
- **💬 실시간 소통**: WebSocket 기반 즉시 채팅 및 AI 상담
- **🎨 사용자 경험**: 반응형 디자인과 직관적 UI/UX

---

## ⚡ 주요 기능

<table>
<tr>
<td width="50%">

### 🔐 인증 & 보안
- **다중 인증 방식**: 일반/소셜 로그인 지원
- **JWT 토큰**: 무상태 인증 시스템
- **OAuth2 통합**: Naver, Kakao, Google
- **이메일 인증**: SMTP 기반 계정 검증

</td>
<td width="50%">

### 📖 도서 관리
- **스마트 검색**: 제목/저자/출판사 통합 검색
- **카테고리 분류**: 대분류/중분류 체계
- **대출 시스템**: 실시간 재고 관리
- **리뷰 시스템**: 평점 기반 도서 평가

</td>
</tr>
<tr>
<td width="50%">

### 🛒 중고거래
- **P2P 거래**: 개인간 직거래 플랫폼
- **실시간 채팅**: 판매자-구매자 즉시 소통
- **관심 목록**: 찜하기 및 알림 기능
- **거래 이력**: 투명한 거래 기록 관리

</td>
<td width="50%">

### 🤖 AI & 자동화
- **Gemini AI**: 도서 추천 챗봇
- **스마트 알림**: 실시간 이벤트 알림
- **자동 분류**: 카테고리 자동 태깅
- **추천 엔진**: 개인화된 도서 추천

</td>
</tr>
</table>

---

## 🏗️ 시스템 아키텍처

```mermaid title="InkTree System Architecture" type="diagram"
graph TB
    subgraph "Client Layer"
        A["Web Browser"]
        B["Mobile Browser"]
    end
    
    subgraph "Presentation Layer"
        C["JSP + Bootstrap"]
        D["JavaScript/jQuery"]
    end
    
    subgraph "Application Layer"
        E["Spring Boot"]
        F["Spring MVC"]
        G["Spring Security"]
        H["WebSocket"]
    end
    
    subgraph "Business Layer"
        I["Service Layer"]
        J["JWT Handler"]
        K["OAuth2 Provider"]
    end
    
    subgraph "Data Layer"
        L["MyBatis"]
        M["Oracle Database"]
    end
    
    subgraph "External APIs"
        N["Naver SMTP"]
        O["Kakao Address"]
        P["Google Gemini"]
        Q["OAuth Providers"]
    end
    
    A --> C
    B --> C
    C --> E
    D --> H
    E --> I
    F --> I
    G --> J
    I --> L
    L --> M
    J --> Q
    I --> N
    I --> O
    I --> P
