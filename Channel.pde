import ddf.minim.*;
import ddf.minim.ugens.*;


public class Channel {
  
  Minim minim;
  AudioOutput out;
  
  Sampler sample;
  
  PApplet app;
  Pad[] pads;
  int x, y;
  
  Channel (PApplet app, String sample, int posX, int posY) {
    this.app = app;
    app.registerMethod("draw", this);
    
    this.minim = new Minim(app);
    this.out   = minim.getLineOut();
    this.sample = new Sampler(sample, 4, minim);
    this.sample.patch(out);
    
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
  
  public void draw() {
    for(int i = 0; i < this.pads.length; i++) {
      this.pads[i].display();
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
