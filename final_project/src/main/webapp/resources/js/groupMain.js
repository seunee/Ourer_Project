let nowUrl=window.location.href;
function copyUrl(){
    console.log(nowUrl);
    navigator.clipboard.writeText(nowUrl).then(res=>{
        alert("소모임 링크가 복사되었습니다!");
    })
}

document.getElementById('heartBtn').addEventListener('click', ()=>{
    console.log(nowUrl);
    let grno=nowUrl.substring(nowUrl.lastIndexOf('=')+1);
    console.log(grno);
    if(emailVal==""||grno==""||grno==null){
        alert("로그인해주세요.");
        console.log("찜 기능 실패");
        return false;
    }else{
        favData={
            email: emailVal,
            grno: grno
        }
    }
    console.log(favData);
    const heartBtnTag=document.getElementById('heartBtn');
    likeFavorite(favData).then(result=>{
       console.log(result)
        if(result==1){
            alert("찜을 취소했어요!");
       heartBtnTag.innerHTML=`<i class="fa-regular fa-heart"></i>`;
        }else if(result==2){
           alert("이 소모임을 찜했어요!");
       heartBtnTag.innerHTML=`<i class="fa-solid fa-heart"></i>`;   
        }
    })
})


async function likeFavorite(favData){
    try {
        const url="/favorite/like";
        const config={
            method: 'post',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(favData)
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


function showJoinPeople(sno){
   const joinPeople=document.getElementById(`joinPeople${sno}`);
   console.log(joinPeople);
    console.log(joinPeople.style.display);
    if(joinPeople.style.display=='flex'){
        joinPeople.style.display='none';
    } else{
     joinPeople.style.display='flex';
     joinPeople.style.justifyContent='space-between';
     joinPeople.style.flexWrap='wrap';
     
    }
    console.log(joinPeople.style.display);
}


document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('schJoinBtn')&&e.target!=null){
        console.log(nowUrl);
    let grno=nowUrl.substring(nowUrl.lastIndexOf('=')+1);
    console.log(grno);
    let sno=e.target.id;
    sno=sno.substring(sno.lastIndexOf('n')+1);
    console.log("참가버튼 눌렀을 때"+sno);
    if(grno!=null||sno!=null){
        joinData={
            sno: sno,
            grno: grno
        }
    }
    console.log(joinData);
    addJoinPerson(joinData).then(result=>{
        console.log(result);
        if(result=="1"){
            alert("스케줄 참가 성공!");
            location.reload();
        }else if(result=="2"){
            alert("스케줄 참가 실패");
            location.href="/group/main?grno="+grno;
        }
       //getJoinPersonList();
    })
    }
})

async function addJoinPerson(joinData){
    try {
        const url="/schedule/join";
        const config={
            method: 'post',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(joinData)
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//화면에 뿌리기
async function spreadJoinPerson(){
    try {
        const resp=await fetch('/schedule/list');
        const result=await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//리스트 가져오기
function getJoinPersonList(){
    spreadJoinPerson().then(result=>{
        console.log(result);
        for(let r of result){
            //console.log(r);
            //console.log(r.sno);
            let divJP=document.getElementById(`joinPeople${r.sno}`);
            if(divJP != null){
                //console.log(divJP);
                //console.log(r.pdir);
                //let pDir=r.pdir.replace(/\\/g, '/');
                //console.log(pDir);
                //console.log(divJP.dataset.sno);
                
                let div='';
                if(divJP.dataset.sno==r.sno){
                    div=`<div class="joinPerson" data-jno="${r.jno}">`;
                    div+=`<img src="/upload//${r.pdir}/${r.puuid}_${r.pname}" class="rounded-circle object-fit-cover" alt="...">`;
                    div+=`<span class="jpName fs-5 fw-semibold">${r.uname}</span>`;
                }
                //console.log(emailVal);
                if(emailVal == r.uemail){
                    console.log(r.uemail);
                    div+=`<button class="schCancelBtn btn btn-outline-danger btn-sm">참가 취소</button>`;
                    const joinBtn=document.getElementById(`schJoinBtn${r.sno}`);
                    console.log(joinBtn);
                    joinBtn.disabled=true;
                    joinBtn.classList.remove('btn-outline-warning');
                    joinBtn.classList.add('text-decoration-line-through');
                    joinBtn.classList.add('btn-outline-secondary');
                }
                div+=`</div>`;
                divJP.innerHTML+=div;

            }
        }
    })
}

//스케줄 참가 취소
document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('schCancelBtn')){
        const div=e.target.closest('div');
        console.log(div);
        const jno=div.dataset.jno;
        console.log(jno);
        //취소
        cancelJoinPeople(jno).then(result=>{
            if(result>0){
                alert("스케줄 참가를 취소했어요!");
                location.reload();
            }
        })
    }else if(e.target.classList.contains('editDetail')){ 
        const div=document.getElementById('editDetail');
        console.log(div);
        div.style.display='block';
    }else if(e.target.classList.contains('editFin')){
        const div=document.getElementById('editDetail');
        console.log(div);
        div.style.display='none';
        // div.innerHTML='';
    }
})


async function cancelJoinPeople(jno){
    try {
        const url="/schedule/cancel/"+jno;
        const config={
            method: 'delete'
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }

}



window.addEventListener('load', ()=>{
    let scheDateLi=document.querySelectorAll('.scheDate');
    for(let d of scheDateLi){
        let date=d.innerText;
        console.log(date);
        //date=date.substring(0, 13);
        console.log(date);
        date=new Date(date);
        //console.log("스케줄 날짜: "+date);
        const today=new Date();
        console.log("오늘 날짜: "+today.toLocaleString());
        if(today>date){
            let sno=d.dataset.sno;
            let grno=d.dataset.grno;
            console.log("지난스케줄: "+date.toLocaleString());
            console.log("sno "+sno);
            updateIsDone(sno).then(result=>{
                if(result>0){
                    console.log("스케줄 수정 완료");
                    location.reload();
                    //location.href = location.href;
                    //location.href="/group/main?grno="+grno;
                }
            })
        }
    }
})

async function updateIsDone(sno){
    try {
        const url="/schedule/update/"+sno;
        const config={
            method: 'put',
            body: sno
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
})

const regExp=new RegExp("\.(exe|sh|bat|msi|dll|js)$");
const regExpImg=new RegExp("\.(jpg|png|jpeg|gif)$");
const maxsize=1024*1024*20;

function fileSizeValidation(fileName, fileSize){
    if(regExp.test(fileName)){
        return 0;
    }else if(!regExpImg.test(fileName)){
        return 0;
    }else if(fileSize>maxsize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    if(e.target.id=='files'){
        const files=document.getElementById('files').files;
        console.log(files);

        let div=document.getElementById('fileZone');
        div.innerHTML='';
        let ul='<ul class="list-group list-group-flush">';
        let isOk=1; //처음부터 0으로 들어가면 모든 값이 0이 되므로 곱하기 위해서 1로 설정
        for(let file of files){
            let validResult=fileSizeValidation(file.name, file.size);
            isOk*=validResult; //0의 값이 1개라도 들어오면 0이 되도록 -> 모든 첨부파일의 결과가 1이어야 통과 
            ul+=`<li class="list-group-item d-flex justify-content-between align-items-start">`;
            //업로드 가능 여부 표시
            ul+=`${validResult?'<div class="fw-bold">업로드 가능':'<div class="fw-bold text-danger">업로드 불가'}</div>`;
            ul+=`${file.name}`;
            ul+=`<span class="badge bg-${validResult?'success':'danger'} rounded-pill">${file.size} Bytes</span>`;
            ul+=`<button class="btn btn-outline-warning" type="submit">등록</button>`;
        }
        ul+=`</ul>`;
        div.innerHTML=ul;

        if(isOk==0){
            document.getElementById('grpRegBtn').disabled=true;
        }
    }
})