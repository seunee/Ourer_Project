$("input:checkbox").change(function(){
    if(this.checked){
        $(this).attr('value', 1);
    }else{
        $(this).attr('value', 0);
    }
});
