<%@page import="org.apache.ibatis.reflection.SystemMetaObject" %>
	<%@page import="com.boot.user.dto.UserDTO" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>게시글 수정 - 메트로하우스</title>
				<link rel="stylesheet" type="text/css" href="/resources/css/board_write.css">
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
				<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap"
					rel="stylesheet">
				<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
				<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
				<script src="/resources/js/board_update.js"></script>
				<script>
					function changeSort(sortType) {
						// 정렬 옵션 변경 시 처리
						const sortOptions = document.querySelectorAll('.sort-option');
						sortOptions.forEach(option => {
							option.classList.remove('active');
						});

						event.target.classList.add('active');

						// 실제 정렬 처리를 위한 AJAX 호출 또는 페이지 리로드 로직
						location.href = '/board_view?sort=' + sortType;
					}
				</script>
			</head>
<style>
	.ql-container {
		height: 400px;
	}
	
	.ql-editor {
		min-height: 400px;
	}
</style>
			<body>
    <jsp:include page="../header.jsp" />


					<div class="container">
						<div class="board-container">
							<div class="board-form">
								<div class="form-header">
									<!--					<div class="form-breadcrumb">-->
									<!--						<a href="/board_view" class="breadcrumb-link">-->
									<!--							<i class="fas fa-comments"></i> 커뮤니티 게시판-->
									<!--						</a>-->
									<!--						<i class="fas fa-chevron-right breadcrumb-separator"></i>-->
									<!--						<span class="breadcrumb-current">게시글 수정</span>-->
									<!--					</div>-->
									<h1 class="form-title">게시글 수정</h1>
									<p class="form-description">
										<i class="fas fa-info-circle"></i> 잉크트리 커뮤니티에서 자유롭게 의견을 나누고 소통해보세요.
									</p>
								</div>

								<form id="frm">
									<input type="hidden" name="userName" value="${user.userNumber}">
									<input type="hidden" name="boardNumber" value="${board.boardNumber}" />
									<input type="hidden" name="boardContent" id="boardContent">
									<input type="hidden" name="pageNum" value="${param.pageNum}">
									<input type="hidden" name="amount" value="${param.amount}">
									<input type="hidden" name="type" value="${param.type}">
									<input type="hidden" name="keyword" value="${param.keyword}">

									<div class="form-group">
										<label for="boardTitle" class="form-label">
											<i class="fas fa-heading"></i> 제목
										</label>
										<input type="text" id="boardTitle" name="boardTitle" class="form-control"
											value="${board.boardTitle}" placeholder="제목을 입력해주세요">
									</div>

									<div class="form-group">
										<label for="editor" class="form-label">
											<i class="fas fa-pen-fancy"></i> 내용
										</label>
										<div id="editor" class="editor-container">${board.boardContent}</div>
										<div id="contentError" class="error-message"></div>
									</div>

									<div class="form-actions">
										<button type="button" class="btn btn-secondary" onclick="history.back()">
											<i class="fas fa-times"></i> 취소
										</button>
										<button type="button" class="btn btn-primary" onclick="fn_submit()">
											<i class="fas fa-check"></i> 수정완료
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script type="text/javascript">
						function fn_submit() {
							const title = $('#boardTitle').val().trim();
							if (title === '') {
								alert('제목을 입력해주세요.');
								$('#title').focus();
								e.preventDefault();
								return false;
							}
							const content = quill.root.innerHTML;
							const plainText = quill.getText().trim();
							if (plainText === '') {
								alert('내용은 최소 10자 이상을 입력해주세요.');
								e.preventDefault();
								return false;
							}
							// // 유효성 검사
							// if (plainText.length < 1) {
							// 	document.getElementById('contentError').textContent = '내용은 최소 10자 이상 입력해주세요.';
							// 	return;
							// } else {
							// 	document.getElementById('contentError').textContent = '';
							// }

							document.getElementById('boardContent').value = content;

							// boardNumber 값을 미리 가져오기
							let boardNumber = $("input[name='boardNumber']").val();
							let pageNum = $("input[name='pageNum']").val();
							let amount = $("input[name='amount']").val();
							let type = $("input[name='type']").val();
							let keyword = $("input[name='keyword']").val();

							let formData = $("#frm").serialize();

							$.ajax({
								type: "post",
								url: "/board/update_ok",
								data: formData,
								success: function (data) {
									alert("게시글이 성공적으로 수정되었습니다.");
									console.log("test"+data)
									location.href = "/board/detail_view?boardNumber=" + boardNumber + 
													"&pageNum=" + pageNum + 
													"&amount=" + amount + 
													"&type=" + type + 
													"&keyword=" + keyword;
								},
								error: function () {
									alert("오류가 발생했습니다. 다시 시도해주세요.");
								}
							});
						}

						// Quill 에디터 초기화
						var quill = new Quill('#editor', {
							theme: 'snow',
							modules: {
								toolbar: [
									[{ 'header': [1, 2, 3, 4, 5, 6, false] }],
									['bold', 'italic', 'underline', 'strike'],
									[{ 'color': [] }, { 'background': [] }],
									[{ 'list': 'ordered' }, { 'list': 'bullet' }],
									[{ 'align': [] }],
									['link', 'image'],
									['clean']
								]
							},
							placeholder: '내용을 입력해주세요...'
						});
					</script>
			</body>

			</html>