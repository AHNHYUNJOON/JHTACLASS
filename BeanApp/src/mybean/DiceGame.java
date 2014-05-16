package mybean;

import java.util.Random;

/*
 * name            r/w         data type      desc
 * --------------------------------------------------------------
 * randomNumber      r(get)      int            임의의 수를 발생
 * maxNumber      r/w         int            최대 크기의 숫자
 * minNumber      r/w         int            최소 크기의 숫자
 * 
 * 
 */

public class DiceGame 
{
   private Random ran = new Random();
   private int max;
   private int min;
   
   public int getRandomNumber()
   {
       //return random.nextInt(6)+1;
      return ran.nextInt(max-min+1)+min;
      
      
   }
   
   public int getMaxNumber()
   {
      return max;
      
      
   }
   
   public int getMinNumber()
   {
      return min;
      
      
   }
   
   public void setMaxNumber(int max)
   {
      this.max=max;
      
      
   }
   
   public void setMinNumber(int min)
   {
   
      this.min=min;
      
   }
   
   
   
}