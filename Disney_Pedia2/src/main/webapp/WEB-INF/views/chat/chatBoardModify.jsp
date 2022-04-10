<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dain.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<!-- 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 -->
<script type="text/javascript">
	$(function() {
		update_action = function() {
			if ($('#title_chat').val() == '') {
				alert('제목을 입력하세요!');		
				return;
			}
			if ($('#content_chat').val() == '') {
				alert('내용을 입력하세요!');
				return;
			}
			if ($('#title_chat').val() != '' && $('#content_chat').val()!= '' ) {
				 Swal.fire({
			            title: ' ',
			            text: '게시글을 수정했습니다.',
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
			            	 $('#update_form').submit();
			            }
			        }) 
				
			}
		}
	});
</script>
<style>
.ck-editor__editable_inline {
	min-height: 250px;
}
*{
	font-family: 'SUIT-Medium';
}

div#main_body{
	padding: 35px;
	height: 500px
}
</style>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main ">
	<form:form modelAttribute="chatboard" action="update.do" id="update_form">
		<form:hidden path="chatboard_num" />
		<form:errors element="div" cssClass="error-color" />
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2"
						style="background-color: #eeeeee; text-align: center;"><img
						class="fit-picture"
						src="${pageContext.request.contextPath}/resources/images/disney.png">
						게시글을 수정하세요 <img class="fit-picture"
						src="${pageContext.request.contextPath}/resources/images/disney.png">
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><form:input path="title" type="text" class="form-control" id="title_chat"
							placeholder="제목" name="title" maxlength="50"></form:input></td>
				</tr>
				<tr>
					<td><form:textarea path="content" class="form-control" id="content_chat"
							placeholder="내용" name="content" maxlength="2048"
							style="height: 350px;resize:none;"></form:textarea></td>
				</tr>
			</tbody>
		</table>
		<!-- 모집중,모집마감 radio -->
        <div>
		<input type="radio" name="mate_state" value="0" id="mate_state0" <c:if test="${chatboard.mate_state == 0}">checked</c:if>>
			<c:if test="${chatboard.mate_state == 0}"></c:if>
			<span class="badge rounded-pill bg-danger">모집 중!</span>
		<input type="radio" name="mate_state" value="1" id="smate_state1" <c:if test="${chatboard.mate_state == 0}">checked</c:if>>
			<c:if test="${chatboard.mate_state == 1}"></c:if>
			<span class="badge rounded-pill bg-light text-dark">모집 마감</span>
		</div>
		<!-- 수정 삭제 버튼 -->		
		<div class="align-center">		
			<button type="button" id="chat_modi"onclick="update_action()"
				class="btn btn-outline-primary">수정하기</button>
			<button type="button" onclick="location.href='list.do'"
				class="btn btn-outline-secondary">수정취소</button>	
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->	
<!-- <section class="css-7klu3x"></section> -->