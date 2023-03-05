async function removeGroupAtServer(grno){
    try {
        const url='/group/remove/'+grno;
        const config={
            method: 'delete'
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('del')){
        let tr=e.target.closest('tr');
        let grnoVal=tr.dataset.grno;
        console.log(grnoVal);
        removeGroupAtServer(grnoVal).then(result=>{
            if(result>0){
                alert('소모임 삭제 완료');
            }
            location.reload();
        });
    }
});