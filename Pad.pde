public class Pad {
  
  PApplet app;
  
  // Button
  int x, y, w, h;
  int radii;

  // States
  int state;
  final int OFF = 0;
  final int ON = 1;
  final color OFF_COLOR = #818181;
  final color ON_COLOR = #FF5B5B;
  
  Pad (PApplet app) {
    this(app, 0, 0);
  }
  
  Pad (PApplet app, int posX, int posY) {
    this(app, posX, posY, 32, 32); 
  }

  Pad (PApplet app, int posX, int posY, int w, int h) {
    this.app = app;
    app.registerMethod("mouseEvent",this);
    
    this.state = OFF;

    this.x = posX;
    this.y = posY;
    this.w = w;
    this.h = h;
    this.radii = 7;

  }

  public void display() {
    stroke(#000000);
    
    if (this.state == ON) {
      fill(ON_COLOR);
    } else {
      fill(OFF_COLOR);
    }
    
    rect(x,y,w,h,radii);
  }
  
  public void mouseEvent(MouseEvent event) {
    int eX = event.getX();
    int eY = event.getY();
    
    switch ( event.getAction() ) {
      case MouseEvent.PRESS:
        // change direction when the mouse is pressed
        if ( eX > this.x
          && eX < this.x + this.w
          && eY > this.y
          && eY < this.y + this.h ) {
            this.toggle();
        }
        
        
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

  public void toggle() {
    if (this.state == OFF) {
      this.setOn();
    } else {
      this.setOff();
    }
  }

  public void setOn() {
    this.state = ON;
  }
  public boolean isOn() {
    return this.state == ON ? true : false;
  }
  
  public void setOff() {
    this.state = OFF;
  }
  
  public boolean isOff() {
    return this.state == OFF ? true : false;
  }

  public int getState() {
    return this.state;
  }
  
  public void setX(int posX) {
    this.x = posX;
  }
  public int getX() {
    return this.x; 
  }
  
  public void setY(int posY) {
    this.y = posY;
  }
  public int getY() {
    return this.y; 
  }
  
  
  public void setWidth(int w) {
    this.w = w;
  }
  public int getWidth() {
    return this.w; 
  }
  
  public void setHeight(int h) {
    this.h = h;
  }
  public int getHeight() {
    return this.h; 
  }

}
