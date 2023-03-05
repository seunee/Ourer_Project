<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<h3 style="margin-top: 30px">공지사항</h3>
		<table class="table table-hover text-center">
			<colgroup>
			<col width="10%" />
			<col width="50%" />
			<col width="15%" />
			<col width="15%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">공지</th>				
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			<c:forEach items="${list }" var="bvo">
			<tr>
			<c:choose>
			<c:when test="${bvo.pin > 0 }">
				<td class="text-danger">[필독]</td>
			</c:when>
			<c:otherwise>
				<td>[일반]</td>
			</c:otherwise>
			</c:choose>
				<td><a href="/board/detail?bno=${bvo.bno }" style="text-decoration: none">${bvo.title }</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate.substring(0,10) }</td>
				<td>${bvo.view }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
			<div class="text-end">
		<c:if test="${ses.name eq '관리자'}">
				<a href="/board/register"><button class="btn btn-outline-warning" type="button">작성</button></a>
		</c:if>
			</div>
			<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${pgh.prev }">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${pgh.startPage-1 }&qty=${pgh.pgvo.qty }">Previous</a></li>
		    </c:if>
		    <c:forEach begin="${pgh.startPage }" end="${pgh.endPage }" var="i">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${pgh.pgvo.qty }">${i }</a></li>
		    </c:forEach>
		    <c:if test="${pgh.next }">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${pgh.endPage+1 }&qty=${pgh.pgvo.qty }">Next</a></li>
		    </c:if>
		  </ul>
		</nav>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>