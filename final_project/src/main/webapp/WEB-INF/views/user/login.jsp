<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
.loginbox{
	width: 500px;
	margin: 100px auto 20px auto;
	border: 1px solid #FFD34A;
	border-radius: 20px;
	padding: 30px 10px;
}
.form-control{
	outline: none;
	
}
.loginBtn{
	width: 100px;
	margin: 10px auto;
}
.forgetpw{
	width: 200px;
	margin: 0 auto;
}

</style>
<section>
	<form class="loginbox" action="/user/login" method="post">
	  <div class="form-floating mb-3">
	  <input type="email" class="form-control" id="floatingInput" name="email" placeholder="email@ourer.com">
	  <label for="floatingInput">아이디</label>
	</div>
	<div class="form-floating">
	  <input type="password" class="form-control" id="floatingPassword" name="pw" placeholder="password">
	  <label for="floatingPassword">비밀번호</label>
	</div>
	<div class="loginBtn">
	<button class="btn btn-outline-warning" type="submit">LOGIN</button>
	</div>
	</form>
	<div class="forgetpw">
		<a href="/user/register">비밀번호를 잊으셨나요?</a>
	</div>
</section>

<script type="text/javascript">
   const msglogin = '<c:out value="${msglogin}"/>';
   if(msglogin==='0'){
      console.log(msglogin);
      alert("로그인에 실패했습니다.");
   }
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>