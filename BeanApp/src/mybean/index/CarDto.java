package mybean.index;


import java.io.Serializable;
import java.util.Date;

//�� ���� �����ϱ�����Ŭ����
//���ٸ� ��� ���� ��ü���� ������ִ� Ŭ����
public class CarDto implements Serializable{
	private String plateNumber;
	private long parkingTime;


	public CarDto(){}
	public CarDto(String plateNumber, long parkingTime){//�ΰ��� ��� ���� ���� �Ű������� ����
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
