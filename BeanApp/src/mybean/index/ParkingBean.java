package mybean.index;


import java.util.ArrayList;
import java.util.List;


public class ParkingBean {
	private ArrayList list = new ArrayList();//���ʹ� ����ȭ�Ǿ� �ֵ��� ���� �迭�� �ٸ�


	public void setEnter(String plateNumber){
		CarDto car = new CarDto(plateNumber, System.currentTimeMillis());
		list.add(car);
	}//���� ���Դٰ� �� ������ list��� �������� car��ü�� ��� ����



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
	public CarDto[] getCarDto(){//�迭�� ���� �׼��±� ������ �������� �Ű������� �־ �׼��±׸� ������->��ũ��Ʈ���� �̿��ؾ���)

		CarDto[] cars = new CarDto[list.size()];//CarDto�� ������ ���� ���� ���� ������ ���� ��ü, �� ������ ������ ����: cars

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
