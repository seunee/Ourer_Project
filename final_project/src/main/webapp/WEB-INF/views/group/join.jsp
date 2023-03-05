<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
.firstBox{
	margin-top: 30px;
	border-bottom: 1px solid gainsboro;
	padding-bottom: 20px;
	margin-bottom: 30px;
}

.grpName{
	font-weight: bold;
	text-shadow: #FFD34A 2px 2px 5px;
	
}

.nav-item > .groupNav{
	margin-left: 50px;
}
.outerBox{
	width: 700px;
	margin: auto;
	display: flex;
	justify-content: center;
}

input[type="checkbox"]{
	margin-right: 8px;
}

.btn-outline-warning{
	width: 100%;
}

.btn-outline-warning{
   width: none;
}
#grpJoinBtn{
   width: 100%;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
        <h2 style="text-align: center;">소모임 가입</h2><br>
    <div class="outerBox">
        <form action="/group/join" method="post" id="joinForm">
            <div class="row mb-3">
                <label for="nickname" class="col-sm-4 col-form-label fs-4">닉네임</label>
                <div class="col-sm-7 d-flex align-items-center">
                    <input type="text" class="form-control" name="nickname" id="nickname" value="${ses.nickname}" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label for="name" class="col-sm-4 col-form-label fs-4">이름</label>
                <div class="col-sm-7 d-flex align-items-center">
                    <input type="text" class="form-control" name="name" id="name" value="${ses.name}" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label for="age" class="col-sm-4 col-form-label fs-4">나이</label>
                <div class="col-sm-7 d-flex align-items-center">
                    <input type="text" id="age"  class="form-control" name="age" value="${ses.age}" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label for="gender" class="col-sm-4 col-form-label fs-4">성별</label>
                <div class="col-sm-7 d-flex align-items-center">
                <c:choose>
                	<c:when test="${ses.gender eq 0 }">
	                    <input type="text" id="gender" class="form-control" name="gender" value="남자" readonly>
                	</c:when>
                	<c:otherwise>
	                    <input type="text" id="gender" class="form-control" name="gender" value="여자" readonly>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div class="row mb-3">
                <label for="phone" class="col-sm-4 col-form-label fs-4">전화번호</label>
                <div class="col-sm-7 d-flex align-items-center">
                    <input type="text" id="phone" class="form-control" name="phone" value="${ses.phone}">
                </div>
            </div>
            <div class="row mb-3">
                <label for="checkBox" class="col-sm-4 col-form-label fs-4">유의사항</label>
                <div class="col-sm-10 flex-column mb-3 d-flex justify-content-start">
                	<label for="check1">
	                    <input type="checkbox" class="check" id="check1"><mark>아울러 공지사항을 확인했습니다.</mark>
                	</label>
                	<br>
                	<label for="check2">
                    	<input type="checkbox" class="check" id="check2"><mark>다른 회원들로부터 신고가 3회누적되면 활동에 제한이 생길 수 있습니다.</mark>
	                 </label>
	                 <br>
                	<label for="check3">
                    	<input type="checkbox" class="check" id="check3"><mark>적극적으로 모임 활동에 참여해주세요.</mark>
                    </label>
                    <br>
                	<label for="check4">
	                    <input type="checkbox" class="check" id="check4"><mark>영리목적의 모임이라면 관리자에게 신고해주세요.</mark>
                    </label>
                    <br>
                </div>
            </div>
            <button class="btn btn-outline-warning" type="button" id="grpJoinBtn">가입</button>
            <input type="hidden" name="email" value="${ses.email }">
            <input type="hidden" name="grno" value="${grno}" id="grno">
        </form>
</div>
</section>
<script type="text/javascript" src="/resources/js/groupJoin.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>