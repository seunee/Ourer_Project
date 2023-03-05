<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<h2>관리자의 소모임 전체 리스트</h2>
	<table class="table caption-top text-center" style="margin: 30px auto">
	<colgroup>
			<col width="30%" />
         	<col width="30%" />
         	<col width="10%" />
			<col width="20%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">소모임 이름</th>
				<th scope="col">내용</th>
				<th scope="col">구성원 숫자</th>
				<th scope="col">생성일</th>
				<th scope="col">삭제 기능</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			<c:forEach items="${gList }" var="gvo" varStatus="status">
			<c:set var="wvo" value="${wList[status.index] }"/>
				<tr data-grno="${gvo.grno }">
					<td>${gvo.name }</td>
					<td>${gvo.detail }</td>
					<td>${wvo }</td>
					<td>
						${fn:substring(gvo.regdate,0, fn:indexOf(gvo.regdate," ")) }
					</td>
					<td>
					<button class="btn btn-sm btn-outline-danger del" type="button">삭제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
</section>

<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/groupListRemove.js">
</script>
<script type="text/javascript">
const grnoVal='<c:out value="${gvo.grno }"/>';
console.log(grnoVal);
</script>
