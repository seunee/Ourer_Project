<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
.firstBox{
	margin-top: 30px;
}

.grpName{
	font-weight: bold;
	text-shadow: #FFD34A 2px 2px 5px;
	
}

.nav-item > .groupNav{
	margin-left: 50px;
}
</style>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<div class="firstBox">
    	<ul class="nav nav-tab">
            	<li class="grpNavLi nav-item"><h1 class="grpName">${gvo.name }</h1></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/main?grno=${gvo.grno }">소모임 홈</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/gboard/list?grno=${gvo.grno }">게시판</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/memberList?grno=${gvo.grno }">멤버(${fn:length(uList)+1} / ${gvo.max_member })</a></li>
                <c:if test="${ses.email eq gvo.email }">
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/schedule/register?grno=${gvo.grno }">스케줄 생성</a></li>
                </c:if>
            </ul>
        </div>
	<form action="/gboard/register" method="post" style="margin:30px auto" enctype="multipart/form-data">
		<div class="form">
		<label for="cate" class="col-sm-1 col-form-label">말머리</label>
		   <select name="cate" class="form-select" aria-label="Default select example">
		   		<c:if test="${ses.email eq gvo.email }">
		   		<option value="공지">공지</option>
		   		</c:if>
		   		<option value="가입인사">가입인사</option>
		   		<option value="후기">후기</option>
		   		<option value="자유">자유</option>
		   </select>
		</div>
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${ses.nickname }" readonly>
		  </div>
		  <div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea class="form-control" id="content" name="content" style="height: 100px"></textarea>
		</div>
		<div class="col-12 d-grid" style="margin-top: 10px;">
			<input class="form-control" type="file" style="display: none;" id="files" name="files" multiple>
			<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
		</div>		
		<div class="col-12" id="fileZone">
				<!--파일이 첨부되면 해당 파일에 대한 정보가 표시됨-->
		</div>
		 <div class="d-grid gap-2 d-md-block text-end" style="margin-top: 20px;">
		  <button class="btn btn-outline-warning" id="registerBtn" type="submit">등록</button>
		  <a href="/gboard/list?grno=${grno }" class="btn btn-outline-warning">목록</a>
		 </div>
		 <input type="hidden" name="grno" value="${grno }">
	</form>
</section>
<script type="text/javascript" src="/resources/js/gboardRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>