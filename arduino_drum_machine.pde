PApplet app = this;
Channel[] channels;
Led[] leds;
SevenSegment bpm;

int currentStep, steps;
PImage bg;

void setup() {
  size(680, 300);
  frameRate(5);
  
  bg = loadImage("background.jpg");
  background(bg);
  
  channels = new Channel[4];
  for (int i = 0; i < channels.length; i++) {
    channels[i] = new Channel(app, 54, 100 + 40*i);
  }
  
  currentStep = 0;
  steps = 16;
  
  leds = new Led[steps];
  for (int i = 0; i < leds.length; i++) {
    leds[i] = new Led(70 + 36*i, 83, 8);
  }
  
  bpm = new SevenSegment(app, "BPM", 56, 10, 1, 180);
  bpm.setValue(120);
}

void draw() {
  background(bg);  
  
  // set framerate from bpm
  frameRate( map(bpm.getValue(), bpm.getMin(), bpm.getMax(), 0, bpm.getMax()/15) );
  
  
  // Leds
  leds[(currentStep == 0) ? steps-1 : currentStep-1].setOff();
  leds[currentStep].setOn();
  
  for(int i = 0; i < steps; i++) {
    leds[i].display();
  }
  
  // Channels
  for (int i = 0; i < channels.length; i++) {
    channels[i].trigger(currentStep);
  }

  currentStep = (currentStep < steps-1) ? ++currentStep : 0;

}

