package mvc.exam3;

public class CommandFactory {
	private CommandFactory(){}//�ܺο��� ��ü�� ������ �� ������ �����ڸ� private���� ���� //singleton ����
	private static CommandFactory instance = new CommandFactory();//��ü ���� 
	public static CommandFactory getInstance(){		
		return instance;
	}//��ü�� �ϳ��� �����ϵ��� ����� ��
	
	//��ü���꼳�� ���ý���
	public ICommand createCommand(String cmd){
		if(cmd.equals("MAIN")){
			return new MainCommand();
		}
		else if(cmd.equals("REGFORM")){
			return new RegFormCommand();
		}
		else if(cmd.equals("REGCONFIRM")){
			return new RegConfirmCommand();
		}
		else if(cmd.equals("REGCOMPLETE")){
			return new RegCompleteCommand();
		}
		else if(cmd.equals("ZIPSEARCH")){
			return new ZipCommand();
		}
		else {
			return null;
		}	
	}
}
