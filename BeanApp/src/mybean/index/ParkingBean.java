package mybean.index;


import java.util.ArrayList;
import java.util.List;


public class ParkingBean {
	private ArrayList list = new ArrayList();//벡터는 동기화되어 있따는 점이 배열과 다름


	public void setEnter(String plateNumber){
		CarDto car = new CarDto(plateNumber, System.currentTimeMillis());
		list.add(car);
	}//차가 들어왔다고 할 때마다 list라는 보따리에 car객체가 계속 들어옴



	public void setExit(String plateNumber){
		CarDto dto;
		for(int i=0; i<list.size(); i++){
			dto = (CarDto)list.get(i);
			if(plateNumber.equals(dto.getPlateNumber())){
				list.remove(i);
				break;
			}
		}
		
	}


	public int	getTotal(){
		return list.size();
	}


	public CarDto getCarDto(String plateNumber){
		return null;
	}

/*
	public CarDto[] getCarDto(){//배열은 원래 액션태그 못쓰고 위에꺼는 매개변수를 넣어서 액션태그를 못쓴다->스크립트릿을 이용해야함)

		CarDto[] cars = new CarDto[list.size()];//CarDto는 들어오고 나간 차에 대한 정보를 담은 객체, 이 정보를 저장할 변수: cars

		for(int i=0; i<cars.length; i++){
			cars[i] = (CarDto)list.get(i);
		}


		return cars;
	}
	*/
	public List getCarDTo(){
		return list;
	}
}
