async function removeUserAtServer(email){
    try {
        const url='/user/remove/'+email;
        const config={
            method: 'delete',
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
        removeUserAtServer(emailVal).then(result=>{
            if(result>0){
                alert('강퇴 완료');
            }
                location.reload();
        });

    }
});