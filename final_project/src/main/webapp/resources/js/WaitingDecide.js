async function acceptUserToServer(waitData){
    try {
        const url='/wait/accept/'+waitData.email;
        const config={
            method: 'put',
            headers:{
            	'content-type': 'application/json; charset=utf-8'
            },
        	body: JSON.stringify(waitData)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

async function refuseUserToServer(waitData){
    try {
        const url='/wait/refuse/'+waitData.email;
        const config={
            method: 'delete',
            headers:{
            	'content-type': 'application/json; charset=utf-8'
            },
        	body: JSON.stringify(waitData)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('accept')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        console.log(grnoVal);
        let waitData={
        email: emailVal,
        grno: grnoVal
        };
        acceptUserToServer(waitData).then(result=>{
            if(result>0){
                alert("가입 승인");
                location.reload();
            }
        })
        
        
    }
});

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('refuse')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        let waitData={
            email: emailVal,
            grno: grnoVal
        };
        refuseUserToServer(waitData).then(result=>{
            if(result>0){
                alert('거절 완료');
            }
            location.reload();
        });
    }
});