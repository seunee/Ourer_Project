<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
.row{
	margin-top: 10px;
}
</style>
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
		 <form action="/user/modify" style="margin: 30px auto" method="post">
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
			    <input type="text" class="form-control" id="area" name="area" value="${ses.area }">
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
             <c:if test="${ses.gender eq 0 }">
             <input type="text" class="form-control"value="남자" readonly="readonly">
             <input type="hidden" class="form-control" id="gender" name="gender" value="${ses.gender }" readonly="readonly">
             </c:if>
             <c:if test="${ses.gender eq 1 }">
             <input type="text" class="form-control" value="여자" readonly="readonly">
             <input type="hidden" class="form-control" id="gender" name="gender" value="${ses.gender }" readonly="readonly">
             </c:if>
		    </div>
			<div class="form">
			    <label for="phone" class="col-sm-1 col-form-label">연락처</label>
			    <input type="text" class="form-control" id="Phone" name="phone" oninput="hypenTel(this)" maxlength="13" value="${ses.phone }">
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
                   <select class="form-select ctno" name="ctno_1" id="ctno1" class="ctno_1">
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
                   <select class="form-select ctno" name="ctno_2" id="ctno2" class="ctno_2">
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
                  <select class="form-select ctno" name="ctno_3" id="ctno3" class="ctno_3">
                      <option value="0">중분류</option>
                  </select>
              </div>
              </div>
		    <div class="d-grid gap-2 d-md-block text-end">
		    	<button class="btn btn-outline-warning" id="myinfoBtn" type="submit">수정</button>
		    </div>
		    </form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript">
//카테고리 중분류 
let ctnoList=new Array();
ctnoList[0]=new Array("중분류");
ctnoList[1]=new Array("조깅", "헬스", "필라테스", "수영", "테니스", "골프");
ctnoList[2]=new Array("등산", "캠핑", "낚시", "국내여행", "해외여행");
ctnoList[3]=new Array("책/독서", "인문학", "심리학", "철학", "작문/글쓰기");
ctnoList[4]=new Array("영어", "일본어", "중국어", "프랑스어", "스페인어");
ctnoList[5]=new Array("뮤지컬/오페라", "공연/연극", "영화", "전시회");
ctnoList[6]=new Array("노래/보컬", "기타/베이스", "드럼", "피아노", "밴드/합주");
ctnoList[7]=new Array("미술/그림", "플라워아트", "가죽공예", "가구/목공예", "도자/점토공예");
ctnoList[8]=new Array("양로원", "보육원", "환경봉사", "사회봉사", "유기견보호");
ctnoList[9]=new Array("다트", "보드게임", "온라인게임");
ctnoList[10]=new Array("영상제작/편집", "필름카메라", "DSLR", "디지털카메라");
ctnoList[11]=new Array("한식", "양식", "디저트", "제과/제빵");
ctnoList[12]=new Array("강아지", "고양이", "물고기", "소동물");

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
console.log(ctno1);

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

//ctno int로 변경하기
function ctnoNum(ctnoVal){
    let ctno=0;
    switch (ctnoVal) {
        case "조깅": ctno=1; break;
        case "헬스": ctno=2; break;
        case "필라테스": ctno=3; break;
        case "수영": ctno=4; break;
        case "테니스": ctno=5; break;
        case "골프": ctno=6; break;
        case "등산": ctno=7; break;
        case "캠핑": ctno=8; break;
        case "낚시": ctno=9; break;
        case "국내여행": ctno=10; break;
        case "해외여행": ctno=11; break;
        case "책/독서": ctno=12; break;
        case "인문학": ctno=13; break;
        case "심리학": ctno=14; break;
        case "철학": ctno=15; break;
        case "작문/글쓰기": ctno=16; break;
        case "영어": ctno=17; break;
        case "일본어": ctno=18; break;
        case "중국어": ctno=19; break;
        case "프랑스어": ctno=20; break;
        case "스페인어": ctno=21; break;
        case "뮤지컬/오페라": ctno=22; break;
        case "공연/연극": ctno=23; break;
        case "영화": ctno=24; break;
        case "전시회": ctno=25; break;
        case "노래/보컬": ctno=26; break;
        case "기타/베이스": ctno=27; break;
        case "드럼": ctno=28; break;
        case "피아노": ctno=29; break;
        case "밴드/합주": ctno=30; break;
        case "미술/그림": ctno=31; break;
        case "플라워아트": ctno=32; break;
        case "가죽공예": ctno=33; break;
        case "가구/목공예": ctno=34; break;
        case "도자/점토공예": ctno=35; break;
        case "양로원": ctno=36; break;
        case "보육원": ctno=37; break;
        case "환경봉사": ctno=38; break;
        case "사회봉사": ctno=39; break;
        case "유기견보호": ctno=40; break;
        case "다트": ctno=41; break;
        case "보드게임": ctno=42; break;
        case "온라인게임": ctno=43; break;
        case "영상제작/편집": ctno=44; break;
        case "필름카메라": ctno=45; break;
        case "DSLR": ctno=46; break;
        case "디지털카메라": ctno=47; break;
        case "한식": ctno=48; break;
        case "양식": ctno=49; break;
        case "디저트": ctno=50; break;
        case "제과/제빵": ctno=51; break;
        case "강아지": ctno=52; break;
        case "고양이": ctno=53; break;
        case "물고기": ctno=54; break;
        case "소동물": ctno=55; break;
    }
    return ctno;
}

for(var i=0; i<option1.length; i++){
    if(option1[i].value == ctcode1){
        option1[i].selected = true;
        ctno = option1.nextElementSibling;
        for(j=ctno.length-1; j>=0; j--) ctno.options[j] = null;
        for(j=0; j<ctnoList[i].length; j++) ctno.options[j]=new Option(ctnoList[i][j], ctnoNum(ctnoList[i][j]));
        for(var j=0; j<options1.length; j++){
        if(options1[j].value == ctno1){
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
        for(j=0; j<ctnoList[i].length; j++) ctno.options[j]=new Option(ctnoList[i][j], ctnoNum(ctnoList[i][j]));
        for(var j=0; j<options2.length; j++){
            if(options2[j].value == ctno2){
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
        for(j=0; j<ctnoList[i].length; j++) ctno.options[j]=new Option(ctnoList[i][j], ctnoNum(ctnoList[i][j]));
        for(var j=0; j<options3.length; j++){
            if(options3[j].value == ctno3){
            	options3[j].selected = true;
            }
            	
            }
	}
}

</script>

<script type="text/javascript" src="/resources/js/UserModify.js"></script>
<script type="text/javascript">
const hypenTel = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
      .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

</script>