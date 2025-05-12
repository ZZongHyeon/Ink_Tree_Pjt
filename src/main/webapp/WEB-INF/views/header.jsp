<%@page import="com.boot.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>잉크트리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <script>
        window.addEventListener("unload", function() {
            navigator.sendBeacon("/disconnect");
        });
    </script>
</head>
<body>
    <%
    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    String currentPage = request.getRequestURI();
    %>
    <header class="top-header">
        <div class="header-container">
            <div class="logo-section">
                <a href="/" class="logo-link">
                    <div class="logo-icon">
                        <i class="fa-solid fa-book-open"></i>
                    </div>
                    <span class="logo-text">잉크트리</span>
                </a>
            </div>

            <nav class="nav-links" id="navLinks">
                <a href="/" class="nav-link ${currentPage == 'main' ? 'active' : ''}">
                    <i class="nav-icon fa-solid fa-house"></i>
                    <span>메인</span>
                </a>
<!--				<a href="/admin_notice" class="nav-link ${currentPage == 'admin_notice' ? 'active' : ''}">-->
<!--				    <i class="nav-icon fa-solid fa-bullhorn"></i>-->
<!--					<span>공지사항</span>-->
<!--				</a> -->
                <a href="/admin_notice" class="nav-link ${currentPage == 'admin_notice' ? 'active' : ''}">
                    <i class="nav-icon fa-solid fa-bullhorn"></i>
                    <span>공지사항</span>
                </a>
                <a href="/board_view" class="nav-link ${currentPage == 'board_view' ? 'active' : ''}">
                    <i class="nav-icon fa-solid fa-clipboard-list"></i>
                    <span>게시판</span>
                </a>
                <a href="/trade_post_view" class="nav-link ${currentPage == 'trade_post_view' ? 'active' : ''}">
                    <i class="nav-icon fa-solid fa-cart-shopping"></i>
                    <span>거래게시판</span>
                </a>

            </nav>

            <div class="user-menu">
                <%
                if (user != null) {
                %>
                <div class="user-dropdown" id="userDropdown">
                    <button class="dropdown-toggle" id="dropdownToggle">
                        <div class="user-avatar">
                            <%=user.getUserName().substring(0, 1)%>
                        </div>
                        <span class="user-name"><%=user.getUserName()%> 님</span>
                        <span class="toggle-icon"><i class="fa-solid fa-chevron-down"></i></span>
                    </button>
                    <div class="dropdown-menu">
                        <div class="dropdown-header">
                            <div class="dropdown-header-bg"></div>
                            <div class="dropdown-header-content">
                                <div class="user-avatar large">
                                    <%=user.getUserName().substring(0, 1)%>
                                </div>
                                <div class="header-info">
                                    <div class="header-name"><%=user.getUserName()%> 님</div>
                                    <div class="header-email"><%=user.getUserEmail()%></div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown-menu-container">
                            <div class="dropdown-section">
                                <div class="dropdown-section-title">내 계정</div>
                                <a href="mypage" class="dropdown-item">
                                    <div class="dropdown-icon-wrapper">
                                        <i class="dropdown-icon fa-solid fa-user"></i>
                                    </div>
                                    <div class="dropdown-item-content">
                                        <div class="dropdown-item-title">마이페이지</div>
                                        <div class="dropdown-item-description">계정 정보 및 활동 내역 확인</div>
                                    </div>
                                </a>
<!--                                <a href="/user_update_view" class="dropdown-item">-->
<!--                                    <div class="dropdown-icon-wrapper">-->
<!--                                        <i class="dropdown-icon fa-solid fa-pen-to-square"></i>-->
<!--                                    </div>-->
<!--                                    <div class="dropdown-item-content">-->
<!--                                        <div class="dropdown-item-title">내정보수정</div>-->
<!--                                        <div class="dropdown-item-description">개인정보 및 설정 변경</div>-->
<!--                                    </div>-->
<!--                                </a>-->
                            </div>

                            <div class="dropdown-section">
                                <div class="dropdown-section-title">서비스</div>
<!--                                <a href="/favorite_apartment" class="dropdown-item">-->
<!--                                    <div class="dropdown-icon-wrapper">-->
<!--                                        <i class="dropdown-icon fa-solid fa-heart"></i>-->
<!--                                    </div>-->
<!--                                    <div class="dropdown-item-content">-->
<!--                                        <div class="dropdown-item-title">관심아파트</div>-->
<!--                                        <div class="dropdown-item-description">저장한 아파트 목록 관리</div>-->
<!--                                    </div>-->
<!--                                </a>-->
<!--                                <a href="/search_history" class="dropdown-item">-->
<!--                                    <div class="dropdown-icon-wrapper">-->
<!--                                        <i class="dropdown-icon fa-solid fa-clock-rotate-left"></i>-->
<!--                                    </div>-->
<!--                                    <div class="dropdown-item-content">-->
<!--                                        <div class="dropdown-item-title">검색 기록</div>-->
<!--                                        <div class="dropdown-item-description">최근 검색한 아파트 및 지역</div>-->
<!--                                    </div>-->
<!--                                </a>-->
								<a href="/search_history" class="dropdown-item">
								    <div class="dropdown-icon-wrapper">
								        <i class="dropdown-icon fa-solid fa-heart"></i>
								    </div>
								    <div class="dropdown-item-content">
								        <div class="dropdown-item-title">북마크</div>
								        <div class="dropdown-item-description">내가 찜한 도서 목록</div>
								    </div>
								</a>
								<a href="/trade_post_favorite_view" class="dropdown-item">
								    <div class="dropdown-icon-wrapper">
								        <i class="dropdown-icon fa-solid fa-store"></i>
								    </div>
								    <div class="dropdown-item-content">
								        <div class="dropdown-item-title">중고도서 북마크</div>
								        <div class="dropdown-item-description">거래게시판을 통해 찜한 도서 목록</div>
								    </div>
								</a>
								<a href="/user_book_borrowing" class="dropdown-item">
								    <div class="dropdown-icon-wrapper">
								        <i class="dropdown-icon fa-solid fa-book-open-reader"></i>
								    </div>
								    <div class="dropdown-item-content">
								        <div class="dropdown-item-title">대출기록</div>
								        <div class="dropdown-item-description">반납 & 대출 기록</div>
								    </div>
								</a>
                            </div>

                            <%
                            if (user.getUserAdmin() == 1) {
                            %>
                            <div class="dropdown-section">
                                <div class="dropdown-section-title">관리자</div>
                                <a href="admin_view" class="dropdown-item admin-item">
                                    <div class="dropdown-icon-wrapper">
                                        <i class="dropdown-icon fa-solid fa-gear"></i>
                                    </div>
                                    <div class="dropdown-item-content">
                                        <div class="dropdown-item-title">관리자모드 <span class="admin-badge">Admin</span></div>
                                        <div class="dropdown-item-description">사이트 관리 및 설정</div>
                                    </div>
                                </a>
                            </div>
                            <%
                            }
                            %>
                        </div>

                        <div class="dropdown-footer">
                            <a href="/privacy" class="dropdown-footer-link">개인정보처리방침</a>
                            <a href="/logout" class="logout-button">
                                <i class="fa-solid fa-right-from-bracket"></i>
                                로그아웃
                            </a>
                        </div>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="auth-buttons">
                    <a href="/loginForm" class="auth-link login-link">
                        <i class="fa-solid fa-right-to-bracket"></i> 로그인
                    </a>
                    <a href="/joinForm" class="auth-link register-link">
                        <i class="fa-solid fa-user-plus"></i> 회원가입
                    </a>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </header>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // User dropdown functionality
            const dropdownToggle = document.getElementById('dropdownToggle');
            const userDropdown = document.getElementById('userDropdown');

            if (dropdownToggle && userDropdown) {
                dropdownToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    userDropdown.classList.toggle('active');
                });

                // Close dropdown when clicking outside
                document.addEventListener('click', function(e) {
                    if (userDropdown && !userDropdown.contains(e.target)) {
                        userDropdown.classList.remove('active');
                    }
                });
            }

            // Header scroll effect
            const header = document.querySelector('.top-header');
            window.addEventListener('scroll', function() {
                if (window.scrollY > 10) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            });

            // Check initial scroll position
            if (window.scrollY > 10) {
                header.classList.add('scrolled');
            }
        });
    </script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	<%
	if (user != null) {
	%>
	<button class="chatbot-btn" id="chatbot-button">
		<i class="fas fa-comment-dots"></i>
	</button>
	<div class="chatbot-container">
		<div class="chatbot-header">
			<h3>AI 채팅 상담</h3>
			<button class="close-btn"><i class="fas fa-times"></i></button>
		</div>
		<div class="chatbot-messages">
			<div class="message bot">
				안녕하세요! 무엇을 도와드릴까요?
			</div>
		</div>
		<div class="chatbot-input">
			<input type="text" placeholder="메시지를 입력하세요...">
			<button class="send-btn"><i class="fas fa-paper-plane"></i></button>
		</div>
	</div>
	<%
	}
	%>

				<script>
					document.addEventListener('DOMContentLoaded', function() {
						const chatButton = document.getElementById('chatbot-button');
						const chatContainer = document.querySelector('.chatbot-container');
						const closeButton = document.querySelector('.close-btn');
						const sendButton = document.querySelector('.send-btn');
						const messageInput = document.querySelector('.chatbot-input input');
						const messagesContainer = document.querySelector('.chatbot-messages');

						// 채팅창 토글 기능
						chatButton.addEventListener('click', () => {
							chatContainer.classList.toggle('active'); // toggle로 변경
						});

						// X 버튼으로 닫기
						closeButton.addEventListener('click', () => {
							chatContainer.classList.remove('active');
						});

						// 메시지 전송
						function sendMessage() {
							const message = messageInput.value.trim();
							if (message) {
								// 사용자 메시지 추가
								const userMessage = document.createElement('div');
								userMessage.className = 'message user';
								userMessage.textContent = message;
								messagesContainer.appendChild(userMessage);

								// 입력창 비우기
								messageInput.value = '';

								// 스크롤을 가장 아래로
								messagesContainer.scrollTop = messagesContainer.scrollHeight;
								fetch('/chatbot/ask', {
									method: 'POST',
									headers: { 'Content-Type': 'application/json' },
									body: JSON.stringify({ message: message })
								})
										.then(res => res.json())
										.then(data => {
											// data.reply에 Gemini API 응답이 들어있음
											//showInChatbot(data.reply);

											const botMessage = document.createElement('div');
											botMessage.className = 'message bot';
											botMessage.textContent = data.reply;
											messagesContainer.appendChild(botMessage);
											messagesContainer.scrollTop = messagesContainer.scrollHeight;

										});

								// // 챗봇 응답
								// setTimeout(() => {
								//     const botMessage = document.createElement('div');
								//     botMessage.className = 'message bot';
								//     botMessage.textContent = "죄송합니다. 현재 응답을 준비중입니다.";
								//     messagesContainer.appendChild(botMessage);
								//     messagesContainer.scrollTop = messagesContainer.scrollHeight;
								// }, 1000);
							}
						}

						// 전송 버튼 클릭 이벤트
						sendButton.addEventListener('click', sendMessage);

						// Enter 키 입력 이벤트
						messageInput.addEventListener('keypress', (e) => {
							if (e.key === 'Enter') {
								sendMessage();
							}
						});

						// 채팅창 외부 클릭 시 닫기 (선택적)
						document.addEventListener('click', (e) => {
							if (!chatContainer.contains(e.target) && !chatButton.contains(e.target)) {
								chatContainer.classList.remove('active');
							}
						});
					});
					// 예시 (fetch 사용)


				</script>
</body>
</html>