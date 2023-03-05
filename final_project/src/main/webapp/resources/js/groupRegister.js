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

//카테고리 중분류 펼치기
function spreadCtno(code){
    sel=document.getElementById('ctno');
    for (i=sel.length-1; i>=0; i--){
        sel.options[i] = null
        }
    for(let i=0; i<ctnoList[code].length;i++){
        sel.options[i]=new Option(ctnoList[code][i], ctnoList[code][i]);
    }
}

//시군구
let countyList=new Array();
countyList[0]=new Array("시/군/구");
countyList[1]=new Array("종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구");
countyList[2]=new Array("중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장군");
countyList[3]=new Array("중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군");
countyList[4]=new Array("중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군");
countyList[5]=new Array("동구", "서구", "남구", "북구", "광산구");
countyList[6]=new Array("동구", "중구", "서구", "유성구", "대덕구");
countyList[7]=new Array("중구", "남구", "동구", "북구", "울주군");
countyList[8]=new Array("세종특별자치시");
countyList[9]=new Array("수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "평택시", "동두천시", "안산시", "고양시", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군");
countyList[10]=new Array("춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군");
countyList[11]=new Array("청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군");
countyList[12]=new Array("천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군");
countyList[13]=new Array("전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군");
countyList[14]=new Array("목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "보흥군", "화순군", "장흥군", "강진군", "해남군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군");
countyList[15]=new Array("포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군");
countyList[16]=new Array("창원시", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군");
countyList[17]=new Array("제주시", "서귀포시");

//시군구 펼치기
function spreadCounty(city){
    sel=document.getElementById('county');
    for (i=sel.length-1; i>=0; i--){
        sel.options[i] = null
        }
    for(let i=0; i<countyList[city].length;i++){
        sel.options[i]=new Option(countyList[city][i], countyList[city][i]);
    }
}

//중복체크 금지
function checkOnlyOne(elem){
    const checkBox=document.getElementsByName(elem.name);
    checkBox.forEach((a)=>{
        a.checked=false;
    })
    elem.checked=true;
}

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


document.getElementById('grpRegBtn').addEventListener("click", ()=>{
    //카테고리 코드
    let codeTag=document.getElementById('code');
    console.log(codeTag);
    let selectedCode=codeTag.options[codeTag.selectedIndex].value;
    console.log(selectedCode);
    //카테고리 번호
    let ctnoTag=document.getElementById('ctno');
    let selectedCtno=ctnoTag.options[ctnoTag.selectedIndex].value;
    console.log(selectedCtno);
    let ctno=ctnoNum(selectedCtno);
    console.log(ctno);
    //소모임 이름
    let grpName=document.getElementById('grpName').value;
    console.log(grpName);
    //도시
    let city=document.getElementById('city');
    let cityVal=city.options[city.selectedIndex].value;
    console.log(cityVal);
    //시군구
    let county=document.getElementById('county');
    let countyVal=county.options[county.selectedIndex].value;
    console.log(countyVal);
    //소모임 멤버 수
    let max_member=document.getElementById('max_member').value;
    console.log(max_member);
    //유무료
    let checkFree=document.getElementsByName('isFree');
    let isFree=2;
    for(let i=0;i<checkFree.length;i++){
        if(checkFree[i].checked==true){
            isFree=checkFree[i].value;
        }
    }
    console.log(isFree);
    //대면비대면
    let checkFace=document.getElementsByName('isFace');
    let isFace=2;
    for(let i=0;i<checkFace.length;i++){
        if(checkFace[i].checked==true){
            isFace=checkFace[i].value;
        }
    }
    console.log(isFace);
    //소모임 소개
    let detail=document.getElementById('detail').value;
    console.log(detail);
    //방장 이메일
    let email=document.getElementById('email').value;
    console.log(email);
    

    if(selectedCode=="대분류"||selectedCtno==""||grpName==""||cityVal=="전체"||countyVal==""||isFree==2||isFace==2||detail==""){
        alert("빈 칸을 모두 채워주세요.");
        
        console.log("널~!");
        return false;
    }else{
        groupData={
            name: grpName,
            city: cityVal,
            county: countyVal,
            max_member: max_member,
            isFree: isFree,
            isFace: isFace,
            detail: detail,
            ctno: ctno,
            email: email,
            code: selectedCode
        }
    }
    console.log(groupData);
    registerGroup(groupData).then(result => {
        if(result>0){
            alert("소모임이 생성되었습니다!");
            
            location.href="/";
        }
    })

})

async function registerGroup(groupData){
    try {
        const url="/group/register";
        const config={
            method: 'post',
            headers: {
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(groupData)
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}
