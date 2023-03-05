<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<jsp:include page="./layout/header.jsp"></jsp:include>
<style>
.categoryall{
	width: 10%;
	float: left;
	margin-bottom: 100px;
}
.likecategory{
	width:90%;
	float:right;
	margin-bottom: 100px;
}
.icon{
	width: 130px;
	height: 130px;
	margin:10px;
	background: #f2f2e1;
	border: none;
	border-radius: 20px;
}
.keyicon{
	width: 90px;
	height: 280px;
	margin:10px;
	background: #f2f2e1;
	border: none;
	border-radius: 20px;
}
.categoryall > .keyicon >.fa-file{
	font-size: 2em;
	margin: 10px auto;
}
.likecategory>.icon>.fa-solid{
	font-size: 2em;
	margin: 10px auto;
}
.icontext{
	font-weight: bold;
	width: 100%;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
.icon{
	transition: all 0.2s ease-in-out;
}
.icon:hover {
	transform: scale(1.07);
}
.likecategory{
	margin-bottom: 50px;
}
.randomList{
	text-align: center;
	margin-top: 50px;
}
.like{
	text-align: center;
	margin: 40px 0;
}
.recommend{
   clear: both;
}
.test1{
   clear: both;
}
.card-body>.detail{
   overflow: hidden;
     text-overflow: ellipsis;
     display: -webkit-box;
     -webkit-line-clamp: 2;
     -webkit-box-orient: vertical;
}
</style>
<section>
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="margin-top: 50px; margin-bottom: 100px">
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-bs-interval="5000">
		      <img src="/resources/img/mainjava.gif" class="d-block w-100" height="500px">
		    </div>
		    <div class="carousel-item" data-bs-interval="5000">
		      <img src="/resources/img/maineat.gif" class="d-block w-100" height="500px">
		    </div>
		    <div class="carousel-item" data-bs-interval="5000">
		      <img src="/resources/img/mainphoto.jpg" class="d-block w-100" height="500px">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		 </div>
		  
		   <h3 class="like" style="margin: 30px auto; text-align: center">관심사</h3>
		   <div class="categoryall">
           <button type="button" class="keyicon" id="category_All" onclick="location.href='/category/categorymain'">
              <i class="fa-solid fa-file"></i>
              <span class="icontext">전체</span>
           </button>
		   </div>
        <div class="likecategory">
           <button type="button" class="icon" id="category_A" onclick="location.href='/category/categoryDetail?code=A'">
              <i class="fa-solid fa-person-running"></i>
              <span class="icontext">운동</span>
           </button>
           <button type="button" class="icon" id="category_B" onclick="location.href='/category/categoryDetail?code=B'">
              <i class="fa-solid fa-mountain-sun"></i>
              <span class="icontext">아웃도어/여행</span>
           </button>
           <button type="button" class="icon" id="category_C" onclick="location.href='/category/categoryDetail?code=C'">
              <i class="fa-solid fa-book"></i>
              <span class="icontext">독서</span>
           </button>
           <button type="button" class="icon" id="category_D" onclick="location.href='/category/categoryDetail?code=D'">
              <i class="fa-solid fa-language"></i>
              <span class="icontext">언어/외국</span>
           </button>
           <button type="button" class="icon" id="category_E" onclick="location.href='/category/categoryDetail?code=E'">
              <i class="fa-solid fa-building-columns"></i>
              <span class="icontext">문화/공연/예술</span>
           </button>
           <button type="button" class="icon" id="category_F" onclick="location.href='/category/categoryDetail?code=F'">
              <i class="fa-solid fa-music"></i>
              <span class="icontext">음악/악기</span>
           </button>
           <button type="button" class="icon" id="category_G" onclick="location.href='/category/categoryDetail?code=G'">
              <i class="fa-solid fa-palette"></i>
              <span class="icontext">공예/만들기</span>
           </button>
           <button type="button" class="icon" id="category_H" onclick="location.href='/category/categoryDetail?code=H'">
              <i class="fa-solid fa-handshake-angle"></i>
              <span class="icontext">봉사활동</span>
           </button>
           <button type="button" class="icon" id="category_I" onclick="location.href='/category/categoryDetail?code=I'">
              <i class="fa-solid fa-gamepad"></i>
              <span class="icontext">게임/오락</span>
           </button>
           <button type="button" class="icon" id="category_J" onclick="location.href='/category/categoryDetail?code=J'">
              <i class="fa-solid fa-camera"></i>
              <span class="icontext">사진/영상</span>
           </button>
           <button type="button" class="icon" id="category_K" onclick="location.href='/category/categoryDetail?code=K'">
              <i class="fa-solid fa-kitchen-set"></i>
              <span class="icontext">요리/제조</span>
           </button>
           <button type="button" class="icon" id="category_L" onclick="location.href='/category/categoryDetail?code=L'">
              <i class="fa-solid fa-dog"></i>
              <span class="icontext">반려동물</span>
           </button>
        </div>
		<h3 style="margin: 30px auto; text-align: center" class="recommend">오늘의 추천 소모임</h3>
      <div class="row row-cols-1 row-cols-md-4 g-4 randomList" style="margin-bottom: 100px">
         <c:forEach items="${RandomList }" var="rList" begin="0" end="7" varStatus="status">
            <div class="col">
               <div class="card h-100">
                  <c:if test="${rList.uuid == null}">
                     <img alt="sgMain" src="/upload/sgMain_default.jpg" class="card-img-top object-fit-cover" style="height: 250px">
                  </c:if>
                  <c:if test="${rList.uuid != null}">
                     <img alt="sgMain" src="/upload/sgMainUpload/${rList.dir}/${rList.uuid}_${rList.sm_name}" class="card-img-top object-fit-cover sgmain" style="height: 250px">
                  </c:if>
                  <div class="card-body">
                     <h5 class="card-title" style="font-weight: 600;">${rList.sg_name }</h5>
                     <p class="card-text detail">${rList.detail }</p>
                     <p class="card-text">${rList.city}  ${rList.county }</p>
                     <a href="/group/main?grno=${rList.grno}" class="btn btn-warning">구경하기</a>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
      
      <c:if test="${ses ne null && not empty RecoList}">
      	<h3 style="margin: 30px auto; text-align: center" class="recommend">${fn:substring(ses.area,fn:indexOf(ses.area," "),fn:length(ses.area)) }에 사는 ${ses.name } 님을 위한 소모임</h3>
     	<div class="row row-cols-1 row-cols-md-4 g-4 randomList" style="margin-bottom: 100px">
         <c:forEach items="${RecoList }" var="reList" begin="0" end="7" varStatus="status">
            <div class="col">
               <div class="card h-100">
                  <c:if test="${reList.uuid == null}">
                     <img alt="sgMain" src="/upload/sgMain_default.jpg" class="card-img-top object-fit-cover" style="height: 250px">
                  </c:if>
                  <c:if test="${reList.uuid != null}">
                     <img alt="sgMain" src="/upload/sgMainUpload/${reList.dir}/${reList.uuid}_${reList.sm_name}" class="card-img-top object-fit-cover sgmain" style="height: 250px">
                  </c:if>
                  <div class="card-body">
                     <h5 class="card-title" style="font-weight: 600;">${reList.sg_name }</h5>
                     <p class="card-text detail">${reList.detail }</p>
                     <p class="card-text">${reList.city}  ${reList.county }</p>
                     <a href="/group/main?grno=${reList.grno}" class="btn btn-warning">구경하기</a>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
      </c:if>
</section>
<jsp:include page="./layout/footer.jsp"></jsp:include>