//mode framework

int mode;
final int pattern1 = 1;
final int pattern2 =2;
final int pattern3 = 3;


//varibales
int i;
int x;
int y;
int d;




void setup () {
  size(800, 800);
  mode = pattern1;
}



void draw() {



  strokeWeight(3);

  if (mode==pattern1) {
    pattern1();
  } else if (mode ==pattern2) {
    pattern2();
  } else if (mode == pattern3) {
    pattern3();
  } else {
    println("Pattern error:" + mode);
  }
  tactileL(100, 400, 100);
  tactileR(700, 400, 100);
  fill(0);
  textSize(50);
  text("<", 90, 420);
  text(">", 690, 420);
}


void tactileL (int x, int y, int d) {

  if (mouseX > x-d/2 && mouseX < x +d/2 && mouseY > y - d/2 && mouseY < y + d/2) {
    stroke(2);

    fill(125);
  } else {
    fill(255);
  }
  circle(x, y, d);
}


void tactileR (int x, int y, int d) {

  if (mouseX > x-d/2 && mouseX < x +d/2 && mouseY > y - d/2 && mouseY < y + d/2) {

    stroke(2);
    fill(125);
  } else {
    fill(255);
  }
  circle(x, y, d);
}
