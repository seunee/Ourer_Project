
document.addEventListener('change',(e)=>{
    console.log(e.target.name);
    if(e.target.name=='code'){
        console.log(e.target.nextElementSibling);
        sel = e.target.nextElementSibling;
        index = e.target.selectedIndex;
        console.log(index);
        for (i=sel.length-1; i>=0; i--){
            sel.options[i] = null
        }
        //console.log(ctnoList[index]);
        for(let i=0; i<ctnoList[index].length;i++){
            sel.options[i]=new Option(ctnoList[index][i], ctnoNum(ctnoList[index][i]));
        }
    }
})


// function seocw(){
//     let ctnoArr=document.getElementsByClassName('ctno');
//     Array.prototype.forEach.call(ctnoArr,(el) => {
//         let sel = el.previousElementSibling;
//         console.log(sel);
//         let index = sel.selectedIndex;
//         console.log(index);
//         for (i=el.length-1; i>=0; i--){
//             el.options[i] = null
//         }
//         for(let i=0; i<ctnoList[index].length;i++){
//             el.options[i]=new Option(ctnoList[index][i], ctnoNum(ctnoList[index][i]));
//         }
//     })
// }



