import java.awt.*;
import java.applet.*;
import java.lang.System;
import java.util.concurrent.*;


/*********************CARPARK CONTROL*****************************/

class CarParkControl {

    protected int spaces;
    protected int capacity;
    
    Semaphore prive = new Semaphore(0);
     Semaphore mutex = new Semaphore(spaces);

    CarParkControl(int n) {
        capacity = spaces = n;
    }

    void arrive() throws InterruptedException {
            mutex.acquire();
            while(spaces<=0)
            {
                mutex.release();
                prive.acquire();
                mutex.acquire();
            }
           --spaces;
           mutex.release();
    }                                       

    void depart() throws InterruptedException {
        mutex.acquire();
        while(spaces>=capacity)
            {
                mutex.release();
                prive.acquire();
                mutex.acquire();
                
            }
        ++spaces;
        mutex.release();
    }
}

/*******************ARRIVALS************************/

class Arrivals implements Runnable {

    CarParkControl carpark;

    Arrivals(CarParkControl c) {
        carpark = c;
    }

    public void run() {
      try {
        while(true) {
           ThreadPanel.rotate(330);
           carpark.arrive();
           ThreadPanel.rotate(30);
        }
      } catch (InterruptedException e){}
    }
}

/********************DEPARTURES*******************************/

class Departures implements Runnable {

    CarParkControl carpark;

    Departures(CarParkControl c) {
        carpark = c;
    }

    public void run() {
      try {
        while(true) {
            ThreadPanel.rotate(180);
            carpark.depart();
            ThreadPanel.rotate(180);

        }
      } catch (InterruptedException e){}
    }
}

/****************************APPLET**************************/

public class CarPark extends Applet {

    final static int Places = 4;

    ThreadPanel arrivals;
    ThreadPanel departures;
    CarParkCanvas carDisplay;

    public void init() {
        super.init();
         // Set up Display
        arrivals = new ThreadPanel("Arrivals",Color.blue);
        departures = new ThreadPanel("Departures",Color.yellow);
        carDisplay = new CarParkCanvas("CarPark",Places,this);
        GridBagLayout gridbag = new GridBagLayout();
        setLayout(gridbag);
        GridBagConstraints gc = new GridBagConstraints();
        gc.anchor = GridBagConstraints.NORTH;
        gridbag.setConstraints(carDisplay, gc);
        gridbag.setConstraints(arrivals, gc);
        gridbag.setConstraints(departures, gc);
        add(arrivals);
        add(carDisplay);
        add(departures);
    }

    public void start() {
        CarParkControl c = new DisplayCarPark(carDisplay,Places);
        arrivals.start(new Arrivals(c));
        departures.start(new Departures(c));
    }


    public void stop() {
        arrivals.stop();
        departures.stop();
    }

}

/**************************************************************/

class DisplayCarPark extends CarParkControl {

    CarParkCanvas disp;
    boolean occupied[];

    DisplayCarPark(CarParkCanvas disp,int size) {
        super(size);
        this.disp = disp;
        occupied = new boolean[size];
        for (int i=0; i<size; i++) occupied[i]=false;
    }

    private void display() {
        disp.setvalue(spaces,occupied);
    }

    public void arrive() throws InterruptedException {
        super.arrive();
        synchronized (this) {
	    occupied[place(false)]=true;
	    display();
	    Thread.sleep(400);
	}
    }
    
    public void depart() throws InterruptedException {
        super.depart();
        synchronized (this) {
	    occupied[place(true)]=false;
	    display();
	}
    }

    private int place(boolean v) {
        int start = ((int)(Math.random() * 1000))% capacity;
        for (int i =0; i<capacity; i++) {
            int j = (start + i) % capacity;
            if(occupied[j] == v) return j;
        }
        return 0; //should never happen
    }

 }

/**************************************************************/

class CarParkCanvas extends Canvas {
    String title;
    int slots;
    int spaces;
    boolean occupied[];
    Applet applet;
    Image  car;

    Font f1 = new Font("Helvetica",Font.ITALIC+Font.BOLD,24);
    Font f2 = new Font("TimesRoman",Font.BOLD,36);

    CarParkCanvas(String title, int slots, Applet applet) {
        super();
        this.title=title;
        this.slots=slots;
        spaces = slots;
        this.applet = applet;
        this.occupied = new boolean[slots];
        for (int i=0; i<slots; i++) occupied[i] = false;
        resize(20+50*slots,150);
        setBackground(Color.cyan);
        MediaTracker mt;
        mt = new MediaTracker(this);
        car = applet.getImage(applet.getDocumentBase(), "image/car.gif");
        System.out.println("IMAGE : " + car.getWidth(applet));
        mt.addImage(car, 0);
        try {
            mt.waitForID(0);
        } catch (java.lang.InterruptedException e) {
            System.out.println("Couldn't load car image");
        }
  	}

    public void setvalue(int spaces, boolean occupied[]){
        this.spaces = spaces;
        this.occupied = occupied;
        repaint();
    }

    public void paint(Graphics g) {
        update(g);
    }

    Image offscreen;
    Dimension offscreensize;
    Graphics offgraphics;

    public synchronized void update(Graphics g){
        Dimension d = size();
	    if ((offscreen == null) || (d.width != offscreensize.width)
	                            || (d.height != offscreensize.height)) {
	        offscreen = createImage(d.width, d.height);
	        offscreensize = d;
	        offgraphics = offscreen.getGraphics();
	        offgraphics.setFont(getFont());
	    }

	    offgraphics.setColor(getBackground());
	    offgraphics.fillRect(0, 0, d.width, d.height);

         // Display the title
        offgraphics.setColor(Color.black);
        offgraphics.setFont(f1);
        FontMetrics fm = offgraphics.getFontMetrics();
        int w = fm.stringWidth(title);
        int h = fm.getHeight();
        int x = (size().width - w)/2;
        int y = h;
        offgraphics.drawString(title, x, y);
        offgraphics.drawLine(x,y+3,x+w,y+3);
        // CarPark Places
        y = h+10;
        offgraphics.setColor(Color.white);
        offgraphics.fillRect(10,y,50*slots,100);
        offgraphics.setColor(Color.black);
        for(int i=0; i<slots; i++) {
            offgraphics.drawRect(10+50*i,y,50,100);
        }
        offgraphics.setColor(Color.white);
        for(int i=1; i<slots; i++) {
            offgraphics.drawLine(10+50*i,y+60,10+50*i,y+99);
        }
        //arrival gate
        if (spaces==0)
             offgraphics.setColor(Color.black);
        else
             offgraphics.setColor(Color.white);
        offgraphics.fillRect(8,y+60,5,39);
        //departure gate
        if (spaces==slots)
             offgraphics.setColor(Color.black);
        else
             offgraphics.setColor(Color.white);
        offgraphics.fillRect(8+50*slots,y+60,5,39);
        //Display Cars
        offgraphics.setColor(Color.blue);
        for (int i=0; i<slots; i++) {
          if (occupied[i])
            offgraphics.drawImage(car,15+50*i,y+5,this);
        }
        g.drawImage(offscreen, 0, 0, null);
    }
}


