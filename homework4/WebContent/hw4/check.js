// check.js�� ����
/*
	�ΰ� ���� �˻�
	obj : document.form��ü.inputType
	name : �޽���
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


