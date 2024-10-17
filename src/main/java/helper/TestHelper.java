package helper;

public class TestHelper {

	
	
	public static String get10Words(String desc) {
		
		try {
			
			String[] text = desc.split(" ");
			
			String result="";
			if(text.length > 10) {
				
				for(int i=0;i<10;i++) {
					result = result +text[i]+" ";
				}
				
				return (result + "...");
				
			}else {
				
				return (desc+"...");
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		return desc;
		
	}
}
