<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<h3>가입한 모든 회원</h3>
<table class="table caption-top text-center" style="margin: 30px auto">
			<colgroup>
			<col width="15%" />
         	<col width="25%" />
         	<col width="25%" />
         	<col width="20%" />
			<col width="15%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">전화 번호</th>
				<th scope="col">회원 등급</th>
				<th scope="col">강퇴 기능</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${uList }" var="uvo" varStatus="status">
				<c:set var="wvo" value="${wList[status.index] }"/>
					<tr data-email="${uvo.email }">
						<td>${uvo.name }</td>
						<td>${uvo.email }</td>
						<td>${uvo.phone }</td>
						<c:choose>
							<c:when test="${uvo.email eq 'super@ourer.com' }">
								<td>관리자</td>
							</c:when>
							<c:when test="${uvo.isCap != 0  }">
								<td>방장</td>
							</c:when>
							<c:when test="${wvo.grade =='B' }">
								<td>운영진</td>
							</c:when>
							<c:otherwise>
								<td>일반회원</td>
							</c:otherwise>
						</c:choose>
						<td><button class="btn btn-sm btn-outline-danger special del" type="button">강퇴</button></td>
					</tr>
				</c:forEach>
				
			
			</tbody>
		</table>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/supervisorUserDelete.js">
</script>