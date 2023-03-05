
const exeRegExp=RegExp("\(exe|sh|bat|msi|dll|js)$");
const imgRegExp=RegExp("\.(jpg|jpeg|png|gif)$");
const fileMaxSize=1024*1024*20;

function fileSizeValidation(fileName, fileSize){
    if(exeRegExp.test(fileName)){
        return 0;
    }else if(!imgRegExp.test(fileName)){
        return 0;
    }else if(fileSize>fileMaxSize){
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
        }
        ul+=`</ul>`;
        div.innerHTML=ul;

        if(isOk==0){
            document.getElementById('registerBtn').disabled=true;
        }
    }
})

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('file-x')){
        let div=e.target.closest('div');
        console.log(div);
        let uuid=e.target.dataset.uuid; 
        console.log(uuid);
        deleteFile(uuid).then(result=>{
            if(result>0){
                alert("파일 삭제 성공");
            }
        })
        div.remove();
        addUploadBtn();

    }
})

//파일 삭제
async function deleteFile(uuid){
    try {
        const url="/gboard/file/"+uuid;
        const config={
            method: 'delete'
        }
        const resp=await fetch(url, config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}



function addUploadBtn(){
    const imgBox=document.getElementById('imgBox');
    console.log(imgBox);
    imgBox.innerHTML=`<input class="form-control" type="file" style="display: none;" id="files" name="files">
    <button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
   <div class="col-12" id="fileZone">
   </div>`;
   document.getElementById('trigger').addEventListener('click', ()=>{
       document.getElementById('files').click();
   })
}

document.getElementById('trigger').addEventListener('click', ()=>{
    document.getElementById('files').click();
})