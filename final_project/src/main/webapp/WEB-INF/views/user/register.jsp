<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<style>
   .email_OK{
      color:#008000;
      display: none;
   }
   .email_NO{
      color:red; 
      display: none;
   }
   .nickName_OK{
      color:#008000;
      display: none;
   }
   .nickName_NO{
      color:red; 
      display: none;
   }
</style>

<section>
   <div class="allBox text-center" style="display: flex; justify-content: center; text-align: center;">
      <form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="return joinCheck(this)" style="margin-top: 30px;">
   <h2 style="text-align: center;">회원가입</h2><br>
         <!-- 아이디 -->
          <div class="row mb-3">
             <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
               <div class="col-sm-7">
                  <input type="email" class="form-control" id="email" placeholder="email@ourer.com" name="email">
             </div>
             <div class="col-sm">
                  <button type="button" class="btn btn-outline-secondary" onclick="emailCheck()">이메일 중복확인</button><br>
              </div>
          </div>
          <span class="email_OK">사용 가능한 아이디입니다.</span>
         <span class="email_NO">이미 사용중인 아이디입니다.</span><br>
         
         
         <!-- 프로필 파일 올리는부분 -->
         <div class="row mb-3" style="margin-top: 30px;">
         <label for="inputEmail3" class="col-sm-2 col-form-label">프로필사진</label>
            <div class="col-sm-1" style="display: none;">
                 <input type="file" class="form-control"  id="files" name="files">
              </div>
              <div class="col-sm-1">
                 <button class="btn btn-outline-secondary" type="button" id="trigger" style="padding: 5px 230px;">File</button>
            </div>
         <p style="font-size: 15px; color: red">※ 가입 이후 프로필 수정은 불가합니다.</p>
         </div>
         
         <div class="col-12" id="fileZone">
            <!-- 파일이 첨부되면 해당 파일에 대한 정보가 표시됨  -->
         </div>      
         
         
         <!-- 이름 -->
         <div class="row mb-3" style="margin-top: 30px;">
             <label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
               <div class="col-sm-7">
                  <input type="text" class="form-control" id="name" name="name">
             </div>
          </div>
         
                  <!-- 비밀번호 -->
         <div class="row mb-3" style="margin-top: 30px;">
            <p style="font-size: 15px;">숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력</p>
             <label for="inputEmail3" class="col-sm-2 col-form-label">비밀번호</label>
               <div class="col-sm-7">
                  <input type="password" class="form-control pw" id="pw" name="pw">
             </div>
          </div>
          <div class="row mb-3">
             <label for="inputEmail3" class="col-sm-2 col-form-label">비밀번호 확인</label>
               <div class="col-sm-7">
                  <input type="password" class="form-control pw" id="pw2" name="pw2">
             </div>
          </div>
          <font id = "checkPw" size = "3"></font> <br>
         
         <!-- 지역 -->
          <div class="row mb-3" style="margin-top: 30px;">
             <label for="inputEmail3" class="col-sm-2 col-form-label">지역</label>
               <div class="col-sm-7">
                  <input type="text" class="form-control" id="area" name="area">
             </div>
          </div>
          
         <!-- 닉네임 체크 -->
         <div class="row mb-3" style="margin-top: 30px;">
             <label for="inputEmail3" class="col-sm-2 col-form-label">닉네임</label>
               <div class="col-sm-7">
                  <input type="text" class="form-control" id="nickname" name="nickname">
             </div>
             <div class="col-sm">
                  <button type="button" class="nameChk btn btn-outline-secondary" id="nameChk" onclick="checkNickName()">닉네임 중복확인</button><br>
              </div>
          </div>
         <!-- nick_name ajax 중복체크 -->
         <span class="nickName_OK">사용 가능한 닉네임입니다.</span>
         <span class="nickName_NO">누군가 이 닉네임을 사용하고 있어요.</span><br>
   
         <!-- 나이 -->
          <div class="row mb-3" style="margin-top: 30px;">
             <label for="inputEmail3" class="col-sm-2 col-form-label">나이</label>
               <div class="col-sm-7">
                  <input type="text" class="form-control" id="age" name="age">
             </div>
          </div>
         
         <!-- 성별 -->
          <div class="row mb-3" style="margin-top: 30px;">
             <label for="inputEmail3" class="col-sm-2 col-form-label" style="margin-right: 15px">성별</label>
            <div class="form-check col-sm-1">
              <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="0" checked>
              <label class="form-check-label" for="flexRadioDefault1" value ='0'>
                남자
                 </label>
            </div>
            <div class="form-check col-sm-1" style="margin-left: 50px;">
              <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="1">
              <label class="form-check-label" for="flexRadioDefault2" value ='1'>
                여자
              </label>
            </div>
         </div>
         
         <!-- 전화번호 -->
          <div class="row mb-3" style="margin-top: 30px;">
             <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
               <div class="col-sm-7">
                  <input type="text" class="form-control" id="Phone" name="phone" oninput="hypenTel(this)" maxlength="13">
             </div>
          </div>
   
         <!-- 관심사 선택 -->
         <div class="innerSecond row g-9" style="margin-left: 3px; margin-top: 40px;">
            관심사1
            <div class="innerSecond col-auto" style="margin-right: 70px; margin-left: 20px;">
               <select class="form-select" name="code" id="code" onchange="spreadCtno(this.selectedIndex)" aria-label="Default select example">
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
               <select name="ctno_1" id="ctno" class="ctno_1 form-select" style="margin-top: 10px;">
                       <option value="0">중분류</option>
                  </select>
               </div>
         
             관심사2
            <div class="innerSecond2 col-auto" style="margin-right: 70px; margin-left: 20px;">
                      <select class="form-select" name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
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
                      <select name="ctno_2" id="ctno" class="ctno_2 form-select" style="margin-top: 10px;">
                          <option value="0">중분류</option>
                      </select>
                  </div>
                  
            관심사3
            <div class="innerSecond3 col-auto">
                    <select class="form-select" name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
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
                     <select name="ctno_3" id="ctno" class="ctno_3 form-select" style="margin-top: 10px;">
                         <option value="0">중분류</option>
                     </select>
                 </div>
              </div>
         <button id="userJoinBtn" class="btn btn-outline-warning" type="submit" style="margin: 100px 0; padding: 10px 60px;">가입</button>
      </form>
   </div>
</section>

<script type="text/javascript" src="/resources/js/UserRegister.js?version=4"></script>
<script type="text/javascript">
const hypenTel = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
      .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>