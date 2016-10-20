//@author: j.n.magee 11/11/96

//************************************************************
// the interface for ReadWrite monitor implementations

class ReadWritePriority implements ReadWrite {

   synchronized public void acquireRead() throws InterruptedException {}

   synchronized public void releaseRead(){}

   synchronized public void acquireWrite() throws InterruptedException {}

   synchronized public void releaseWrite(){}
 }


