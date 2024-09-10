color blue = #90e0ef;
color red = #d62828;
color yellow = #ffd60a;
color grey = #6c757d;



void setup() {
  size(800, 800);
  background(blue);
    car(100, 100);

  
}


void car(int x, int y) {
  pushMatrix();
  translate(x, y);
  scale(random(0.5, 1));
  
    
  body();
  window();
  wheels();

  popMatrix();
}

void window() {
  fill(255);
  ellipse(320, 350, 400, 260);
  fill(red);
  rect(120, 350, 400, 130);
}

void body() {
  fill(red);
  noStroke();
  ellipse(120, 440, 260, 170);
  rect(491, 355, 80, 140);
  ellipse(321, 340, 500, 360);
  fill(yellow);
  rect(10, 480, 560, 50);
  ellipse(10, 505, 20, 50);
   ellipse(570, 505, 20, 50);
  
}

void wheels() {
  fill(0);
  circle(120, 530, 150);
   circle(450, 530, 150);
   fill(grey);
   circle(450, 530, 100);
   circle(120, 530, 100);
  
}
