// check.js�� ����
/*
	�ΰ� ���� �˻�
	obj : document.form��ü.inputType
	name : �޽���
*/
function isId(obj){
	var data = obj.value;
	if((data.length == 0)|| (data != "tyvldahf")){
			return false;
		
	}
	return true;
}

function isPassword(obj){
	var password = obj.value;
	if(password != "!@qwert123"){
		return false;
	}
	else 
		return true;
}


