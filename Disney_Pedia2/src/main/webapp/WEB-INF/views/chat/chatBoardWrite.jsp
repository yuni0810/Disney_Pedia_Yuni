<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dain.css">
<script type="text/javascript">
	$(function() {
		write_action = function() {
			if ($('#title_chat').val() == '') {
				 Swal.fire({
			            title: ' ',
			            text: '제목을 입력하세요!',
			            imageUrl: '${pageContext.request.contextPath}/resources/images/warning_icon.png',
			            imageWidth: 70,
			            imageHeight: 70,
			            imageAlt: 'Custom image',
			            confirmButtonColor: '#84d7fa',
			            confirmButtonText: '확인',
			            width: 400,
			            padding: '2em'
			        })
				//alert('제목을 입력하세요!');		
				return;
			}
			if ($('#content_chat').val() == '') {
				 Swal.fire({
			            title: ' ',
			            text: '내용을 입력하세요!',
			            imageUrl: '${pageContext.request.contextPath}/resources/images/warning_icon.png',
			            imageWidth: 70,
			            imageHeight: 70,
			            imageAlt: 'Custom image',
			            confirmButtonColor: '#84d7fa',
			            confirmButtonText: '확인',
			            width: 400,
			            padding: '2em'
			        })
				//alert('내용을 입력하세요!');
				return;
			}
			if ($('#title_chat').val() != '' && $('#content_chat').val()!= '' ) {
				 Swal.fire({
			            title: ' ',
			            text: '게시글을 작성했습니다.',
			            imageUrl: '${pageContext.request.contextPath}/resources/images/ok_icon.png',
			            imageWidth: 70,
			            imageHeight: 70,
			            imageAlt: 'Custom image',
			            confirmButtonColor: '#84d7fa',
			            confirmButtonText: '확인',
			            width: 400,
			            padding: '2em'
			        }).then((result) => {
			            if (result.isConfirmed) {
			            	 $('#write_form').submit();
			            }
			        }) 
				
			}
		}
	});
</script>
<style>
* {
	font-family: 'SUIT-Medium';
}

div#main_body{
	padding: 35px;
	height: 500px
}
</style>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main">
	<form:form modelAttribute="chatBoardVO" action="write.do"
		id="write_form">
		<form:errors element="div" cssClass="error-color" />
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2"
						style="background-color: #eeeeee; text-align: center;"><img
						class="fit-picture"
						src="${pageContext.request.contextPath}/resources/images/disney.png";>
						게시글을 작성하세요 <img class="fit-picture"
						src="${pageContext.request.contextPath}/resources/images/disney.png";>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><form:input id="title_chat" path="title" type="text"
							class="form-control" placeholder="제목" name="title" maxlength="50"></form:input></td>
				</tr>
				<tr>
					<td><form:textarea id="content_chat" path="content"
							type="text" class="form-control" placeholder="내용" name="content"
							maxlength="2048" style="height: 350px; resize: none;"></form:textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="align-center">
			<button type="button" onclick="write_action()" id="chatwritebtn"
				class="btn btn-outline-primary">등록</button>
			<button type="button" onclick="location.href='list.do'"
				class="btn btn-outline-secondary">목록</button>
		</div>
	</form:form>
</div>

<!-- <section class="css-7klu3x"></section> -->
<!-- 중앙 컨텐츠 끝 -->
