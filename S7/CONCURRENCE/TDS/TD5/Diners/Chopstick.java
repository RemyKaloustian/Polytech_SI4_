import java.awt.*;

class Chopstick {

    boolean taken=false;
    PhilCanvas display;
    int identity;

    Chopstick(PhilCanvas display, int identity) {
        this.display = display;
        this.identity = identity;
    }

    synchronized void put() {
        display.setChop(identity,taken);
    }

    synchronized void get() throws java.lang.InterruptedException {
        display.setChop(identity,taken);
    }
}
