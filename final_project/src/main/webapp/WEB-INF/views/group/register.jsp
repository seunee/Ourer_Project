<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
.innerGroup{
	margin-top: 20px;
}

#checkDiv{
	width: 100%;
}

.form-check-input:checked{
	background-color: #FFD34A;
	border-color: #FFD34A;
}
#grpRegBtn{
	width: 100%;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<section>
		<div class="outerBox">
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 카테고리</h3>
	            </div>
	            <div class="innerSecond input-group mb-3">
	            	<label class="input-group-text" for="code">대분류</label>
	                <select class="form-select" aria-label="Default select example" name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
	                    <option value="대분류">대분류</option>
	                    <option value="A">운동</option>
	                    <option value="B">아웃도어/여행</option>
	                    <option value="C">독서</option>
	                    <option value="D">언어/외국</option>
	                    <option value="E">문화/공연/예술</option>
	                    <option value="F">음악/악기</option>
	                    <option value="G">공예/만들기</option>
	                    <option value="H">봉사활동</option>
	                    <option value="I">게임/오락</option>
	                    <option value="J">사진/영상</option>
	                    <option value="K">요리/제조</option>
	                    <option value="L">반려동물</option>
	                </select>
	                <label class="input-group-text" for="ctno">중분류</label>
	                <select class="form-select" aria-label="Default select example" name="ctno" id="ctno">
	                    <option value="">중분류</option>
	                </select>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 이름</h3>
	            </div>
	            <div class="innerSecond">
	                <input class="form-control" type="text" name="name" id="grpName" placeholder="소모임 이름을 입력해주세요.">
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>지역</h3>
	            </div>
	            <div class="innerSecond input-group mb-3">
	            <label class="input-group-text" for="city">전체</label>
	                <select class="form-select" aria-label="Default select example" name="city" id="city" onchange="spreadCounty(this.selectedIndex)">
	                    <option value="전체">전체</option>
	                    <option value="서울">서울특별시</option>
	                    <option value="부산">부산광역시</option>
	                    <option value="대구">대구광역시</option>
	                    <option value="인천">인천광역시</option>
	                    <option value="광주">광주광역시</option>
	                    <option value="대전">대전광역시</option>
	                    <option value="울산">울산광역시</option>
	                    <option value="세종">세종특별자치시</option>
	                    <option value="경기">경기도</option>
	                    <option value="강원">강원도</option>
	                    <option value="충북">충청북도</option>
	                    <option value="충남">충청남도</option>
	                    <option value="전북">전라북도</option>
	                    <option value="전남">전라남도</option>
	                    <option value="경북">경상북도</option>
	                    <option value="경남">경상남도</option>
	                    <option value="제주">제주특별자치도</option>
	                    
	                </select>
	                <label class="input-group-text" for="county">시/군/구</label>
	                <select class="form-select" aria-label="Default select example" name="county" id="county">
	                    <option value="">시/군/구</option>
	                </select>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 최대 멤버 수</h3>
	            </div>
	            <div class="innerSecond">
	                <input class="form-control" type="number" name="max_member" id="max_member" value="4" min="4">
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 특징</h3>
	            </div>
	            <div class="innerSecond mb-3" id="checkDiv">
	            	<div class="checkBox freeCheck input-group-text justify-content-between" style="width: 120px; float: left; margin-right: 5px;">
		                <label for="free" class="d-flex align-items-center">
		                    <input class="form-check-input mt-0" aria-label="Checkbox for following text input" type="checkbox" name="isFree" id="free" value=0 onclick="checkOnlyOne(this)">무료
		                </label>
		                <label for="nfree" class="d-flex align-items-center">
		                    <input class="form-check-input mt-0" aria-label="Checkbox for following text input" type="checkbox" name="isFree" id="nfree" value=1 onclick="checkOnlyOne(this)">유료
		                </label>
	            	</div>
	            	<div class="checkBox faceCheck input-group-text justify-content-between" style="width: 140px;">
		                <label for="face" class="d-flex align-items-center">
		                    <input class="form-check-input mt-0" aria-label="Checkbox for following text input" type="checkbox" name="isFace" id="face" value=1 onclick="checkOnlyOne(this)">대면
		                </label>
		                <label for="nface" class="d-flex align-items-center">
		                    <input class="form-check-input mt-0" aria-label="Checkbox for following text input" type="checkbox" name="isFace" id="nface" value=0 onclick="checkOnlyOne(this)">비대면
		                </label>
	            	</div>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 소개</h3>
	            </div>
	            <div class="innerSecond form-floating">
	                <textarea class="form-control" name="detail" placeholder="어떤 소모임인가요?" id="detail" style="height: 200px"></textarea>
	            	<label for="detail">어떤 소모임인가요?</label>
	            </div>
	        </div>
			<div class="innerGroup">
				<button class="btn btn-outline-warning" type="button" id="grpRegBtn">소모임 생성</button>
			</div>
	    </div>
	    <input type="hidden" name="email" id="email" value="${ses.email }">
</section>
<script type="text/javascript" src="/resources/js/groupRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>