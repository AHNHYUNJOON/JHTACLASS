package mvc.exam3;

public class CommandFactory {
	private CommandFactory(){}//외부에서 객체를 생성할 수 없도록 생성자를 private으로 막음 //singleton 패턴
	private static CommandFactory instance = new CommandFactory();//객체 생성 
	public static CommandFactory getInstance(){		
		return instance;
	}//객체를 하나만 생성하도록 만들기 끝
	
	//객체생산설비 마련시작
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
