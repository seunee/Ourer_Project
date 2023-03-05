async function quitGroupToServer(user){
    try {
        const url='/wait/quit/';
        const config={
            method: 'delete',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(user)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
         
    }
};

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('quit')){
        let tr=e.target.closest('tr');
        // let emailVal=tr.dataset.email;
        let grno=tr.children[0].innerText;
        console.log(emailVal);
        console.log(grno);
        let user={email: emailVal, grno: grno};
        quitGroupToServer(user).then(result=>{
            if(result>0){
                alert('탈퇴 되었습니다.');
            }
            //location.href="/user/mypage/"+sesemailVal;
            location.reload();
        });
    }
});