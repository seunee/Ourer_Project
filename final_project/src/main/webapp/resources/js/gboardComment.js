document.getElementById('cmtPostBtn').addEventListener('click', ()=>{
    const cmtText=document.getElementById('cmtText');
    console.log(cmtText);
    if(cmtText.value==null||cmtText.value==""){
        alert("댓글 내용을 작성해주세요.")
        
        cmtText.focus();
        return false;
    }else{
        let cmtData={
            gbno: gbnoVal,
            writer: document.getElementById('cmtWriter').innerText,
            content: cmtText.value,    
        };
        console.log(cmtData);
        //등록하는 메서드
        postComment(cmtData).then(result=>{
            if(result>0){
                alert("댓글이 등록되었습니다.");
                
            }
            //화면 출력
            getCommentList(cmtData.gbno);
        })
        cmtText.value='';
    }
})

//등록
async function postComment(cmtData){
    try {
        const url='/comment/post';
        const config={
            method: 'post',
            headers: {
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)
        }
        const resp=await fetch(url, config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//화면에 뿌리기
async function spreadComment(gbno){
    console.log(gbno);
    try {
        const resp=await fetch('/comment/'+gbno);
        const result=await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}


//리스트 가져오기
function getCommentList(gbno){
    spreadComment(gbno).then(result=>{
        console.log(result);
        const ul=document.getElementById('cmtListArea');
        if(result.length>0){
            ul.innerHTML='';
            for(let cvo of result){
                let li=`<li data-cno="${cvo.cno}" class="list-group-item d-flex justify-content-between align-items-start">`;
                li+=`<div class="ms-2 me-auto">`;
                li+=`<div class="upperBox">`;
                li+=`<div class="fw-bold writer">${cvo.writer}</div>`;
                if(nickVal==cvo.writer){
                    
                    li+=`<div class="dropdown">
                    <button class="btn btn-outline-secondary dropdown-toggle btn-sm dropBtn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa-solid fa-ellipsis"></i>
                    </button>`;
                    li+=`<ul class="dropdown-menu">
                    <li class="dropdown-item mod" data-cno="${cvo.cno}">수정</li>
                    <li class="dropdown-item del" data-cno="${cvo.cno}">삭제</li>
                    </ul></div>`;
                    
                }

                li+=`</div>`;
                li+=`<div class="cmtTextVal" id='cmtTextVal${cvo.cno}'>${cvo.content}</div>`;
                li+=`<p class="text-body-tertiary">${cvo.regdate}</p>`;
                //li+=`<input type="text" class="form-control" id="cmtTextMod" value="${cvo.content}"> </div>`;
                ul.innerHTML+=li;
            }
        }else{
        	ul.innerHTML='';
            let li=`<li class="list-group-item d-flex justify-content-between align-items-start">댓글을 작성해보세요!</li>`;
            ul.innerHTML+=li;
        }
    })
}

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('mod')){
        //let cmtTextDiv=document.getElementById('cmtTextVal');
        //let cmtTextVal=cmtTextDiv.innerText;
        //console.log(cmtTextVal);
        //cmtTextDiv.innerHTML=`<input type="text" class="form-control" id="cmtTextMod" value="${cmtTextVal}"> <button class="modBtn">수정</button>`;
        //console.log(cmtTextDiv);
        //id에 ${cvo.cno} 달고 드롭다운에 data-cno 달아서 getelementbyid로... `${cno}`
        let li=e.target.closest('li');
        let cnoVal=li.dataset.cno;
        let cmtTextDiv=document.getElementById(`cmtTextVal${cnoVal}`);
        let cmtTextVal=cmtTextDiv.innerText;
        cmtTextDiv.innerHTML=`<input type="text" class="form-control cmtInput" id="cmtTextMod" value="${cmtTextVal}"> <button class="modBtn  btn btn-outline-warning btn-sm float-end">수정</button>`;
    }else if(e.target.classList.contains('modBtn')){
        let li=e.target.closest('li');
        let cnoVal=li.dataset.cno;
        let text=li.querySelector('#cmtTextMod').value;
        let cmtData={
            cno: cnoVal,
            content: text
        };
        modifyComment(cmtData).then(result=>{
            if(result>0){
                alert("댓글이 수정되었습니다.")
                
            }
            li.innerHTML='';
            getCommentList(gbnoVal);
        })
    }else if(e.target.classList.contains('del')){
        let li=e.target.closest('li');
        console.log(li);
        let cnoVal=li.dataset.cno;
        console.log(cnoVal);
        deleteComment(cnoVal).then(result=>{
            if(result>0){
                alert("댓글이 삭제되었습니다.")
                
            }
            
            getCommentList(gbnoVal);
        })
    }
})


//수정
async function modifyComment(cmtData){
    try {
        const url="/comment/"+cmtData.cno;
        const config={
            method: 'put',
            headers: {
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)
        };
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//삭제
async function deleteComment(cno){
    try {
        const url="/comment/"+cno;
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