package mybean;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

import javax.servlet.ServletContext;

public class FileCounter {
   private int counter;
   private ServletContext ccc;   
      
   public int getCounter() {
      BufferedReader br = null;
      try{
         String path = ccc.getRealPath("/");
         br = new BufferedReader(new FileReader(path + "\\counter.txt"));
         String cnt = br.readLine();
         if(cnt != null){
            counter = Integer.parseInt(cnt);
         }
         else{
            counter = 0;
         }
      }
      catch(Exception e){
         System.out.println("카운터값 가져오려다 실패 : " + e);
      }
      finally{
         if(br != null)
            try { br.close(); } catch(Exception err){};
      }   
      return counter;
   }   

   public void setbbb(boolean b) {
      if(b){
         getCounter();
         PrintWriter pw = null;
         try{
            pw = new PrintWriter(ccc.getRealPath("/") + "\\counter.txt");
            pw.println(++counter);
         }
         catch(Exception err){
            System.out.println("카운터값 저장하려다 실패 : " + err);
         }
         finally{
            if(pw != null)
               try { pw.close(); } catch(Exception err){};
         }   
      }
   }
   
   public void setCcc(ServletContext c) {      
      ccc=c;
   }   
}