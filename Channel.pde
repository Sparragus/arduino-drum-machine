import ddf.minim.*;
import ddf.minim.ugens.*;


public class Channel {
  
  Minim minim;
  AudioOutput out;
  
  Sampler sample;
  
  PApplet app;
  Pad[] pads;
  int x, y;
  
  Channel (PApplet app, int posX, int posY) {
    this.app = app;
    
    minim = new Minim(app);
    out   = minim.getLineOut();
    sample = new Sampler("snare.wav", 4, minim);
    sample.patch(out);
    
    this.x = posX;
    this.y = posY;
    
    this.pads = new Pad[16];
    int padSpacing = 4;
    int padWidth = 32;
    for(int i = 0; i < this.pads.length; i++) {
      this.pads[i] = new Pad(this.app
                           , this.x
                           + padSpacing * i
                           + padWidth * i
                           , this.y
                           , padWidth
                           , padWidth 
                           );
    }
  }
  
  public void display() {
    for(int i = 0; i < this.pads.length; i++) {
      this.pads[i].display();
    }
  }
  
  public void mouseEvent(MouseEvent event) {
    int eX = event.getX();
    int eY = event.getY();
    
    switch ( event.getAction() ) {
      case MouseEvent.PRESS:
        // do something...
        break;
      case MouseEvent.RELEASE:
        // do something...
        break;
      case MouseEvent.CLICK:
        // do something...
        break;
      case MouseEvent.DRAG:
        // do something...
        break;
      case MouseEvent.MOVE:
        // do something...
        break;
    }
  }
  
  public void trigger(int step) {
    if ( pads[step].isOn() ) {
      // play sound/send signal
      sample.trigger();
//      println("Step: " + step + ", State: " + pads[step].getState());
    }
  }
  
}