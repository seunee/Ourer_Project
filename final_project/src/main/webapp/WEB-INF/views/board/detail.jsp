<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<div style="margin:30px auto">
		<div class="form">
		    <label for="bno class="col-sm-1 col-form-label">번호</label>
		    <input type="" class="form-control" name="bno" id="bno" value="${bvo.bno }" readonly="readonly">
		 </div>
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title" value="${bvo.title }" readonly="readonly">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${bvo.writer }" readonly="readonly">
		  </div>
		<div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea rows="10" cols="100" class="form-control" id="content" name="content" readonly="readonly">${bvo.content }</textarea>
		</div>
		<div class="form">
		    <label for="regdate" class="col-sm-1 col-form-label">작성일</label>
		    <input type="text" class="form-control" id="regdate" name="regdate" value="${bvo.regdate }" readonly="readonly">
		</div>
		<div class="form">
		    <label for="view" class="col-sm-1 col-form-label">조회수</label>
		    <input type="text" class="form-control" id="view" name="view" value="${bvo.view }" readonly="readonly">
		</div>
	</div>
		<div class="text-end">
		<c:if test="${ses.name eq '관리자' }">
			<a href="/board/modify?bno=${bvo.bno}" class="btn btn-outline-warning">수정</a>
			<a href="/board/delete?bno=${bvo.bno}" class="btn btn-outline-warning">삭제</a>
		</c:if>
			<a href="/board/list" class="btn btn-outline-warning" >목록</a>
		</div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
