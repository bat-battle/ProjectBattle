var init;
function check(fieldName,UseName,RemName,len){
    if(fieldName.value.length>len){
        fieldName.value=init;
        alert("������������ "+len+" ���ַ���");
        return false;
    }
    else{
    	init=fieldName.value;
        UseName.value=eval(fieldName.value.length);
        RemName.value=len-UseName.value;
        return true;
    }
}
