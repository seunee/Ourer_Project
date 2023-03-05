console.log("user register.js ");

function joinCheck(obj){
    if(!obj.email.value || obj.email.value.trim().length == 0){
        alert("아이디가 입력되지 않았습니다.");
        obj.email.value = "";
        obj.email.focus();
        return false;
    }
    if(!obj.name.value || obj.name.value.trim().length == 0){
        alert("이름이 입력되지 않았습니다.");
        obj.name.value = "";
        obj.name.focus();
        return false;
    }
    if(!obj.pw.value || obj.pw.value.trim().length == 0){
        alert("비밀번호가 입력되지 않았습니다.");
        obj.pw.value = "";
        obj.pw.focus();
        return false;
    }
    if(!obj.area.value || obj.area.value.trim().length == 0){
        alert("주소가 입력되지 않았습니다.");
        obj.area.value = "";
        obj.area.focus();
        return false;
    }
    if(!obj.age.value || obj.age.value.trim().length == 0){
        alert("나이가 입력되지 않았습니다.");
        obj.age.value = "";
        obj.age.focus();
        return false;
    }
    if(!obj.phone.value || obj.phone.value.trim().length == 0){
        alert("전화번호가 입력되지 않았습니다.");
        obj.phone.value = "";
        obj.phone.focus();
        return false;
    }
    if(!obj.ctno1.value || obj.ctno1.value.trim().length == 0){
        alert("관심사를 최소 1개 선택해주세요.");
        obj.ctno1.value = "";
        obj.ctno1.focus();
        return false;
    }
    return true;
}

// 이메일 중복체크
function emailCheck(){
    var email = $('#email').val();  // 받아온 email값 저장
    if(email!="") {
	    $.ajax({
	        url:'/user/emailCheck',  // Controller에서 요청받을 주소
	        type : 'post',
	        data : {email : email},
	        dataType: 'json',
	        success:function(cnt) {
	            if(cnt == 0){
	                $('.email_OK').css("display", "inline-block");
	                $('.email_NO').css("display","none");
	            }else{  // cnt 가 1 일 경우 => 이미 있는 이메일
	                $('.email_NO').css("display", "inline-block");
	                $('.email_OK').css("display", "none");
	                alert("아이디를 다시 입력해주세요!");
	                $('#email').val('');
	            }
	        },
	        error:function() {
	            alert("에러났다..");
	        }
	    });
    }
};

// 비밀번호 일치 체크 & 정규식
// 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
var regExpPw = /(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/; 
   $('.pw').keyup(function(){
        let pattern = /\s/g;
       let pass1 = $("#pw").val();
        let pass2 = $("#pw2").val();
        console.log(pass1);
        console.log(pass2);
        
        if ((pass1 != "" || pass2 != "") && regExpPw.test(pass1) == true){
           if (pass1 == pass2){
               $("#checkPw").html('비밀번호가 일치합니다.');
               $("#checkPw").attr('color','green');
            } else if (pass1 != pass2) {
                $("#checkPw").html('비밀번호가 일치하지 않습니다.');
                $("#checkPw").attr('color','red');
            } 
            
        }else if (regExpPw.test(pass1) == false){
            $("#checkPw").html('비밀번호가 형식에 맞지 않습니다.');
            $("#checkPw").attr('color','red');
        }
    
    })


// 닉네임 중복확인
function checkNickName(){
    var nickname = $('#nickname').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'/user/nicknameCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{nickname:nickname},
        dataType: 'json',
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.nickName_OK').css("display","inline-block"); 
                $('.nickName_NO').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.nickName_NO').css("display","inline-block");
                $('.nickName_OK').css("display", "none");
                alert("닉네임을 다시 입력해주세요");
                $('#nickname').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};




document.addEventListener('change',(e)=>{
    console.log(e.target.id);
    if(e.target.id=='code'){
        console.log(e.target.nextElementSibling);
        sel = e.target.nextElementSibling;
        index = e.target.selectedIndex;
        console.log(index);
        for (i=sel.length-1; i>=0; i--){
	        sel.options[i] = null
        }
        //console.log(ctnoList[index]);
	    for(let i=0; i<ctnoList[index].length;i++){
	        sel.options[i]=new Option(ctnoList[index][i], ctnoNum(ctnoList[index][i]));
	    }
    }
})

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

//파일 업로드 버튼을 누르면 파일 첨부 창이 나타나도록
document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
});

//파일에 대한 정규 표현식을 이용한 생성자 함수 만들기 
//fileupload시 형식을 제한하는 함수
//실행파일 금지, 이미지 파일만 가능하도록

const regExp=new RegExp("\.(exe|sh|bat|msi|dll|js)$"); //해당 형식의 확장자는 금지
const regExpImg=new RegExp("\.(jpg|jpeg|png|gif)$"); //이미지 파일만 가능
const maxsize=1024*1024*20;  //20MB보다 큰지 체크

function fileSizeValidation(name, size){
    if(regExp.test(name)){
        return 0;
    }else if(!regExpImg.test(name)){
        return 0;
    }else if(size>maxsize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    if(e.target.id=="files"){
        //비활성화 -> 첨부되면 안 되는 파일이 들어왔을때 클릭되는 것을 방지하기 위해서
        document.getElementById('userJoinBtn').disabled=false;
        //input type="file"로 가지고 오는 element: fileObject 객체로 리턴
        const fileObject = document.getElementById('files').files;
        console.log(fileObject);

        let div=document.getElementById('fileZone');
        div.innerHTML='';
        let ul='<ul class="list-group list-group-flush">';
        let isOK=1; //처음부터 0으로 들어가면 모든 값이 0이 되므로 곱하기 위해서 1로 설정
        for(let profile of fileObject){
            let validResult=fileSizeValidation(profile.name, profile.size);
            isOK *= validResult; //0의 값이 1개라도 들어오면 0이 되도록 -> 모든 첨부파일의 결과가 1이어야 통과 
            ul+=`<li class="list-group-item d-flex justify-content-between align-items-start">`;
            //업로드 가능 여부 표시
            ul+=`${validResult?'<div class="fw-bold">업로드 가능':'<div class="fw-bold text-danger">업로드 불가'}</div>`;
            ul+=`${profile.name}`;
            ul+=`<span class="badge bg-${validResult?'success':'danger'} rounded-pill">${profile.size} Bytes</span>`;
        }
        ul+=`</ul>`;
        div.innerHTML=ul;

        if(isOK==0){
            document.getElementById('userJoinBtn').disabled=true;
        }
    }
})