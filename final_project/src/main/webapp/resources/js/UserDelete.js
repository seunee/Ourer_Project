async function removeUserAtServer(delData){
    try {
        const url='/wait/remove/'+delData.email;
        const config={
            method: 'delete',
            headers:{
               'Content-type': 'application/json; charset=utf-8'
            },
           body: JSON.stringify(delData)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('del')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        console.log(grnoVal);
        let delData={
            email: emailVal,
            grno: grnoVal
            };
        removeUserAtServer(delData).then(result=>{
            if(result>0){
                alert('강퇴 완료');
            }
               location.reload();
        });

    }
});