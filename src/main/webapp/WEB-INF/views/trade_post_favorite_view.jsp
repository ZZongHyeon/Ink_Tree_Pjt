<%@page import="com.boot.dto.UserDTO" %>
<%@page import="com.boot.trade.dto.TradePostDTO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심 목록 - 잉크트리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resources/css/trade_post_view.css">
    <style>
        /* 기본 스타일 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* 관심 목록 컨테이너 */
        .favorite-container {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 30px;
        }

        /* 헤더 섹션 */
        .favorite-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .favorite-title {
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
            color: #333;
        }

        .favorite-title i {
            margin-right: 10px;
            color: #e53e3e;
        }

        .favorite-count {
            background-color: #fee2e2;
            color: #e53e3e;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            margin-left: 10px;
        }

        .favorite-actions {
            display: flex;
            gap: 10px;
        }

        /* 필터 및 정렬 옵션 */
        .filter-options {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }



        /* 관심 목록 그리드 */
        .favorite-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .favorite-item {
            border: 1px solid #eee;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
            position: relative;
            background-color: white;
        }

        .favorite-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .favorite-item.sold {
            opacity: 0.7;
        }

        .favorite-item.reserved {
            border: 2px solid #f59e0b;
        }

        .favorite-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .favorite-image {
            height: 180px;
            background-color: #f1f5f9;
            position: relative;
            overflow: hidden;
        }

        .favorite-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .favorite-item:hover .favorite-image img {
            transform: scale(1.05);
        }

        .status-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 18px;
            z-index: 1;
        }

        .status-overlay.sold {
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
        }

        .status-overlay.reserved {
            background-color: rgba(245, 158, 11, 0.7);
            color: white;
        }

        .favorite-info {
            padding: 15px;
        }

        .favorite-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 10px;
            line-height: 1.4;
            height: 45px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .favorite-price {
            font-weight: 700;
            color: #e53e3e;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .favorite-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #666;
            margin-bottom: 10px;
        }

        .favorite-location {
            display: flex;
            align-items: center;
        }

        .favorite-location i {
            margin-right: 5px;
            color: #e53e3e;
        }

        .favorite-time {
            color: #777;
        }

        .favorite-seller {
            font-size: 13px;
            color: #666;
            display: flex;
            align-items: center;
        }

        .favorite-seller i {
            margin-right: 5px;
            color: #4a5568;
        }

        /* 관심 해제 버튼 */
        .unfavorite-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 32px;
            height: 32px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 2;
            border: none;
            transition: all 0.2s;
        }

        .unfavorite-btn i {
            color: #e53e3e;
            font-size: 16px;
        }

        .unfavorite-btn:hover {
            background-color: #e53e3e;
        }

        .unfavorite-btn:hover i {
            color: white;
        }

        /* 빈 상태 메시지 */
        .empty-favorites {
            text-align: center;
            padding: 50px 0;
            color: #777;
        }

        .empty-favorites i {
            font-size: 48px;
            color: #cbd5e0;
            margin-bottom: 15px;
        }

        .empty-favorites h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #4a5568;
        }

        .empty-favorites p {
            margin-bottom: 20px;
        }

        .browse-btn {
            display: inline-block;
            background-color: #3182ce;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.2s;
        }

        .browse-btn:hover {
            background-color: #2c5282;
        }

        /* 페이지네이션 */
        .div_page {
            margin-top: 30px;
            text-align: center;
        }

        .div_page ul {
            display: inline-flex;
            list-style: none;
            padding: 0;
        }

        .div_page li {
            margin: 0 5px;
        }

        .div_page li a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            text-decoration: none;
            color: #4a5568;
            font-weight: 500;
            transition: all 0.2s;
        }

        .div_page li a:hover {
            background-color: #e2e8f0;
        }

        .div_page li.active a {
            background-color: #3182ce;
            color: white;
        }

        .div_page li.paginate_button a {
            font-size: 14px;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .favorite-container {
                padding: 20px 15px;
            }
            
            .favorite-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .favorite-actions {
                width: 100%;
            }
            
            .filter-options, .sort-options {
                justify-content: flex-start;
                width: 100%;
                overflow-x: auto;
                padding-bottom: 5px;
            }
            
            .favorite-grid {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }
            
            .favorite-image {
                height: 150px;
            }
        }
    </style>
</head>

<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="favorite-container">
            <!-- 헤더 섹션 -->
            <div class="favorite-header">
                <h1 class="favorite-title">
                    <i class="fas fa-heart"></i> 관심 목록
                    <span class="favorite-count">${fn:length(favoriteList)}</span>
                </h1>
            </div>

            <!-- 필터 옵션 -->
            <div class="filter-options">
                <div class="filter-option ${param.status == 'all' || param.status == null ? 'active' : ''}" onclick="changeFilter('all')">전체</div>
                <div class="filter-option ${param.status == 'available' ? 'active' : ''}" onclick="changeFilter('available')">판매중</div>
                <div class="filter-option ${param.status == 'reserved' ? 'active' : ''}" onclick="changeFilter('reserved')">예약중</div>
                <div class="filter-option ${param.status == 'sold' ? 'active' : ''}" onclick="changeFilter('sold')">판매완료</div>
            </div>

            <!-- 정렬 옵션 -->
            <div class="sort-options">
                <div class="sort-option ${param.sort == 'latest' || param.sort == null ? 'active' : ''}" onclick="changeSort('latest')">최신순</div>
                <div class="sort-option ${param.sort == 'lowPrice' ? 'active' : ''}" onclick="changeSort('lowPrice')">낮은가격순</div>
                <div class="sort-option ${param.sort == 'highPrice' ? 'active' : ''}" onclick="changeSort('highPrice')">높은가격순</div>
            </div>

            <!-- 관심 목록 그리드 -->
            <div class="favorite-grid">
                <c:if test="${empty favoriteList}">
                    <div class="empty-favorites">
                        <i class="fas fa-heart-broken"></i>
                        <h3>관심 목록이 비어있습니다</h3>
                        <p>마음에 드는 상품을 찾아 하트 아이콘을 클릭해보세요!</p>
                        <a href="trade_post_view" class="browse-btn">상품 둘러보기</a>
                    </div>
                </c:if>

                <c:forEach items="${favoriteList}" var="post" varStatus="status">
                    <div class="favorite-item ${post.status == 'SOLD' ? 'sold' : post.status == 'RESERVED' ? 'reserved' : ''}">
                        <button class="unfavorite-btn" onclick="removeFavorite(${post.postID}, event)">
                            <i class="fas fa-heart"></i>
                        </button>
                        <a href="trade_post_detail_view?postID=${post.postID}&pageNum=${pageMaker.searchBookCriteriaDTO.pageNum}&amount=${pageMaker.searchBookCriteriaDTO.amount}&status=${empty param.status ? 'all' : param.status}&sort=${empty param.sort ? 'latest' : param.sort}" class="favorite-link">
                            <div class="favorite-image">
                                <c:if test="${post.status == 'SOLD'}">
                                    <div class="status-overlay sold">판매완료</div>
                                </c:if>
                                <c:if test="${post.status == 'RESERVED'}">
                                    <div class="status-overlay reserved">예약중</div>
                                </c:if>
                                <!-- 이미지가 있으면 표시, 없으면 기본 이미지 -->
                                <c:choose>
                                    <c:when test="${not empty post.imageUrl}">
                                        <img src="${post.imageUrl}" alt="${post.title}">
                                    </c:when>
                                    <c:otherwise>
                                        <div style="width:100%; height:100%; display:flex; align-items:center; justify-content:center; background-color:#f1f5f9;">
                                            <i class="fas fa-book" style="font-size:40px; color:#cbd5e0;"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="favorite-info">
                                <h3 class="favorite-title">${post.title}</h3>
                                <div class="favorite-price"><fmt:formatNumber value="${post.price}" pattern="#,###" />원</div>
                                <div class="favorite-meta">
                                    <span class="favorite-location"><i class="fas fa-map-marker-alt"></i> ${post.location}</span>
                                    <span class="favorite-time">
                                        <c:set var="dateStr" value="${post.createdAt}" />
                                        <c:if test="${not empty dateStr}">
                                            <c:choose>
                                                <c:when test="${fn:length(dateStr) > 10}">
                                                    ${fn:substring(dateStr, 0, 10)}
                                                </c:when>
                                                <c:otherwise>
                                                    ${dateStr}
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </span>
                                </div>
                                <div class="favorite-seller">
                                    <i class="fas fa-user"></i> ${post.userName}
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>

            <!-- 페이지네이션 -->
            <c:if test="${not empty favoriteList}">
                <div class="div_page">
                    <ul>
                        <c:if test="${pageMaker.prev}">
                            <li class="paginate_button">
                                <a href="${pageMaker.startPage - 1}">
                                    <i class="fas fa-caret-left"></i>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <li class="paginate_button ${pageMaker.searchBookCriteriaDTO.pageNum==num ? 'active' : ''}">
                                <a href="${num}">
                                    ${num}
                                </a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <li class="paginate_button">
                                <a href="${pageMaker.endPage+1}">
                                    <i class="fas fa-caret-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
            
            <!-- 페이징 처리를 위한 폼 -->
            <form id="actionForm" action="trade_post_favorite_view" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.searchBookCriteriaDTO.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.searchBookCriteriaDTO.amount}">
                <input type="hidden" name="status" value="${param.status}">
                <input type="hidden" name="sort" value="${param.sort}">
            </form>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // 페이징 처리
            var actionForm = $("#actionForm");

            // 페이지번호 처리
            $(".paginate_button a").on("click", function(e) {
                e.preventDefault();
                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                actionForm.submit();
            });
        });

        // 필터 변경
        function changeFilter(status) {
            var actionForm = $("#actionForm");
            actionForm.find("input[name='status']").val(status);
            actionForm.find("input[name='pageNum']").val("1");
            actionForm.submit();
        }

        // 정렬 변경
        function changeSort(sort) {
            var actionForm = $("#actionForm");
            actionForm.find("input[name='sort']").val(sort);
            actionForm.find("input[name='pageNum']").val("1");
            actionForm.submit();
        }

        // 관심 상품 제거
        function removeFavorite(postID, event) {
            event.preventDefault();
            event.stopPropagation();
            
            if (confirm("관심 목록에서 삭제하시겠습니까?")) {
                $.ajax({
                    type: "post",
                    url: "trade_post_like_toggle",
                    data: { 
                        postID: postID
                    },
                    success: function(response) {
                        if (response.success) {
                            // 해당 아이템 애니메이션과 함께 제거
                            const item = $(event.target).closest('.favorite-item');
                            item.fadeOut(300, function() {
                                item.remove();
                                
                                // 관심 목록 카운트 업데이트
                                const currentCount = parseInt($('.favorite-count').text());
                                $('.favorite-count').text(currentCount - 1);
                                
                                // 모든 아이템이 제거되었는지 확인
                                if ($('.favorite-item').length === 0) {
                                    $('.favorite-grid').html(`
                                        <div class="empty-favorites">
                                            <i class="fas fa-heart-broken"></i>
                                            <h3>관심 목록이 비어있습니다</h3>
                                            <p>마음에 드는 상품을 찾아 하트 아이콘을 클릭해보세요!</p>
                                            <a href="trade_post_view" class="browse-btn">상품 둘러보기</a>
                                        </div>
                                    `);
                                    
                                    // 페이지네이션 제거
                                    $('.div_page').remove();
                                }
                            });
                        } else {
                            alert("관심 상품 해제에 실패했습니다: " + response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("관심 상품 해제 중 오류가 발생했습니다.");
                        console.error("Error:", error);
                    }
                });
            }
        }
    </script>
</body>

</html>