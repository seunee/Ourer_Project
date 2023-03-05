<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
		<ul class="nav nav-tabs">
		 <li class="nav-item dropdown"><h3>마이페이지</h3></li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">나의 소모임</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/user/mypage/${ses.email }">목록</a></li>
		      <li><a class="dropdown-item" href="/user/management/${ses.email }">관리</a></li>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/favorite/mylike/${ses.email }">찜</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/user/myinfo">개인정보수정</a>
		  </li>
		</ul>
		 <form action="/user/myinfo" style="margin: 30px auto">
		  <h4>개인정보수정</h4>
			<div class="form">
			    <label for="email" class="col-sm-1 col-form-label">아이디</label>
			    <input type="text" class="form-control" id="email" name="email" value="${ses.email }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="name" class="col-sm-1 col-form-label">이름</label>
			    <input type="text" class="form-control" id="name" name="name" value="${ses.name }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="area" class="col-sm-1 col-form-label">지역</label>
			    <input type="text" class="form-control" id="area" name="area" value="${ses.area }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="nickname" class="col-sm-1 col-form-label">닉네임</label>
			    <input type="text" class="form-control" id="nickname" name="nickname" value="${ses.nickname }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="age" class="col-sm-1 col-form-label">나이</label>
			    <input type="text" class="form-control" id="age" name="age" value="${ses.age }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="gender" class="col-sm-1 col-form-label">성별</label>
			    <input type="text" class="form-control" id="gender" name="gender" value="${ses.gender == 0? "남자":"여자" }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="phone" class="col-sm-1 col-form-label">연락처</label>
			    <input type="text" class="form-control" id="Phone" name="phone" value="${ses.phone }" readonly="readonly">
		    </div>
			<div class="row g-3">
				<div class="innerSecond col-auto">관심사1:
                   <select class="form-select" name="code" id="code1" onchange="spreadCtno(this.selectedIndex)">
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
                   <select class="form-select" name="ctno_1" id="ctno1" class="ctno_1">
                       <option value="0">중분류</option>
                   </select>
                   </div>
			<div class="innerSecond2 col-auto">관심사2:
                   <select class="form-select" name="code" id="code2" onchange="spreadCtno(this.selectedIndex)">
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
                   <select class="form-select" name="ctno_2" id="ctno2" class="ctno_2">
                       <option value="0">중분류</option>
                   </select>
               </div>
			<div class="innerSecond3 col-auto">관심사3: 
                 <select class="form-select" name="code" id="code3" onchange="spreadCtno(this.selectedIndex)">
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
                  <select class="form-select" name="ctno_3" id="ctno3" class="ctno_3">
                      <option value="0">중분류</option>
                  </select>
              </div>
              </div>
		    <div class="d-grid gap-2 d-md-block text-end">
		    	<a href="/user/modify?email=${ses.email }" class="btn btn-outline-warning">수정하기</a>
		    	<a href="/user/delete?email=${ses.email }" class="btn btn-outline-danger">계정삭제</a>
		    </div>
		    </form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/UserRegister.js"></script>
<script type="text/javascript">

//카테고리 선택옵션 고정
let ctnoAllList = [
    ...ctnoList[0],
    ...ctnoList[1],
    ...ctnoList[2],
    ...ctnoList[3],
    ...ctnoList[4],
    ...ctnoList[5],
    ...ctnoList[6],
    ...ctnoList[7],
    ...ctnoList[8],
    ...ctnoList[9],
    ...ctnoList[10],
    ...ctnoList[11],
    ...ctnoList[12],
]

let ctno1 = '<c:out value="${ses.ctno_1 }"/>';
let ctno2 = '<c:out value="${ses.ctno_2 }"/>';
let ctno3 = '<c:out value="${ses.ctno_3 }"/>';
console.log(ctno1); //번호 22

let ctcode1 = '<c:out value="${ses.ctcode_1 }"/>';
let ctcode2 = '<c:out value="${ses.ctcode_2 }"/>';
let ctcode3 = '<c:out value="${ses.ctcode_3 }"/>';
console.log(ctcode1); //코드 E

ctnoAllList[ctno1];
console.log(ctnoAllList[ctno1]); //텍스트 뮤지컬/오페라

let option1 = document.getElementById('code1'); //<select>대분류
let option2 = document.getElementById('code2');
let option3 = document.getElementById('code3');
console.log(option1);

let options1 = document.getElementById('ctno1'); //<select>중분류
let options2 = document.getElementById('ctno2');
let options3 = document.getElementById('ctno3');
console.log(options1);

let ctno_1 = option1.options[option1.selectedIndex].value;
console.log(ctno_1); //현재 고정되어있는 옵션 >> 대분류
console.log(option1.length); //13

for(var i=0; i<option1.length; i++){
    //console.log(ctcode1);
    //console.log(option1[i]);
    if(option1[i].value == ctcode1){
        option1[i].selected = true;
        //console.log(ctnoList[i]); // 선택된 중분류 목록
        //console.log(ctnoAllList[ctno1]); // 선택된 중분류
        // ctno.options[i] : 중분류의 i번째 옵션
        ctno = option1.nextElementSibling; // 해당되는 중분류 select 요소
        for(j=ctno.length-1; j>=0; j--) ctno.options[j] = null; // 기존에 있던 중분류 옵션 초기화
        for(j=0; j<ctnoList[i].length; j++) ctno.options[j]=new Option(ctnoList[i][j], ctnoList[i][j]);
        for(var j=0; j<options1.length; j++){
        if(options1[j].value == ctnoAllList[ctno1]){
        	options1[j].selected = true;
        }
        	
        }
    }
}

for(var i=0; i<option2.length; i++){
	if(option2[i].value == ctcode2){
		option2[i].selected = true;
        ctno = option2.nextElementSibling;
        for(j=ctno.length-1; j>=0; j--) ctno.options[j] = null;
        for(j=0; j<ctnoList[i].length; j++) ctno.options[j]=new Option(ctnoList[i][j], ctnoList[i][j]);
        for(var j=0; j<options2.length; j++){
            if(options2[j].value == ctnoAllList[ctno2]){
            	options2[j].selected = true;
            }
            	
            }
	}
}

for(var i=0; i<option3.length; i++){
	if(option3[i].value == ctcode3){
		option3[i].selected = true;
        ctno = option3.nextElementSibling;
        for(j=ctno.length-1; j>=0; j--) ctno.options[j] = null;
        for(j=0; j<ctnoList[i].length; j++) ctno.options[j]=new Option(ctnoList[i][j], ctnoList[i][j]);
        for(var j=0; j<options3.length; j++){
            if(options3[j].value == ctnoAllList[ctno3]){
            	options3[j].selected = true;
            }
            	
            }
	}
}
</script>