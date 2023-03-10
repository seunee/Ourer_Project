<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js' crossorigin='anonymous'></script>
<script src='https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/js/tempus-dominus.js' crossorigin='anonymous'></script>
<link href='https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/css/tempus-dominus.css' rel='stylesheet' crossorigin='anonymous'>



<style>
    .tempus-dominus-widget.light .date-container-decades div:not(.no-highlight).active, .tempus-dominus-widget.light .date-container-years div:not(.no-highlight).active, .tempus-dominus-widget.light .date-container-months div:not(.no-highlight).active, .tempus-dominus-widget.light .date-container-days div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-clock div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-hour div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-minute div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-second div:not(.no-highlight).active {
    background-color: #FFD34A;
    color: black;
    text-shadow: 0 -1px 0 rgb(0 0 0 / 25%);
}
.tempus-dominus-widget.light button {
    background-color: #FFD34A;
    color: black;
    border-color: #FFD34A;
}
.tempus-dominus-widget.light .date-container-decades div:not(.no-highlight).today:before, .tempus-dominus-widget.light .date-container-years div:not(.no-highlight).today:before, .tempus-dominus-widget.light .date-container-months div:not(.no-highlight).today:before, .tempus-dominus-widget.light .date-container-days div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-clock div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-hour div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-minute div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-second div:not(.no-highlight).today:before {
    border-bottom-color: #FFD34A;
    border-top-color: rgba(0, 0, 0, 0.2);
}
</style>
<link rel='stylesheet' type='text/css' href='/resources/css/schRegister.css'>

<jsp:include page='../layout/header.jsp'></jsp:include>
<section>
<div class='firstBox'>
    	<ul class='nav nav-tab'>
            	<li class='grpNavLi nav-item'><h1 class='grpName'>${gvo.name }</h1></li>
                <li class='grpNavLi nav-item'><a class='nav-link groupNav' href='/group/main?grno=${gvo.grno }'>????????? ???</a></li>
                <li class='grpNavLi nav-item'><a class='nav-link groupNav' href='/gboard/list?grno=${gvo.grno }'>?????????</a></li>
                <li class='grpNavLi nav-item'><a class='nav-link groupNav' href='/group/memberList?grno=${gvo.grno }'>??????(${fn:length(uList)+1} / ${gvo.max_member })</a></li>
                <c:if test='${ses.email eq gvo.email }'>
                <li class='grpNavLi nav-item'><a class='nav-link groupNav' href='/schedule/register?grno=${gvo.grno }'>????????? ??????</a></li>
                </c:if>
            </ul>
        </div>
    <div class='outerBox'>
    	<form action='/schedule/register' method='post'>
    		<input type='hidden' name='grno' value='${grno }'>
	        <div class='input-group' id='datetimepicker1' data-td-target-input='nearest' data-td-target-toggle='nearest'>
	            <input id='datetimepicker1Input' name='meetdate' type='text' class='form-control' data-td-target='#datetimepicker1' placeholder='?????? ?????????????'/>
	            <span class='input-group-text' data-td-target='#datetimepicker1' data-td-toggle='datetimepicker'>
	                <span class='fa-solid fa-calendar'></span>
	            </span>
	        </div>
	        <div class='form-floating mb-3'>
		        <input type='text' class='form-control' name='title' id='schTitle' placeholder='?????? ???????????????????'>
		        <label for='schTitle'>?????? ???????????????????</label>
			</div>
			<div class="map_wrap">
    			<div id="map" style="width:700px;height:500px;position:relative;overflow:hidden;"></div>
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
						<div>
			               	<input type="text" placeholder="????????? ??????????????????!" id="keyword" style="width: 150px; height: 30px; font-size: 15px; border: 1px solid #aeaeae; border-radius: 0.375rem; padding-left: 3px;">
			            	<button type="button" onclick="searchPlaces()" style="height: 30px;">??????</button>
			            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
            <div class='form-floating mb-3'>
            	<input type='text' class='form-control' name='spot' id='schSpot' placeholder='????????? ?????????????' readonly>
            	<label for='schSpot'>????????? ?????????????</label>
            </div>
            <div class='form-floating mb-3'>
            <input type='text' class='form-control' name='cost' id='schCost' placeholder='ex- ????????? ??????/??????'>
            	<label for='schCost'>??????(ex- ????????? ??????, ??????, 10000??? ...)</label>
            </div>
            <div class='form-floating mb-3'>
            <fmt:parseNumber value="${fn:length(uList)+1 }" var="memNum"/>
            <input type='number' class='form-control' name='max_member' id='schMax_member' min='1' max='${memNum }' value="1">
            	<label for='schMax_member'>?????????</label>
            </div>
            <%-- <div class='form-floating mb-3'>
            <input type='number' class='form-control' name='max_member' id='schMax_member' min='2' value='2' max='${fn:length(uList)+1}'>
            	<label for='schMax_member'>?????????</label>
            </div> --%>
            <button type='submit' class="btn btn-outline-warning">????????? ??????</button> 
    	    <!-- <span>??????: </span><input type='text' name='title' id='schTitle' class='form-control'><br> -->
            <!-- <span>??????: </span><input type='text' name='spot' id='schSpot' class='form-control'><br>
            <span>??????: </span><input type='text' name='cost' id='schCost' placeholder='ex- ????????? ??????/??????' class='form-control'><br>
            <span>?????? ??????: </span><input type='number' name='max_member' id='schMax_member' min='2' value='2' class='form-control' max='${fn:length(uList)+1}'><br>
            <button type='submit'>????????? ??????</button> -->

        </form>
 </div>
</section>
<script type='text/javascript'>
const today=new Date();
new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
    display: { 
        components: {
            seconds: false,
            useTwentyfourHour: true,
        },
        icons: {
            type: 'icons',
            time: 'fa fa-solid fa-clock',
            date: 'fa fa-solid fa-calendar',
            up: 'fa fa-solid fa-arrow-up',
            down: 'fa fa-solid fa-arrow-down',
            previous: 'fa fa-solid fa-chevron-left',
            next: 'fa fa-solid fa-chevron-right',
            today: 'fa fa-solid fa-calendar-check',
            clear: 'fa fa-solid fa-trash',
            close: 'fas fa-solid fa-xmark'
        },
    },
    restrictions: {
        minDate: today,
      },
});
const schMsg='<c:out value='${schMsg }'/>';
if(schMsg==='0'){
	alert('??? ?????? ?????? ???????????????!');
}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a40e8c28b662316c1473d8a6546c6af&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="/resources/js/mapApi.js"></script>
<jsp:include page='../layout/footer.jsp'></jsp:include>