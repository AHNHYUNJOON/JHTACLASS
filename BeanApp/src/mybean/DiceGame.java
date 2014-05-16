package mybean;

import java.util.Random;

/*
 * name            r/w         data type      desc
 * --------------------------------------------------------------
 * randomNumber      r(get)      int            ������ ���� �߻�
 * maxNumber      r/w         int            �ִ� ũ���� ����
 * minNumber      r/w         int            �ּ� ũ���� ����
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