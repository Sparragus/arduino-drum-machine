PApplet app = this;
Channel[] channels;

int step, steps;

void setup() {
  size(680, 300);
  frameRate(5);
  background(#303030);
  channels = new Channel[4];
  for(int i = 0; i < channels.length; i++) {
    channels[i] = new Channel(app, 54, 100 + 40*i);
  }
  step = 1;
  steps = 16;
}

void draw() {
  background(#303030);
  for(int i = 0; i < channels.length; i++) {
    channels[i].trigger(step-1);
  }
  println(step);
  if ( step % steps == 0 ) {
    step = 1;
  } else {
    step++;
  }
}

