// check.js로 저장
/*
	널값 여부 검사
	obj : document.form객체.inputType
	name : 메시지
*/
function isId(obj){
	var data = obj.value;
	if((data.length == 0)|| (data != "user1")){
			return false;
		
	}
	return true;
}

function isPassword(obj){
	var password = obj.value;
	if(password != "1111"){
		return false;
	}
	else 
		return true;
}


