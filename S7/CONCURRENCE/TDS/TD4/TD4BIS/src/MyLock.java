/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    import java.util.concurrent.locks.ReentrantLock;


/**
 *
 * @author Rémy Kaloustian
 */


public class MyLock {
   private int version = 0;
   private long lastUpdate = System.nanoTime();
   private final ReentrantLock myLock = new ReentrantLock();
   
   public int getVersion() {
      myLock.lock();
      try{
         return version;
      }
      finally{
         myLock.unlock();
      }
   }

   public void setVersion(int version) {
      myLock.lock();
      try{
         this.version = version;
      }
      finally{
         myLock.unlock();
      }
   }

   public long getLastUpdate() {
      myLock.lock();
      try{
         return lastUpdate;
      }
      finally{
         myLock.unlock();
      }
   }

   public void setLastUpdate(long lastUpdate) {
      myLock.lock();
      try{
         this.lastUpdate = lastUpdate;
      }
      finally{
         myLock.unlock();
      }
   }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
      final MyLock pl = new MyLock();
      
      for (int i = 0; i < 10; i++) {
         final int id = i;
         new Thread(new Runnable(){
            @Override
            public void run() {
               for(;;) {
                  System.out.println("lecteur "+id
                        +" webcam_"+pl.getVersion()+".jpg "
                        +"("+pl.getLastUpdate()+")");               
               }
            }
         }).start();
      }
      
      new Thread(new Runnable(){
         @Override
         public void run() {
            for(;;){
               long cur_time = System.nanoTime();
               if (cur_time > (pl.getLastUpdate() + 1000000000L)){
                  pl.setVersion(pl.getVersion() + 1);
                  pl.setLastUpdate(cur_time);                  
               }
            }
         }   
      }).start();
   }
}
    

