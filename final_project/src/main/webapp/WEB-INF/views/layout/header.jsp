<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OURER</title>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/upload/rabbit_1.ico">
</head>
<body>
   <nav class="navbar">
     <div class="container-fluid-start">
       <a class="navbar-brand" href="#"></a>
       <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
         <div class="offcanvas-header">
           <h1 class="offcanvas-title" id="offcanvasNavbarLabel">OURER</h1>
           <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
         </div>
         <div class="offcanvas-body">
           <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
              <c:choose>
              <c:when test="${ses.isCap != 0 && ses.email != null}">
                <li class="nav-item">
                  <a class="nav-link active d-grid gap-2 col-12 mx-auto" aria-current="page" href="/user/management/${ses.email }"><button type="button" class="btn btn-outline-warning">?????? ?????????</button></a>
                </li>
              </c:when>
              <c:when test="${ses.isCap == 0 && ses.email != null}">
                <li class="nav-item">
                  <a class="nav-link active d-grid gap-2 col-12 mx-auto" aria-current="page" href="/group/register"><button type="button" class="btn btn-outline-warning">????????? ??????</button></a>
                </li>
              </c:when>
              <c:when test="${ses.isCap == 0 && ses.email == null }"></c:when>
           </c:choose>
             <c:if test="${ses.email == null }">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/user/login">?????????</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/user/register">????????????</a>
                </li>
             </c:if>
             <li class="nav-item">
             <div>
             <c:choose>
            <c:when test="${ses.email != null }">
               <div>
                  <c:if test="${sespvo.uuid !=null }">
                     <img src="/upload/${sespvo.dir}/${sespvo.uuid}_${sespvo.name}" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px; height: 140px">
                  </c:if>                   
               <div class="imgname">
                  <span id="imgname">${ses.name }</span>
                  <span>???</span></div>
               </div>
            </c:when>
               <c:when test="${ses.email == null || ses.email =='' }">
            </c:when>
         </c:choose>
                </div>
             </li>
              <c:if test="${ses.email != null }">
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="/user/logout">????????????</a>
             </li>
             <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 ?????? ?????????
               </a>
               <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="/user/mypage/${ses.email }" >?????? ???????????? ?????????</a></li>
                 <li><a class="dropdown-item" href="/user/management/${ses.email }" >??? ????????? ??????</a></li>
                 <li><a class="dropdown-item" href="/favorite/mylike/${ses.email }">?????? ?????? ?????????</a></li>
               </ul>
             </li>
             </c:if>
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="/board/list">????????????</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="/board/introduce">????????? ??????</a>
             </li>
               <c:if test="${ses.email == 'super@ourer.com' &&  ses.nickname == '?????????' }">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/category/categorymain">????????? ?????????</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ???????????? ??????
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/group/grouplist" >????????? ?????? ?????????</a></li>
                    <li><a class="dropdown-item" href="/user/userlist">?????? ?????? ??????</a></li>
                  </ul>
                </li>
             </c:if>
           </ul>
         </div>
       </div>
     </div>
   <div class="logo">
         <a href="/"><img alt="" src="/resources/img/logo.png" width="200px"></a>
   </div>
      <ul class="nav justify-content-end">
      <c:if test="${ses.email == null }">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/user/login">?????????</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/register">????????????</a>
        </li>
      </c:if>
      <c:if test="${ses.email != null }">
         <li class="nav-item">
             <a class="nav-link" aria-current="page" href="/user/mypage/${ses.email }">${ses.name } ???????????????</a>
          </li>
          <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="/user/logout">????????????</a>
        </li>
      </c:if>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">????????????</a>
        </li>
      </ul>
        <div class="input-group mb-3">
      <form class="d-flex" role="search" action="/category/categorymain" method="get">
         <c:set value="${scvo.type }" var="typed"/>
            <select class="form-select" name="type" id="seachBtn" aria-label="Default select example">
               <option selected value="a" ${typed eq 'a' ? 'selected':'' }>?????? ??????</option>
               <option value="n" ${typed eq 'n' ? 'selected':'' }>??????</option>
               <option value="d" ${typed eq 'd' ? 'selected':'' }>??????</option>
            </select>
               <input class="form-control me-2" id="seachInput" type="search" placeholder="???????????? ??????????????????"  aria-label="Search" name="keyword" value="${scvo.keyword }">
                  <button class="btn btn-outline-warning" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
   </div>
   </nav>

<script src="https://kit.fontawesome.com/0466d36352.js" crossorigin="anonymous"></script>