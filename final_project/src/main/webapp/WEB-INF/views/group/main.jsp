<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/grpMain.css">

<section>
    <div class="firstBox">
       <ul class="nav nav-tab">
               <li class="grpNavLi nav-item"><h1 class="grpName">${gvo.name }</h1></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/main?grno=${gvo.grno }">소모임 홈</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/gboard/list?grno=${gvo.grno }">게시판</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/memberList?grno=${gvo.grno }">멤버(${fn:length(uList)+1} / ${gvo.max_member })</a></li>
                <c:if test="${ses.email eq gvo.email }">
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/schedule/register?grno=${gvo.grno }">스케줄 생성</a></li>
                </c:if>
            </ul>
        </div>
        <div class="firstsBox">
        <ul class="nav justify-content-end">
                <li class="grpNavLi nav-item"><button id="shareBtn" onclick="copyUrl()"><i class="fa-solid fa-share-nodes"></i></button></li>
                <li class="grpNavLi nav-item">
                   <button id="heartBtn">
                     <c:choose>
                     <c:when test="${fvo ne null }">
                      <i class="fa-solid fa-heart"></i>
                     </c:when>
                  <c:otherwise>
                      <i class="fa-regular fa-heart"></i>                      
                  </c:otherwise>
                     </c:choose>
                   </button>
                </li>
         </ul>
      </div>
       <div class="imgBox">
        <c:choose>
           <c:when test="${smvo ne null }">
               <img src="/upload/sgMainUpload/${smvo.dir}/${smvo.uuid}_${smvo.name}" alt="" class="object-fit-contain border rounded">
               <form action="/group/image" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="grno" value="${gvo.grno }">
                  <input class="form-control" type="file" style="display: none;" id="files" name="files">
                  <c:if test="${ses.email == gvo.email }">
                  <button id="trigger" class="btn btn-outline-warning btn-sm d-inline p-2 float-end" type="button">이미지 수정</button>
                  <a href="/group/image/delete?grno=${gvo.grno }"><button class="btn btn-outline-warning btn-sm d-inline p-2 float-end" type="button">이미지 삭제</button></a>
                  </c:if>
              <div class="col-12" id="fileZone">
               <!--파일이 첨부되면 해당 파일에 대한 정보가 표시됨-->
            </div>
            </form>
           
           </c:when>
           <c:otherwise>
               <img src="/upload/sgMain_default.jpg" alt="" class="object-fit-contain border rounded">
               <form action="/group/image" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="grno" value="${gvo.grno }">
                  <input class="form-control" type="file" style="display: none;" id="files" name="files">
                  <c:if test="${ses.email == gvo.email }">
                  <button id="trigger" class="btn btn-outline-warning btn-block d-block float-end btn-sm" type="button"  data-bs-toggle="tooltip" data-bs-placement="left" data-bs-title="소모임 메인이미지를 등록해보세요!">이미지 등록</button>
                  </c:if>
              <div class="col-12" id="fileZone">
               <!--파일이 첨부되면 해당 파일에 대한 정보가 표시됨-->
            </div>
            </form>
           
           </c:otherwise>
        </c:choose>
        </div>
        <div class="descBox">
            <div class="detail">
            <textarea class="form-control-plaintext fs-4" id="detail" name="detail" readonly="readonly" style="width:1000px; height: 250px">${gvo.detail }</textarea>
             <%-- <span class="fs-4">${gvo.detail }</span> --%><br>
             <c:if test="${ses.email eq gvo.email }">
                <button type="button" class="btn btn-outline-warning editDetail float-end btn-sm">수정</button>
                <div class="form-floating" id="editDetail" style="display: none;">
                  <form action="/group/modify" method="post">
                   <input type="hidden" name="grno" value="${gvo.grno }">
                    <textarea class="form-control" placeholder="소모임 소개" name="detail" id="detail" style="height: 200px">${gvo.detail }</textarea>
                    <label for="detail"></label>
                    <button type="submit" class="btn btn-outline-warning editFin float-end">완료</button>
                    </form>
               </div>
             </c:if>
            </div>
        </div>
    <div class="secondBox">
        <div class="secondTitle">
            <i class="fa-regular fa-calendar-check fa-2x"></i><span class="fs-3">정모</span>
        </div>
        <c:choose>
           <c:when test="${sList ne null }">
           <c:forEach items="${sList }" var="svo">
           <div class="scheBox">
               <div class="scheTitle">
               <span class="text-center fs-4">${svo.title }</span>
               <input type="hidden" id="sno" value="${svo.sno }">
               <c:choose>
                      <c:when test="${ses.email eq gvo.email }">
                         <a href="/schedule/delete?sno=${svo.sno }"><button class="delSchBtn btn btn-outline-warning">스케줄 삭제</button></a>
                        <button class="schJoinBtn btn btn-outline-warning text-decoration-line-through" id="schJoinBtn${svo.sno }" style="display: none;">참가</button>
                      </c:when>
                      <c:when test="${svo.joinmember eq svo.max_member }">
                        <button class="schJoinBtn btn btn-outline-secondary text-decoration-line-through" id="schJoinBtn${svo.sno }" disabled>마감</button>
                      </c:when>
                      <c:otherwise>
                      <c:forEach items="${uList }" var="uvo">
                      <c:if test="${uvo.email eq ses.email }">
                        <button class="schJoinBtn btn btn-outline-warning" id="schJoinBtn${svo.sno }">참가</button>
                      </c:if>
                      </c:forEach>
                      </c:otherwise>
                   </c:choose>
               </div>
               <div class="scheInner">
                   <ul class="scheInfo">
                       <li class="scheInfoLi scheDate" data-sno="${svo.sno}"><i class="fa-regular fa-calendar"></i> ${svo.meetdate }</li>
                       <li class="scheInfoLi"><i class="fa-solid fa-location-dot"></i> ${svo.spot } </li>
                       <li class="scheInfoLi"><i class="fa-solid fa-won-sign"></i> ${svo.cost }</li>
                       <li class="scheInfoLi">
                          <i class="fa-solid fa-user"></i> 참여인원: <span class="joinMember" id="joinMember">${svo.joinmember }</span>/<span class="maxMember">${svo.max_member }</span>
                          <button class="btn btn-outline-warning btn-sm showBtn" onclick="showJoinPeople(${svo.sno});"><i class="fa-solid fa-chevron-down"></i></button>
                           <div class="joinPeople" id="joinPeople${svo.sno }" data-sno="${svo.sno}">
                               
                           </div>
                       </li>
                   </ul>
                   
               </div>
           </div>
           </c:forEach>
           </c:when>
           <c:otherwise>
           <div class="scheBox">
              스케줄 없어..
           </div>
           </c:otherwise>
        </c:choose>
    </div>
    
    <c:choose>
    <c:when test="${ses.email ne null and ses.email ne gvo.email and gvo.max_member>fn:length(uList)+1}">
       <c:choose>
       <c:when test="${not fn:contains(uList, ses.email) }">
       <div class="d-grid gap-2">
          <a href="/group/join?grno=${gvo.grno }"><button class="btn btn-outline-warning">가입</button></a>
       </div>
       </c:when>
       </c:choose>
    </c:when>
    </c:choose>

    
</section>
<script type="text/javascript">
   const emailVal='<c:out value="${ses.email }"/>';
   const imgMsg='<c:out value="${imgMsg }"/>';
   if(imgMsg==="err"){
      alert("메인 이미지 등록에 실패했습니다.");
   }
</script>
<script type="text/javascript" src="/resources/js/groupMain.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
   getJoinPersonList();
   const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
   const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>