<%@page import="com.boot.user.dto.UserDTO" %>
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
    <title>거래 게시글 상세 - 잉크트리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resources/css/trade/trade_post_detail_view.css">
</head>
<body>
			<jsp:include page="../header.jsp" />

    <div class="container">
        <div class="trade-detail-container">
            <!-- 상단 네비게이션 -->
            <div class="detail-nav">
<!--                <a href="board_view?pageNum=${param.pageNum}&amount=${param.amount}" class="back-link">-->
                <a href="/trade/post_view?pageNum=${param.pageNum}&amount=${param.amount}&status=${param.status}&sort=${param.sort}&keyword=${param.keyword}&bookMajorCategory=${param.bookMajorCategory}&bookSubCategory=${param.bookSubCategory}" class="back-link">
                <!-- <a href="/trade/post_view?pageNum=${param.pageNum}&amount=${param.amount}&status=${param.status}&sort=${param.sort}&keyword=${param.keyword}" class="back-link"> -->
                    <i class="fas fa-arrow-left"></i> 목록으로 돌아가기
                </a>
                <div class="post-info">
                    <span class="post-date">
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
                    <span class="post-views"><i class="fas fa-eye"></i> ${post.viewCount}</span>
                </div>
            </div>

            <!-- 게시글 헤더 -->
            <div class="post-header">
                <div class="post-title-container">
                    <h1 class="post-title">${post.title}</h1>
                    <div class="post-status ${post.status == 'AVAILABLE' ? 'available' : post.status == 'RESERVED' ? 'reserved' : 'sold'}">
                        ${post.status == 'AVAILABLE' ? '판매중' : post.status == 'RESERVED' ? '예약중' : '판매완료'}
                    </div>
                </div>
                <div class="post-price"><fmt:formatNumber value="${post.price}" pattern="#,###" />원</div>
            </div>

            <!-- 카테고리 및 위치 정보 -->
            <div class="post-meta">
                <div class="post-categories">
                    <span class="category-label">카테고리:</span>
                    <span class="category-item">${post.bookMajorCategory}</span>
                    <c:if test="${not empty post.bookSubCategory}">
                        <span class="category-divider">></span>
                        <span class="category-item">${post.bookSubCategory}</span>
                    </c:if>
                </div>
                <div class="post-location">
                    <i class="fas fa-map-marker-alt"></i> ${post.location}
                </div>
            </div>

            <!-- 판매자 정보 -->
            <div class="seller-info">
                <div class="seller-profile">
                    <div class="seller-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="seller-details">
                        <div class="seller-name">${post.userName}</div>
                        <div class="seller-rating">
                            <c:if test="${not empty topTags}">
                                <i class="fas fa-comment-dots"></i>가장 많이 받은 긍정 태그 3개가 표시됩니다.
                                <div class="seller-tags">
                                    <c:forEach var="topTags" items="${topTags}" varStatus="status">
                                        <span class="tag-item" data-tooltip="${topTags.tagExplan}">
                                            ${topTags.tagLabel} 
                                            <span class="tag-count">${topTags.cnt}</span>
                                        </span>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

				
				<c:if test="${user != null && user.userNumber != post.userNumber}">
				    <div class="action-buttons">
				        <button class="like-button ${isLiked ? 'active' : ''}" onclick="toggleLike(${post.postID})">
				            <i class="fas fa-heart"></i> 관심등록
				        </button>
						<a href="/chat/trade_chat?postID=${post.postID}&sellerNumber=${post.userNumber}&buyerNumber=${user.userNumber}" class="chat-btn">
						    <i class="fas fa-comment"></i> 채팅하기
						</a>
				    </div>
				</c:if>
            </div>

            <!-- 게시글 내용 -->
            <div class="post-content">
                ${post.content}
            </div>

            <!-- 관심, 조회수, 채팅수 정보 -->
            <div class="post-stats">
                <c:if test="${user != null && user.userNumber != post.userNumber}">
                    <button class="like-btn ${isLiked ? 'active' : ''}" onclick="toggleLike(${post.postID})">
                        <i class="fas fa-heart"></i> 관심 ${likeCount}
                    </button>
                </c:if>
                <c:if test="${user == null || user.userNumber == post.userNumber}">
                    <div class="stat-item">
                        <i class="fas fa-heart"></i> 관심 ${likeCount}
                    </div>
                </c:if>
                <div class="stat-item">
                    <i class="fas fa-eye"></i> 조회 ${post.viewCount}
                </div>
                <div class="stat-item">
                    <i class="fas fa-comment"></i> 채팅 ${chatCount}
                </div>
            </div>

            <!-- 작성자 또는 관리자만 볼 수 있는 버튼 -->
            <c:if test="${user != null && (user.userNumber == post.userNumber || user.userAdmin == 1)}">
                <div class="post-actions">
                    <!-- <button class="action-btn edit-btn" onclick="location.href='trade_post_update?postID=${post.postID}&amount=${param.amount}&status=${param.status}&sort=${param.status}&bookMajorCategory=${param.bookMajorCategory}&bookSubCategory=${param.bookSubCategory}'"> -->
                    <button class="action-btn edit-btn" onclick="location.href='trade_post_update?postID=${post.postID}&pageNum=${param.pageNum}&amount=${param.amount}&status=${param.status}&sort=${param.status}&keyword=${param.keyword}'">
                        <i class="fas fa-edit"></i> 수정
                    </button>
                    <button class="action-btn delete-btn" onclick="confirmDelete(${post.postID})">
                        <i class="fas fa-trash"></i> 삭제
                    </button>
			            <c:if test="${user != null && (user.userNumber == post.userNumber)}">
	                        <div class="status-change-container">
	                            <button class="action-btn status-btn" onclick="toggleStatusDropdown()">
	                                <i class="fas fa-tag"></i> 상태변경
	                            </button>
	                            <div class="status-dropdown" id="statusDropdown">
	                                <div class="status-option ${post.status == 'AVAILABLE' ? 'active' : ''}" 
	                                     onclick="changeStatus(${post.postID}, 'AVAILABLE')">
	                                    판매중
	                                </div>
	                                <div class="status-option ${post.status == 'RESERVED' ? 'active' : ''}" 
	                                     onclick="changeStatus(${post.postID}, 'RESERVED')">
	                                    예약중
	                                </div>
	                                <div class="status-option ${post.status == 'SOLD' ? 'active' : ''}" 
	                                     onclick="changeStatus(${post.postID}, 'SOLD')">
	                                    판매완료
	                                </div>
	                            </div>
	                        </div>
						</c:if>
                </div>
            </c:if>

            <!-- 판매중인 다른 게시글 섹션 -->
            <div class="related-posts-section">
                <h3 class="section-title">
                    <i class="fas fa-tags"></i> 판매중인 다른 게시글
                </h3>
                
                <div class="related-posts-grid">
                    <c:if test="${empty availablePosts}">
                        <div class="no-related-posts">
                            <p>판매중인 다른 게시글이 없습니다.</p>
                        </div>
                    </c:if>
                    
                    <c:forEach items="${availablePosts}" var="availablePost">
                        <div class="related-post-item">
<!--                            <a href="trade_post_detail_view?postID=${availablePost.postID}" class="related-post-link">-->
                            <a href="trade_post_detail_view?postID=${availablePost.postID}&pageNum=${param.pageNum}&amount=${param.amount}" class="related-post-link">
                                <div class="related-post-image">

                                </div>
                                <div class="related-post-info">
                                    <h4 class="related-post-title">${availablePost.title}</h4>
                                    <div class="related-post-price"><fmt:formatNumber value="${availablePost.price}" pattern="#,###" />원</div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- 삭제 확인 모달 -->
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>게시글 삭제</h3>
                <span class="close-modal" onclick="closeDeleteModal()">&times;</span>
            </div>
            <div class="modal-body">
                <p>정말 이 게시글을 삭제하시겠습니까?</p>
                <p class="warning-text">삭제된 게시글은 복구할 수 없습니다.</p>
            </div>
            <div class="modal-footer">
                <button class="cancel-btn" onclick="closeDeleteModal()">취소</button>
                <button class="confirm-btn" onclick="deletePost()">삭제</button>
            </div>
        </div>
    </div>


        <!-- 구매자 선택 팝업 -->
    <div class="modal" id="reviewSelectModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>구매자 선택</h3>
                <span class="close-modal" onclick="closeReviewModal()">&times;</span>
            </div>
            <div class="modal-body">
                <p>해당 거래의 구매자를 선택해주세요.</p>
                <ul id="chatUserList"></ul>
            </div>
        </div>
    </div>

<!-- 구매자 평점 태그 선택 팝업 -->
    <div class="modal" id="tagReviewModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>거래 평가</h3>
                <span class="close-modal" onclick="closeTagModal()">&times;</span>
            </div>
            <div class="modal-body">
                <div id="selectedTagPreview" class="selected-tags-preview">
                    <span class="chosen-empty">선택된 태그가 없습니다.</span>
                </div>
                <p>상대방에게 해당되는 태그를 선택해주세요.</p>

                <div id="tagListContainer">
                    <div id="goodTagList" class="tag-column"></div>
                    <div id="badTagList" class="tag-column"></div>
                </div>

                <button onclick="submitTagReview()">평가 등록</button>
                <button onclick="skipTagReview()" style="background:#aaa;">건너뛰기</button>
            </div>
        </div>
    </div>


    <!-- 페이지 이동을 위한 폼 -->
    <form id="actionForm" method="get">
        <input type="hidden" name="postID" value="${post.postID}">
        <input type="hidden" name="pageNum" value="${param.pageNum}">
        <input type="hidden" name="amount" value="${param.amount}">
        <c:if test="${not empty param.type}">
            <input type="hidden" name="type" value="${param.type}">
        </c:if>
        <c:if test="${not empty param.keyword}">
            <input type="hidden" name="keyword" value="${param.keyword}">
        </c:if>
        <c:if test="${not empty param.bookMajorCategory}">
            <input type="hidden" name="bookMajorCategory" value="${param.bookMajorCategory}">
        </c:if>
        <c:if test="${not empty param.bookSubCategory}">
            <input type="hidden" name="bookSubCategory" value="${param.bookSubCategory}">
        </c:if>
    </form>

    <script>
        

        // 게시글 삭제 확인 모달 표시
        function confirmDelete(postID) {
            document.getElementById('deleteModal').style.display = 'flex';
        }

        // 게시글 삭제 모달 닫기
        function closeDeleteModal() {
            document.getElementById('deleteModal').style.display = 'none';
        }

        // 게시글 삭제 실행
        function deletePost() {
            const postID = ${post.postID};
            
            $.ajax({
                type: "post",
                url: "/trade/trade_post_delete",
                data: { postID: postID },
                success: function(response) {
                    if (response.success) {
                        alert("게시글이 삭제되었습니다.");
                        // location.href = "trade_post_view?pageNum=${param.pageNum}&amount=${param.amount}";
                        location.href = "/trade/post_view";
                    } else {
                        alert("게시글 삭제에 실패했습니다: " + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert("게시글 삭제 중 오류가 발생했습니다.");
                    console.error("Error:", error);
                }
            });
        }

        // 상태 드롭다운 토글
        function toggleStatusDropdown() {
            const dropdown = document.getElementById('statusDropdown');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
            
            // 외부 클릭 시 드롭다운 닫기
            document.addEventListener('click', function closeDropdown(e) {
                if (!e.target.closest('.status-change-container')) {
                    dropdown.style.display = 'none';
                    document.removeEventListener('click', closeDropdown);
                }
            });
        }

        // 게시글 상태 변경
        function changeStatus(postID, status) {

            // 판매완료일 경우: getChatUser 먼저 호출
            if (status === 'SOLD') {
                openReviewPopup(postID);
                return;
            }

            $.ajax({
                type: "post",
                url: "update_trade_status",
                data: { 
                    postID: postID,
                    status: status
                },
            success: function(response) {
                if (response.success) {
                    alert("상태가 변경되었습니다.");

                    // 현재 URL에 skipViewCount=true 추가
                    let currentUrl = window.location.href;

                    if (!currentUrl.includes("skipViewCount=true")) {
                        if (currentUrl.includes("?")) {
                            currentUrl += "&skipViewCount=true";
                        } else {
                            currentUrl += "?skipViewCount=true";
                        }
                    }

                    // 새로고침 (조회수 증가 안 됨)
                    window.location.href = currentUrl;
                } else {
                    alert("상태 변경에 실패했습니다: " + response.message);
                }
            }

            });
        }

    // 구매자 선택 모달 열기
    function openReviewPopup(postID) {
        $.ajax({
            type: "get",
            url: "/trade/review/getChatUser",
            data: { postID: postID },
            success: function(list) {

                var html = '<li class="chat-user-item none-option" onclick="selectReviewUser(' + 
                        postID + ', ' + null + ', ' + null + ')" style="color: #999;">'
                        + '<i class="fas fa-times-circle"></i> 없음 (거래 취소)'
                        + '</li>';
                list.forEach(user => {
                    html +=
                    '<li class="chat-user-item" onclick="selectReviewUser('
                        + postID + ', ' + user.buyerNumber + ', \'' + user.buyerName + '\')">'
                        + '<i class="fas fa-user"></i> ' + user.buyerName
                        + '</li>';
                });
                $("#chatUserList").html(html);
                document.getElementById('reviewSelectModal').style.display = 'flex';
            },
            error: function() {
                alert("채팅 참여자 조회 중 오류가 발생했습니다.");
            }
        });
    }

    // 팝업 닫기
    function closeReviewModal() {
        document.getElementById('reviewSelectModal').style.display = 'none';
    }
    function selectReviewUser(postID, buyerNumber, buyerName) {
        if(buyerNumber === null && buyerName === null){

            if (!confirm("구매자 없이 거래를 종료하시겠습니까?")) {
                return;
            }

            $.ajax({
                type: "post",
                url: "update_trade_status",
                data: { postID: postID, status: 'SOLD' },
                success: function(response) {
                    if (response.success) {
                        alert("상태가 변경되었습니다.");

                        // 현재 URL에 skipViewCount=true 추가
                        let currentUrl = window.location.href;

                        if (!currentUrl.includes("skipViewCount=true")) {
                            if (currentUrl.includes("?")) {
                                currentUrl += "&skipViewCount=true";
                            } else {
                                currentUrl += "?skipViewCount=true";
                            }
                        }

                        // 새로고침 (조회수 증가 안 됨)
                        window.location.href = currentUrl;
                    } else {
                        alert("상태 변경에 실패했습니다: " + response.message);
                    }
                }
            });
            return;
        }
        if (!confirm(buyerName + "님과 거래를 완료하셨습니까?")) {
            return;
        }

        // 판매완료 상태 업데이트
        // 여기도 기록으로 남길것인가?
        $.ajax({
            type: "post",
            url: "/trade/review/record/insert",
            data: { postID: postID, buyerNumber: buyerNumber },
            success: function() {

                $.ajax({
                    type: "post",
                    url: "update_trade_status",
                    data: { postID: postID, status: 'SOLD' },
                    success: function(resp) {

                        openTagPopup(postID, buyerNumber);

                    },
                    error: function() {
                        alert("상태 변경 중 오류");
                    }
                });
            },
            error: function() {
                alert("거래기록 저장 오류");
            }
        });
    }

    function openTagPopup(postID, buyerNumber) {
        document.getElementById('tagReviewModal').style.display = 'flex';
        
        // 저장해두기
        window._reviewPostId = postID;
        window._reviewBuyerNumber = buyerNumber;

        loadTradeTags(); 
    }

function loadTradeTags() {
        $.ajax({
            type: "post",
            url: "/trade/review/getTags/data",
            success: function(tags) {
                let goodTags = tags.filter(tag => tag.tagType === 'GOOD');
                let badTags = tags.filter(tag => tag.tagType === 'BAD');
                
                let html = '';
                
                // GOOD 태그 섹션
                if (goodTags.length > 0) {
                    html += '<div class="tag-section">' +
                           '<div class="tag-section-header good">' +
                           '<i class="fas fa-thumbs-up"></i>' +
                           '<h4>좋았던 점</h4>' +
                           '</div>' +
                           '<div class="tag-wrapper">';
                    
                    goodTags.forEach(function(tag) {
                        html += '<div class="tag-item good" data-tooltip="' + tag.tagExplan +'">' +
                               '<input type="checkbox" class="tag-checkbox" id="tag-' + tag.tagCode + '" value="' + tag.tagCode + '" data-label="' + tag.tagLabel + '" data-type="' + tag.tagType + '">' +
                               '<label for="tag-' + tag.tagCode + '">' + tag.tagLabel + '</label>' +
                               '</div>';
                    });
                    
                    html += '</div></div>';
                }
                
                // BAD 태그 섹션
                if (badTags.length > 0) {
                    html += '<div class="tag-section">' +
                           '<div class="tag-section-header bad">' +
                           '<i class="fas fa-thumbs-down"></i>' +
                           '<h4>아쉬웠던 점</h4>' +
                           '</div>' +
                           '<div class="tag-wrapper">';
                    
                    badTags.forEach(function(tag) {
                        html += '<div class="tag-item bad" data-tooltip="' + tag.tagExplan +'">' +
                            '<input type="checkbox" class="tag-checkbox" id="tag-' + tag.tagCode + '" value="' + tag.tagCode + '" data-label="' + tag.tagLabel + '" data-type="' + tag.tagType + '">' +
                            '<label for="tag-' + tag.tagCode + '">' + tag.tagLabel + '</label>' +
                        '</div>';
                    });

                    
                    html += '</div></div>';
                }

                $("#tagListContainer").html(html);

                $(".tag-checkbox").on("change", updateSelectedTagPreview);
            },
            error: function() {
                $("#tagListContainer").html("<p>태그를 불러오지 못했습니다.</p>");
            }
        });
    }

    function updateSelectedTagPreview() {
        let selected = $(".tag-checkbox:checked");
        let html = "";

        if (selected.length > 5) {
            alert("최대 5개까지 선택 가능합니다!");
            $(this).prop("checked", false);
            return;
        }

        selected.each(function() {
            let label = $(this).data("label");
            html += "<span class='chosen-tag'>" + label + "</span>";
            $(this).closest(".tag-item").addClass("selected");
        });

        $(".tag-item").each(function() {
            if (!$(this).find(".tag-checkbox").prop("checked")) {
                $(this).removeClass("selected");
            }
        });

        if (selected.length === 0)
            html = "<span style='color:#aaa;'>선택된 태그 없음</span>";

        $("#selectedTagPreview").html(html);
    }






    function submitTagReview() {
        let selected = [];

        $(".tag-checkbox:checked").each(function() {
            selected.push($(this).val());
        });

        if (selected.length === 0) {
            alert("한 개 이상의 태그를 선택해주세요!");
            return;
        }

        if (selected.length > 5) {
            alert("태그는 최대 5개까지만 선택 가능합니다.");
            return;
        }

        $.ajax({
            type: "post",
            url: "/trade/review/insertTag",
            traditional: true,  // 배열 전송 위함
            data: {
                postID: window._reviewPostId,
                targetUserId: window._reviewBuyerNumber,
                tags: selected
            },
            success: function(resp){
                
                alert("평가가 등록되었습니다!");
                closeTagModal();
                location.reload();
            },
            error: function(){
                alert("태그 평가 등록 중 오류");
            }
        });
    }


    function closeTagModal() {
        document.getElementById('tagReviewModal').style.display = 'none';
    }

    function goTagReview(){
        location.href = "/trade/review?postID=" + window._reviewPostId + "&targetUserId=" + window._reviewBuyerNumber;
    }

    function skipTagReview(){
        alert("평가를 건너뛰었습니다.");
        location.reload();
    }

        // 관심 상품 토글
		function toggleLike(postID) {
		    $.ajax({
		        type: "post",
		        url: "trade_post_favorite",
		        data: { 
		            postID: postID
		        },
		        success: function(response) {
		            if (response.success) {
		                // 현재 URL 가져오기
		                let currentUrl = window.location.href;
		                
		                // URL에 skipViewCount 파라미터 추가
		                if (currentUrl.includes('?')) {
		                    if (currentUrl.includes('skipViewCount=')) {
		                        // 이미 skipViewCount 파라미터가 있는 경우
		                        window.location.reload();
		                    } else {
		                        // 다른 파라미터는 있지만 skipViewCount는 없는 경우
		                        window.location.href = currentUrl + '&skipViewCount=true';
		                    }
		                } else {
		                    // 파라미터가 없는 경우
		                    window.location.href = currentUrl + '?skipViewCount=true';
		                }
		            } else {
		                alert("관심 상품 등록/해제에 실패했습니다: " + response.message);
		            }
		        },
		        error: function(xhr, status, error) {
		            if (xhr.status === 401) {
		                alert("로그인이 필요합니다.");
		            } else {
		                alert("관심 상품 등록/해제 중 오류가 발생했습니다.");
		                console.error("Error:", error);
		            }
		        }
		    });
		}

        // 페이지 로드 시 실행
        document.addEventListener('DOMContentLoaded', function() {
            // ESC 키로 모달 닫기
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    closeDeleteModal();
                    closeChatModal();
                }
            });
            

            // 이미지 로드 오류 처리
            const images = document.querySelectorAll('img');
            images.forEach(img => {
                img.onerror = function() {
                    this.src = '/resources/images/no-image.png';
                };
            });
        });
    </script>
</body>

</html>