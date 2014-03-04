public class SevenSegment {

  PApplet app;
  PFont titleFont, valuesFont;
  String title;
  int titleX, titleY;
  int bgX, bgY;
  int valueX, valueY;
  int buttonUpX, buttonUpY;
  int buttonDownX, buttonDownY;
  int buttonWidth, buttonHeight;
  int min, max;
  int value;

  SevenSegment (PApplet app, String title, int posX, int posY, int minVal) {
    this(app, title, posX, posY, minVal, 999);
  }

  SevenSegment (PApplet app, String title, int posX, int posY, int minVal, int maxVal) {
    this.app = app;
    this.app.registerMethod("draw", this);
    this.app.registerMethod("mouseEvent", this);

    titleFont = loadFont("Tommaso-17.vlw");
    valuesFont = loadFont("digital-7-39.vlw");

    this.title = title;

    this.titleX = posX-2;
    this.titleY = posY;
    this.bgX = posX;
    this.bgY = posY+17;
    this.valueX = posX+58;
    this.valueY = posY+22;
    this.buttonUpX = posX+70;
    this.buttonUpY = posY+20;
    this.buttonDownX = posX+70;
    this.buttonDownY = posY+38;

    this.buttonWidth = 13;
    this.buttonHeight = this.buttonWidth;

    this.min = minVal;
    this.max = maxVal;
    this.value = minVal;
  } 

  public void draw() {
    // Seven Segment Title
    textFont(titleFont);
    textAlign(LEFT, TOP);
    fill(#BC3325);
    text(this.title, this.titleX, this.titleY);

    // Seven Segment Screen Background
    fill(#1A1818);
    stroke(#000000);
    strokeWeight(5);
    rect(this.bgX, this.bgY, 62, 36);

    // Seven Segment Value Background
    textFont(valuesFont);
    textAlign(RIGHT, TOP);
    fill(#242323);
    text("888", this.valueX, this.valueY);

    // Seven Segment Value
    fill(#EB3D2A);
    text(value, this.valueX, this.valueY);

    // Draw Button Up
    stroke(#000000);
    strokeWeight(1);
    fill(#D46CE7);
    rect(buttonUpX, buttonUpY, buttonWidth, buttonHeight);
    // Draw Button Down
    fill(#8DBABC);
    rect(buttonDownX, buttonDownY, buttonWidth, buttonHeight);
  }


  public int getValue() {
    return this.value;
  }
  public void setValue(int value) {
    this.value = value;
  }

  public int getMin() {
    return this.min;
  }

  public int getMax() {
    return this.max;
  }

  private boolean isInsideButtonUp(int eX, int eY) {
    if (  eX > buttonUpX
      && eX < buttonUpX + buttonWidth
      && eY > buttonUpY
      && eY < buttonUpY + buttonHeight) {
      return true;
    }

    return false;
  }

  private boolean isInsideButtonDown(int eX, int eY) {
    if (  eX > buttonDownX
      && eX < buttonDownX + buttonWidth
      && eY > buttonDownY
      && eY < buttonDownY + buttonHeight) {
      return true;
    }

    return false;
  }

  public void mouseEvent(MouseEvent event) {
    int eX = event.getX();
    int eY = event.getY();

    switch ( event.getAction() ) {
    case MouseEvent.PRESS:
      if (isInsideButtonUp(eX, eY)) {
        this.value = (this.value < this.max)? ++this.value : this.value;
      }
      else if (isInsideButtonDown(eX, eY)) {
        this.value = (this.value > this.min)? --this.value : this.value;
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
}

