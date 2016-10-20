public class Oups {
     private int value;

     public void setValue(int value) {
         System.out.println("In SetValue");
       synchronized(readLock) {
         synchronized(writeLock) {
           this.value=value;
         }
       }
     }

     public int getValue() {
       synchronized(readLock) {
        return value;
       }
     }

     public void performs() throws InterruptedException {
       Thread t = new Thread() {
         @Override public void run() {
           setValue(12);
             System.out.println("Performing");
         }
       };

       synchronized(writeLock) {
         t.start();
         Thread.sleep(1000);

         System.out.println(getValue());
       }
     }

     private final Object readLock = new Object();
     private final Object writeLock = new Object();

     public static void main(String[] args) throws InterruptedException {
       Oups oups = new Oups();
       oups.performs();
     }
   }