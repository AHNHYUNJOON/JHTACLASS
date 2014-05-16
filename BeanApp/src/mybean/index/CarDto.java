package mybean.index;


import java.io.Serializable;
import java.util.Date;

//차 정보 저장하기위한클래스
//별다른 기능 없이 객체만을 만들어주는 클래스
public class CarDto implements Serializable{
	private String plateNumber;
	private long parkingTime;


	public CarDto(){}
	public CarDto(String plateNumber, long parkingTime){//두개를 묶어서 쓰기 위해 매개변수로 전달
		this.plateNumber = plateNumber;
		this.parkingTime = parkingTime;
	}


	public String getPlateNumber(){
		return plateNumber;
	}


	public Date getParkingTime(){
		return new Date(parkingTime);
	}
}
