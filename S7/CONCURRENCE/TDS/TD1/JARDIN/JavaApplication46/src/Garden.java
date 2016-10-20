import java.awt.*;
import java.applet.*;

public class Garden extends Applet {

    Button start_;
    Button stop_;
    Turnstile west_;
    Turnstile east_;

    public void init() {
        super.init();
        // Set up Buttons
        this.setFont(new Font("Helvetica",Font.BOLD,24));
        Panel p1 = new Panel();
        p1.add(start_=new Button("Start"));
        p1.add(stop_=new Button("Stop"));
        // Set up Display
        Panel p2 = new Panel();
        TextCanvas gardenD = new TextCanvas("Garden");
        TextCanvas westD = new TextCanvas("West");
        TextCanvas eastD = new TextCanvas("East");
        gardenD.resize(150,100);
        westD.resize(100,100);
        eastD.resize(100,100);
        p2.add(westD);
        p2.add(gardenD);
        p2.add(eastD);
        // Arrange Applet display
        setLayout(new BorderLayout());
        add("Center",p2);
        add("South",p1);
        // Create Thread
        Counter people_ = new Counter(gardenD);
        west_= new Turnstile(westD,people_,500);
        east_= new Turnstile(eastD,people_,500);
        west_.start();
        east_.start();
    }

    public void start() {
        super.start();
    }

    public void stop() {
        east_.passivate();
        west_.passivate();
    }

    public void destroy() {
        west_.stop();
        east_.stop();
    }


    public boolean handleEvent(Event event) {
        if (event.id != event.ACTION_EVENT) {
            return super.handleEvent(event);
        } else if(event.target==start_) {
            east_.activate();
            west_.activate();
            return true;
        } else if (event.target==stop_) {
            stop();
            return true;
        } else
            return super.handleEvent(event);
    }

}

class Counter {

    int value_=0;
    TextCanvas display_;
    
    boolean occupe;

    Counter(TextCanvas t) {
        display_=t;
        display_.setcolor(Color.cyan);
    }

    //Get synchronized off this
    public   void increment() {
        while(occupe);
        occupe=true;
        int temp = value_;  //read
        Simulate.interrupt();
        ++temp;            //add1
        value_=temp;       //write
        display_.setvalue(value_);
        occupe =false;
    }
}


class Turnstile extends Thread {

    TextCanvas display_;
    int count_=0;
    Counter people_;
    int delay_;
    boolean suspended = true;

    Turnstile(TextCanvas t,Counter c, int d) {
        display_ = t;
        display_.setcolor(Color.red);
        people_ = c;
        delay_ = d;
      }

    synchronized void mysuspend() {
        while (suspended)
            try {wait();} catch (InterruptedException e) {}
    }

    public void passivate() {
        if (!suspended) {
            suspended = true;
            display_.setcolor(Color.red);
           }
    }

    public void activate() {
        if (suspended) {
            suspended = false;
            display_.setcolor(Color.green);
            synchronized(this) {notify();}
        }
    }

    public void run() {
          while(true) {
            mysuspend();
            try {Thread.sleep(delay_);} catch(InterruptedException e){}
            count_++;
            display_.setvalue(count_);
            people_.increment();
          }
    }

}

class TextCanvas extends Canvas {
    int value_ = 0;
    String title_;

    Font f1 = new Font("Helvetica",Font.BOLD,36);
    Font f2 = new Font("Times",Font.ITALIC+Font.BOLD,24);

    TextCanvas(String title) {
        super();
        title_=title;
	}

    public void setcolor(Color c){
        setBackground(c);
        repaint();
    }

    public  void  setvalue(int newval){
        value_ = newval;
        repaint();
    }

    public void paint(Graphics g){

            g.setColor(Color.black);

         // Display the title
            g.setFont(f2);
            FontMetrics fm = g.getFontMetrics();
            int w = fm.stringWidth(title_);
            int h = fm.getHeight();
            int x = (size().width - w)/2;
            int y = h+10;
            g.drawString(title_, x, y);
            g.drawLine(x,y+3,x+w,y+3);


         // Display the value
            g.setFont(f1);
            fm = g.getFontMetrics();
            String s1 = String.valueOf(value_);
            w = fm.stringWidth(s1);
            h = fm.getHeight();
            x = (size().width - w)/2;
            y = (size().height+ h)/2;
            g.drawString(s1, x, y);
         }
}

class Simulate {
    public static void interrupt() {
        if (Math.random()<0.3) Thread.yield();
    }
}
