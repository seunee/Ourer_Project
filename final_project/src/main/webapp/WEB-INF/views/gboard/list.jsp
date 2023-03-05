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
		<table class="table table-hover text-center" style="margin-top: 30px;">
			<colgroup>
			<col width="10%" />
			<col width="50%" />
			<col width="15%" />
			<col width="15%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">말머리</th>				
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			<c:forEach items="${gbList }" var="gbvo">
			<c:choose>
			<c:when test="${gbvo.cate eq '공지' }">
				<tr>
					<td class="text-danger">${gbvo.cate }</td>
					<td><a href="/gboard/detail?gbno=${gbvo.gbno }" style="text-decoration: none">${gbvo.title }</a></td>
					<td>${gbvo.writer }</td>
					<td>${gbvo.regdate.substring(0,10) }</td>
					<td>${gbvo.view }</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td class="text-danger">${gbvo.cate }</td>
					<td><a href="/gboard/detail?gbno=${gbvo.gbno }" style="text-decoration: none">${gbvo.title }</a></td>
					<td>${gbvo.writer }</td>
					<td>${gbvo.regdate.substring(0,10) }</td>
					<td>${gbvo.view }</td>
				</tr>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</tbody>
		</table>
		<c:choose>
		<c:when test="${ses.email ne null }">
		<c:choose>
		<c:when test="${ses.email eq gvo.email }">
			<div class="text-end">
				<a href="/gboard/register?grno=${grno }"><button class="btn btn-outline-warning" type="button">작성</button></a>
			</div>
		</c:when>
		<c:when test="${fn:contains(uList, ses.email) }">
			<div class="text-end">
				<a href="/gboard/register?grno=${grno }"><button class="btn btn-outline-warning" type="button">작성</button></a>
			</div>
		</c:when>
		</c:choose>
		</c:when>
		</c:choose>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${gph.prev }">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${gph.startPage-1 }&qty=${gph.gpvo.qty }">Previous</a></li>
		    </c:if>
		    <c:forEach begin="${gph.startPage }" end="${gph.endPage }" var="i">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${gph.gpvo.qty }">${i }</a></li>
		    </c:forEach>
		    <c:if test="${gph.next }">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${gph.endPage+1 }&qty=${gph.gpvo.qty }">Next</a></li>
		    </c:if>
		  </ul>
		</nav>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>