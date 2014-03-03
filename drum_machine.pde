PApplet app = this;
Channel channel_1;

int step, steps;

void setup() {
  size(1024, 768);
  frameRate(10);
  background(#2D2D2D);
  channel_1 = new Channel(app, 10, 10);
  step = 1;
  steps = 16;
}

void draw() {
  background(#E2E2E2);
  channel_1.display(); 
  channel_1.trigger(step-1);
  println(step);
  if ( step % steps == 0 ) {
    step = 1;
  } else {
    step++;
  }
}

