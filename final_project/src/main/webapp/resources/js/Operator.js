async function appointmentUserToServer(manageData){
    try {
        const url='/wait/appointment/'+manageData.email;
        const config={
            method: 'put',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(manageData)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
         
    }
};
async function cancellationUserToServer(manageData){
    try {
        const url='/wait/cancellation/'+manageData.email;
        const config={
            method: 'put',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(manageData)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
         
    }
};

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('appointment')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        console.log(grnoVal);
        let manageData={
        email: emailVal,
        grno: grnoVal
        };
        appointmentUserToServer(manageData).then(result=>{
            if(result>0){
                alert('운영진 임명 완료');
            }
            location.reload();
        });
    }
});

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('cancellation')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        console.log(grnoVal);
        let manageData={
	        email: emailVal,
	        grno: grnoVal
        };
        cancellationUserToServer(manageData).then(result=>{
            if(result>0){
                alert('운영진 해제 완료');
            }
            location.reload();
        });
    }
});