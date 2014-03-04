public class Led {
  
  int x, y, d;
  
  // States
  int state;
  final int OFF = 0;
  final int ON = 1;
  final color OFF_COLOR = #9600A8;
  final color ON_COLOR = #E400FF;

  Led (int posX, int posY) {
    this(posX, posY, 8);
  } 
  
  Led (int posX, int posY, int diameter) {
    this.x = posX;
    this.y = posY;
    this.d = diameter;
    
    this.state = OFF;
  } 
  
  public void display() {
    stroke(#000000);
    
    if (this.state == ON) {
      fill(ON_COLOR);
    } else {
      fill(OFF_COLOR);
    }
    
    ellipse(x,y,d,d);
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
}
