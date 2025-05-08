<%@page import="com.boot.dto.BookDTO"%>
<%@page import="com.boot.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.bookTitle} - 도서 상세</title>
    
    <!-- 폰트 및 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
        :root {
            --primary: #4F46E5;
            --primary-light: #EEF2FF;
            --primary-dark: #4338CA;
            --secondary: #10B981;
            --danger: #EF4444;
            --warning: #F59E0B;
            --gray-50: #F9FAFB;
            --gray-100: #F3F4F6;
            --gray-200: #E5E7EB;
            --gray-300: #D1D5DB;
            --gray-400: #9CA3AF;
            --gray-500: #6B7280;
            --gray-600: #4B5563;
            --gray-700: #374151;
            --gray-800: #1F2937;
            --gray-900: #111827;
            --radius: 0.5rem;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: var(--gray-50);
            color: var(--gray-800);
            line-height: 1.5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        /* 헤더 */
        .page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--gray-200);
        }

        .page-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--gray-900);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-link {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--gray-600);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .back-link:hover {
            color: var(--primary);
        }

        /* 메인 콘텐츠 */
        .book-detail {
            display: grid;
            grid-template-columns: 1fr;
            gap: 2rem;
        }

        @media (min-width: 768px) {
            .book-detail {
                grid-template-columns: 380px 1fr;
            }
        }

        /* 도서 이미지 및 액션 섹션 */
        .book-sidebar {
            position: sticky;
            top: 5rem; /* 헤더 높이를 고려하여 상단 여백 증가 */
            height: fit-content;
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 1.25rem;
            background-color: white;
            box-shadow: var(--shadow);
            z-index: 5; /* 다른 요소보다 위에 표시되도록 z-index 추가 */
        }

        .book-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 0.25rem;
            line-height: 1.3;
        }

        .book-author {
            font-size: 0.875rem;
            color: var(--gray-700);
            margin-bottom: 0.75rem;
        }

        .book-categories {
            display: flex;
            flex-wrap: wrap;
            gap: 0.375rem;
            margin-bottom: 0.75rem;
        }

        .book-category {
            background-color: var(--primary-light);
            color: var(--primary);
            padding: 0.25rem 0.5rem;
            border-radius: 2rem;
            font-size: 0.75rem;
            font-weight: 500;
            transition: all 0.2s;
        }

        .book-category:hover {
            background-color: var(--primary);
            color: white;
        }

        .book-image-section {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .book-cover {
            width: 100%;
            aspect-ratio: 3/2;
            background-color: var(--gray-100);
            border-radius: var(--radius);
            overflow: hidden;
            position: relative;
        }

        .book-cover-placeholder {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            color: var(--gray-400);
        }

        .book-cover-placeholder i {
            font-size: 3rem;
        }

        .book-info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 0.75rem;
            margin-bottom: 1rem;
        }

        .book-meta-item {
            display: flex;
            flex-direction: column;
            gap: 0.125rem;
        }

        .meta-label {
            font-size: 0.75rem;
            color: var(--gray-500);
            font-weight: 500;
        }

        .meta-value {
            font-size: 0.875rem;
            color: var(--gray-800);
            font-weight: 500;
        }

        .book-status {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .status-badge {
            display: flex;
            align-items: center;
            gap: 0.375rem;
            padding: 0.375rem 0.625rem;
            border-radius: var(--radius);
            font-weight: 500;
            font-size: 0.75rem;
        }

        .available {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--secondary);
        }

        .unavailable {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }

        .count-badge {
            background-color: var(--gray-100);
            color: var(--gray-700);
        }

        .book-actions {
            display: flex;
            flex-direction: column;
            gap: 0.625rem;
        }

        .action-button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.625rem 1rem;
            border-radius: var(--radius);
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            outline: none;
            text-decoration: none;
        }

        .primary-button {
            background-color: var(--primary);
            color: white;
        }

        .primary-button:hover {
            background-color: var(--primary-dark);
        }

        .primary-button:disabled {
            background-color: var(--gray-400);
            cursor: not-allowed;
        }

        .secondary-button {
            background-color: white;
            color: var(--primary);
            border: 1px solid var(--primary);
        }

        .secondary-button:hover {
            background-color: var(--primary-light);
        }

        .danger-button {
            background-color: var(--danger);
            color: white;
        }

        .danger-button:hover {
            background-color: #DC2626;
        }

        .admin-dropdown {
            position: relative;
            margin-top: 0.5rem;
        }

        .admin-dropdown-toggle {
            width: 100%;
            text-align: center;
            background-color: var(--gray-100);
            color: var(--gray-700);
            padding: 0.5rem;
            border-radius: var(--radius);
            cursor: pointer;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .admin-dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background-color: white;
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            box-shadow: var(--shadow-md);
            z-index: 10;
            margin-top: 0.25rem;
        }

        .admin-dropdown-menu.show {
            display: block;
        }

        .admin-dropdown-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.625rem 1rem;
            color: var(--gray-700);
            font-size: 0.875rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .admin-dropdown-item:hover {
            background-color: var(--gray-100);
        }

        .admin-dropdown-item.danger {
            color: var(--danger);
        }

        /* 도서 정보 섹션 */
        .book-content {
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            background-color: white;
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        /* 탭 섹션 */
        .tabs {
            border-bottom: 1px solid var(--gray-200);
        }

        .tab-list {
            display: flex;
            list-style: none;
            gap: 1rem;
            padding: 0 1.5rem;
        }

        .tab-item {
            padding: 1rem 0;
            font-weight: 500;
            color: var(--gray-500);
            cursor: pointer;
            border-bottom: 2px solid transparent;
            transition: all 0.2s;
        }

        .tab-item.active {
            color: var(--primary);
            border-bottom-color: var(--primary);
        }

        .tab-content {
            padding: 1.5rem;
        }

        .tab-panel {
            display: none;
        }

        .tab-panel.active {
            display: block;
        }

        /* 도서 설명 */
        .book-description {
            color: var(--gray-700);
            line-height: 1.7;
            font-size: 1rem;
        }

        /* 리뷰 섹션 */
        .reviews-section {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .review-stats {
            display: flex;
            align-items: center;
            gap: 2rem;
            padding: 1.5rem;
            background-color: var(--gray-100);
            border-radius: var(--radius);
            margin-bottom: 1.5rem;
        }

        .average-rating {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }

        .rating-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--gray-900);
        }

        .rating-count {
            font-size: 0.875rem;
            color: var(--gray-500);
        }

        .rating-stars {
            display: flex;
            gap: 0.25rem;
            color: var(--warning);
            font-size: 1.25rem;
        }

        .rating-distribution {
            flex: 1;
        }

        .rating-bar {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 0.5rem;
        }

        .rating-label {
            width: 1.5rem;
            text-align: right;
            font-size: 0.875rem;
            color: var(--gray-600);
        }

        .rating-progress {
            flex: 1;
            height: 0.5rem;
            background-color: var(--gray-200);
            border-radius: 1rem;
            overflow: hidden;
        }

        .rating-progress-fill {
            height: 100%;
            background-color: var(--warning);
        }

        .rating-percent {
            width: 2.5rem;
            font-size: 0.875rem;
            color: var(--gray-600);
        }

        .review-form {
            padding: 1.25rem;
            background-color: var(--gray-50);
            border-radius: var(--radius);
            margin-bottom: 1.5rem;
            border: 1px solid var(--gray-200);
        }

        .form-title {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.75rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--gray-700);
        }

        .rating-input {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .rating-input i {
            font-size: 1.5rem;
            color: var(--gray-300);
            cursor: pointer;
            transition: color 0.2s;
        }

        .rating-input i.active {
            color: var(--warning);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--gray-300);
            border-radius: var(--radius);
            font-size: 1rem;
            color: var(--gray-800);
            transition: border-color 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
        }

        .reviews-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .review-card {
            padding: 1.5rem;
            background-color: var(--gray-50);
            border-radius: var(--radius);
            border: 1px solid var(--gray-200);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .reviewer-info {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .reviewer-name {
            font-weight: 600;
            color: var(--gray-900);
        }

        .review-date {
            font-size: 0.875rem;
            color: var(--gray-500);
        }

        .review-rating {
            color: var(--warning);
        }

        .review-content {
            color: var(--gray-700);
            line-height: 1.6;
        }

        .review-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--gray-200);
        }

        .review-action {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--gray-500);
            font-size: 0.875rem;
            cursor: pointer;
            transition: color 0.2s;
        }

        .review-action:hover {
            color: var(--primary);
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 2rem;
        }

        .page-item {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 2.5rem;
            height: 2.5rem;
            border-radius: var(--radius);
            background-color: white;
            color: var(--gray-700);
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: var(--shadow-sm);
        }

        .page-item.active {
            background-color: var(--primary);
            color: white;
        }

        .page-item:hover:not(.active) {
            background-color: var(--gray-100);
        }

        /* 모달 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal.show {
            display: flex;
            animation: fadeIn 0.3s ease-out;
        }

        .modal-content {
            background-color: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow-lg);
            padding: 2rem;
            max-width: 500px;
            width: 90%;
            text-align: center;
        }

        .modal-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .modal-icon.success {
            color: var(--secondary);
        }

        .modal-icon.error {
            color: var(--danger);
        }

        .modal-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--gray-900);
        }

        .modal-message {
            font-size: 1rem;
            color: var(--gray-700);
            margin-bottom: 1.5rem;
        }

        .modal-actions {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        /* 애니메이션 */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .fade-in {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>

<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-book-open"></i> 도서 상세
            </h1>
            <a href="javascript:history.back()" class="back-link">
                <i class="fas fa-arrow-left"></i> 목록으로 돌아가기
            </a>
        </div>

        <div class="book-detail fade-in">
            <!-- 좌측 사이드바 -->
            <div class="book-sidebar">
                <h2 class="book-title">${book.bookTitle}</h2>
                <p class="book-author">${book.bookWrite}</p>
                
                <div class="book-categories">
                    <span class="book-category">${book.bookMajorCategory}</span>
                    <c:if test="${not empty book.bookSubCategory}">
                        <span class="book-category">${book.bookSubCategory}</span>
                    </c:if>
                </div>
                
                <div class="book-image-section">
                    <div class="book-cover">
                        <!-- 실제 구현 시 도서 이미지 경로를 사용해야함 -->
                        <!-- <img src="/resources/images/books/${book.bookNumber}.jpg" alt="${book.bookTitle}" 
                            onerror="this.style.display='none'; document.getElementById('placeholder-${book.bookNumber}').style.display='flex';"> -->
                        <div class="book-cover-placeholder" id="placeholder-${book.bookNumber}">
                            <i class="fas fa-book"></i>
                        </div>
                    </div>

                    <div class="book-status">
                        <div class="status-badge ${book.bookCount > 0 ? 'available' : 'unavailable'}">
                            <c:choose>
                                <c:when test="${book.bookCount > 0}">
                                    <i class="fas fa-check-circle"></i> 대출 가능
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-times-circle"></i> 대출 불가
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="status-badge count-badge">
                            <i class="fas fa-book"></i> 보유: ${book.bookCount}권
                        </div>
                        <div class="status-badge count-badge">
                            <i class="fas fa-chart-line"></i> 대출: ${book.bookBorrowcount}회
                        </div>
                    </div>

                    <div class="book-info-grid">
                        <div class="book-meta-item">
                            <span class="meta-label">출판사</span>
                            <span class="meta-value">${book.bookPub}</span>
                        </div>
                        <div class="book-meta-item">
                            <span class="meta-label">출판일</span>
                            <span class="meta-value">
                                <fmt:formatDate value="${book.bookDate}" pattern="yyyy.MM.dd" />
                            </span>
                        </div>
                        <div class="book-meta-item">
                            <span class="meta-label">ISBN</span>
                            <span class="meta-value">${book.bookIsbn}</span>
                        </div>
                    </div>

                    <div class="book-actions">
                        <c:choose>
                            <c:when test="${book.bookCount > 0}">
                                <button class="action-button primary-button" onclick="borrowBook(${book.bookNumber})">
                                    <i class="fas fa-hand-holding"></i> 대출하기
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="action-button primary-button" disabled>
                                    <i class="fas fa-hand-holding"></i> 대출 불가
                                </button>
                            </c:otherwise>
                        </c:choose>
                        <button class="action-button secondary-button" onclick="addToWishlist(${book.bookNumber})">
                            <i class="fas fa-heart"></i> 위시리스트에 추가
                        </button>
                        
                        <%
                        UserDTO user = (UserDTO) session.getAttribute("loginUser");
                        BookDTO book = (BookDTO) request.getAttribute("book");
                        
                        if (user != null && user.getUserAdmin() == 1) {
                        %>
                        <div class="admin-dropdown">
                            <div class="admin-dropdown-toggle" onclick="toggleAdminMenu()">
                                <i class="fas fa-cog"></i> 관리자 기능
                            </div>
                            <div class="admin-dropdown-menu" id="adminMenu">
                                <a href="/update_book?bookNumber=${book.bookNumber}" class="admin-dropdown-item">
                                    <i class="fas fa-edit"></i> 도서 정보 수정
                                </a>
                                <div class="admin-dropdown-item danger" onclick="confirmDelete(${book.bookNumber})">
                                    <i class="fas fa-trash"></i> 도서 삭제
                                </div>
                            </div>
                        </div>
                        <%
                        }
                        %>
                    </div>
                </div>
            </div>

            <!-- 우측 콘텐츠 영역 -->
            <div class="book-content">
                <div class="tabs">
                    <ul class="tab-list" role="tablist">
                        <li class="tab-item active" role="tab" aria-selected="true" data-tab="description">도서 소개</li>
                        <li class="tab-item" role="tab" aria-selected="false" data-tab="reviews">리뷰 및 평점</li>
                    </ul>

                    <div class="tab-content">
                        <div id="description" class="tab-panel active" role="tabpanel">
                            <div class="book-description">
                                <p>${book.bookComent}</p>
                            </div>
                        </div>

                        <div id="reviews" class="tab-panel" role="tabpanel">
                            <div class="reviews-section">
                                <div class="review-stats">
                                    <div class="average-rating">
                                        <div class="rating-value">4.5</div>
                                        <div class="rating-stars">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                        </div>
                                        <div class="rating-count">총 24개 리뷰</div>
                                    </div>
                                    <div class="rating-distribution">
                                        <div class="rating-bar">
                                            <span class="rating-label">5</span>
                                            <div class="rating-progress">
                                                <div class="rating-progress-fill" style="width: 70%"></div>
                                            </div>
                                            <span class="rating-percent">70%</span>
                                        </div>
                                        <div class="rating-bar">
                                            <span class="rating-label">4</span>
                                            <div class="rating-progress">
                                                <div class="rating-progress-fill" style="width: 20%"></div>
                                            </div>
                                            <span class="rating-percent">20%</span>
                                        </div>
                                        <div class="rating-bar">
                                            <span class="rating-label">3</span>
                                            <div class="rating-progress">
                                                <div class="rating-progress-fill" style="width: 5%"></div>
                                            </div>
                                            <span class="rating-percent">5%</span>
                                        </div>
                                        <div class="rating-bar">
                                            <span class="rating-label">2</span>
                                            <div class="rating-progress">
                                                <div class="rating-progress-fill" style="width: 3%"></div>
                                            </div>
                                            <span class="rating-percent">3%</span>
                                        </div>
                                        <div class="rating-bar">
                                            <span class="rating-label">1</span>
                                            <div class="rating-progress">
                                                <div class="rating-progress-fill" style="width: 2%"></div>
                                            </div>
                                            <span class="rating-percent">2%</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="review-form">
                                    <h3 class="form-title">리뷰 작성하기</h3>
                                    <form id="reviewForm" onsubmit="submitReview(event)">
                                        <div class="form-group">
                                            <label class="form-label">평점</label>
                                            <div class="rating-input">
                                                <i class="far fa-star" data-rating="1"></i>
                                                <i class="far fa-star" data-rating="2"></i>
                                                <i class="far fa-star" data-rating="3"></i>
                                                <i class="far fa-star" data-rating="4"></i>
                                                <i class="far fa-star" data-rating="5"></i>
                                            </div>
                                            <input type="hidden" name="rating" id="ratingInput" value="0">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="reviewTitle">제목</label>
                                            <input type="text" class="form-control" id="reviewTitle" name="title" placeholder="리뷰 제목을 입력하세요" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="reviewContent">내용</label>
                                            <textarea class="form-control" id="reviewContent" name="content" placeholder="리뷰 내용을 입력하세요" required></textarea>
                                        </div>
                                        <div class="form-actions">
                                            <button type="button" class="action-button secondary-button" onclick="resetReviewForm()">취소</button>
                                            <button type="submit" class="action-button primary-button">리뷰 등록</button>
                                        </div>
                                    </form>
                                </div>

                                <div class="reviews-list">
                                    <!-- 리뷰 예시 - 실제 구현 시 DB에서 가져온 리뷰로 대체 -->
                                    <div class="review-card">
                                        <div class="review-header">
                                            <div class="reviewer-info">
                                                <div class="reviewer-name">김독서</div>
                                                <div class="review-date">2025-05-01</div>
                                            </div>
                                            <div class="review-rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                        <h4>정말 좋은 책이에요!</h4>
                                        <div class="review-content">
                                            <p>이 책은 정말 훌륭한 내용을 담고 있습니다. 저자의 깊은 통찰력과 명확한 설명이 인상적이었습니다. 특히 3장의 내용은 실무에 바로 적용할 수 있어서 매우 유용했습니다. 강력 추천합니다!</p>
                                        </div>
                                    </div>

                                    <div class="review-card">
                                        <div class="review-header">
                                            <div class="reviewer-info">
                                                <div class="reviewer-name">박지식</div>
                                                <div class="review-date">2025-04-15</div>
                                            </div>
                                            <div class="review-rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>
                                        <h4>대체로 만족스러운 책</h4>
                                        <div class="review-content">
                                            <p>전반적으로 내용이 알차고 이해하기 쉽게 설명되어 있습니다. 다만 일부 내용은 조금 더 깊이 있게 다루었으면 하는 아쉬움이 있습니다. 그래도 입문자에게는 매우 좋은 책입니다.</p>
                                        </div>
                                    </div>

                                    <div class="review-card">
                                        <div class="review-header">
                                            <div class="reviewer-info">
                                                <div class="reviewer-name">이책벌레</div>
                                                <div class="review-date">2025-03-22</div>
                                            </div>
                                            <div class="review-rating">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>
                                        <h4>기대보다는 조금 아쉬웠어요</h4>
                                        <div class="review-content">
                                            <p>책의 전반부는 매우 좋았으나, 후반부로 갈수록 내용이 다소 산만해지는 느낌이었습니다. 그래도 기본 개념을 이해하는 데는 도움이 되었습니다.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="pagination">
                                    <div class="page-item active">1</div>
                                    <div class="page-item">2</div>
                                    <div class="page-item">3</div>
                                    <div class="page-item">
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 알림 모달 -->
    <div id="alertModal" class="modal">
        <div class="modal-content">
            <div id="modalIcon" class="modal-icon success">
                <i class="fas fa-check-circle"></i>
            </div>
            <h3 id="modalTitle" class="modal-title">알림</h3>
            <p id="modalMessage" class="modal-message"></p>
            <div class="modal-actions">
                <button id="modalButton" class="action-button primary-button" onclick="closeModal()">확인</button>
            </div>
        </div>
    </div>

    <!-- 삭제 확인 모달 -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <div class="modal-icon error">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            <h3 class="modal-title">도서 삭제</h3>
            <p class="modal-message">정말로 이 도서를 삭제하시겠습니까?</p>
            <div class="modal-actions">
                <button class="action-button secondary-button" onclick="closeDeleteModal()">취소</button>
                <button class="action-button danger-button" onclick="deleteBook()">삭제</button>
            </div>
        </div>
    </div>

    <!-- 폼 (AJAX 요청용) -->
    <form id="borrowForm" style="display: none;">
        <input type="hidden" name="bookNumber" id="borrowBookNumber" value="">
    </form>

    <form id="deleteForm" style="display: none;">
        <input type="hidden" name="bookNumber" id="deleteBookNumber" value="">
    </form>

    <script>
        // 탭 기능
        document.querySelectorAll('.tab-item').forEach(tab => {
            tab.addEventListener('click', () => {
                // 활성 탭 변경
                document.querySelectorAll('.tab-item').forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
                
                // 탭 패널 변경
                document.querySelectorAll('.tab-panel').forEach(panel => panel.classList.remove('active'));
                document.getElementById(tab.dataset.tab).classList.add('active');
            });
        });

        // 관리자 드롭다운 메뉴
        function toggleAdminMenu() {
            document.getElementById('adminMenu').classList.toggle('show');
        }

        // 클릭 시 드롭다운 메뉴 닫기
        window.addEventListener('click', function(event) {
            if (!event.target.matches('.admin-dropdown-toggle') && !event.target.closest('.admin-dropdown-toggle')) {
                const dropdowns = document.getElementsByClassName('admin-dropdown-menu');
                for (let i = 0; i < dropdowns.length; i++) {
                    const openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        });

        // 별점 선택 기능
        document.querySelectorAll('.rating-input i').forEach(star => {
            star.addEventListener('click', () => {
                const rating = parseInt(star.dataset.rating);
                document.getElementById('ratingInput').value = rating;
                
                // 별점 UI 업데이트
                document.querySelectorAll('.rating-input i').forEach((s, index) => {
                    if (index < rating) {
                        s.className = 'fas fa-star';
                    } else {
                        s.className = 'far fa-star';
                    }
                });
            });
            
            // 호버 효과
            star.addEventListener('mouseenter', () => {
                const rating = parseInt(star.dataset.rating);
                
                document.querySelectorAll('.rating-input i').forEach((s, index) => {
                    if (index < rating) {
                        s.className = 'fas fa-star';
                    } else {
                        s.className = 'far fa-star';
                    }
                });
            });
            
            star.addEventListener('mouseleave', () => {
                const currentRating = parseInt(document.getElementById('ratingInput').value);
                
                document.querySelectorAll('.rating-input i').forEach((s, index) => {
                    if (index < currentRating) {
                        s.className = 'fas fa-star';
                    } else {
                        s.className = 'far fa-star';
                    }
                });
            });
        });

        // 리뷰 폼 초기화
        function resetReviewForm() {
            document.getElementById('reviewForm').reset();
            document.getElementById('ratingInput').value = 0;
            document.querySelectorAll('.rating-input i').forEach(star => {
                star.className = 'far fa-star';
            });
        }

        // 리뷰 제출
        function submitReview(event) {
            event.preventDefault();
            
            const rating = document.getElementById('ratingInput').value;
            const title = document.getElementById('reviewTitle').value;
            const content = document.getElementById('reviewContent').value;
            
            if (rating === '0') {
                showModal('error', '평점 필요', '리뷰를 등록하려면 평점을 선택해주세요.');
                return;
            }
            
            // 실제 구현 시 AJAX 요청으로 리뷰 등록 기능 구현
            showModal('success', '리뷰 등록 완료', '리뷰가 성공적으로 등록되었습니다.');
            resetReviewForm();
            
            // 리뷰 목록 새로고침 (실제 구현 시)
            // refreshReviews();
        }

        // 대출하기
        function borrowBook(bookNumber) {
            document.getElementById('borrowBookNumber').value = bookNumber;
            
            $.ajax({
                type: "post",
                url: "book_borrow",
                data: $("#borrowForm").serialize(),
                success: function(responseText) {
                    if (responseText === "successBorrow") {
                        showModal('success', '대출 완료', '도서 대출이 성공적으로 완료되었습니다!');
                    } else {
                        showModal('error', '오류 발생', '알 수 없는 응답: ' + responseText);
                    }
                },
                error: function(xhr) {
                    const msg = xhr.responseText;
                    let errorTitle = '오류 발생';
                    let errorMessage = '알 수 없는 오류가 발생했습니다.';
                    
                    switch (msg) {
                        case "noUser":
                            errorTitle = '로그인 필요';
                            errorMessage = '로그인이 필요한 서비스입니다.';
                            break;
                        case "userInfoError":
                            errorMessage = '회원 정보가 올바르지 않아 대출에 실패했습니다.';
                            break;
                        case "userCanBorrowOver":
                            errorTitle = '대출 제한';
                            errorMessage = '대출 가능 권수를 초과했습니다.';
                            break;
                        case "alreadyBorrow":
                            errorTitle = '대출 중복';
                            errorMessage = '이미 대출 중인 도서입니다.';
                            break;
                    }
                    
                    showModal('error', errorTitle, errorMessage);
                }
            });
        }

        // 위시리스트에 추가
        function addToWishlist(bookNumber) {
            // 로그인 확인
            <% if (user == null) { %>
                showModal('error', '로그인 필요', '위시리스트 기능은 로그인 후 이용 가능합니다.');
                return;
            <% } %>
            
            // 실제 구현 시 AJAX 요청으로 위시리스트 추가 기능 구현
            showModal('success', '위시리스트 추가', '위시리스트에 추가되었습니다.');
        }

        // 도서 삭제 확인
        function confirmDelete(bookNumber) {
            document.getElementById('deleteBookNumber').value = bookNumber;
            document.getElementById('deleteModal').classList.add('show');
        }

        // 도서 삭제 실행
        function deleteBook() {
            $.ajax({
                type: "post",
                url: "book_delete",
                data: $("#deleteForm").serialize(),
                success: function(responseText) {
                    if (responseText === "successDelete") {
                        showModal('success', '삭제 완료', '도서가 성공적으로 삭제되었습니다.');
                        // 삭제 후 목록 페이지로 이동
                        setTimeout(function() {
                            location.href = "book_search_view?searchKeyword=&searchType=title&majorCategory=&subCategory=";
                        }, 1500);
                    } else {
                        showModal('error', '삭제 실패', '도서 삭제에 실패했습니다: ' + responseText);
                    }
                },
                error: function(xhr) {
                    showModal('error', '오류 발생', '서버 오류가 발생했습니다.');
                }
            });
            closeDeleteModal();
        }

        // 모달 표시
        function showModal(type, title, message) {
            const modal = document.getElementById('alertModal');
            const icon = document.getElementById('modalIcon');
            const iconElement = icon.querySelector('i');
            
            document.getElementById('modalTitle').textContent = title;
            document.getElementById('modalMessage').textContent = message;
            
            if (type === 'success') {
                icon.className = 'modal-icon success';
                iconElement.className = 'fas fa-check-circle';
            } else {
                icon.className = 'modal-icon error';
                iconElement.className = 'fas fa-exclamation-circle';
            }
            
            modal.classList.add('show');
        }

        // 모달 닫기
        function closeModal() {
            document.getElementById('alertModal').classList.remove('show');
            
            // 성공 메시지인 경우 페이지 새로고침
            if (document.getElementById('modalIcon').classList.contains('success')) {
                location.reload();
            }
        }

        // 삭제 모달 닫기
        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('show');
        }

        // 페이지 로드 시 알림 처리
        document.addEventListener('DOMContentLoaded', function() {
            <c:if test="${not empty errorMsg}">
                showModal('error', '오류 발생', "${errorMsg}");
            </c:if>
            
            <c:if test="${not empty successMSG}">
                showModal('success', '대출 완료', "${successMSG}");
            </c:if>
        });
    </script>
</body>
</html>
