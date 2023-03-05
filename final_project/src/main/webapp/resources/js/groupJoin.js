document.getElementById('grpJoinBtn').addEventListener('click',()=>{
    let check=document.querySelectorAll(".check");
    console.log(check);
    let grno=document.getElementById('grno').value;
    let isOk=0;
    for(let ch of check){
        if(ch.checked==false){
            isOk=1;
        }
    }
    if(isOk==0){
        document.getElementById('joinForm').submit();
    }else{
       alert("유의사항을 모두 체크해주세요!");
	
    }
})