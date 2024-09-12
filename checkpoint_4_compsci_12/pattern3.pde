void pattern3 () {
  background(0);


  circles(0, 0, 100);
  circles(0, 0, 75);
  circles(0, 0, 50);
  circles(0, 0, 25);
}


void circles (int x, int y, int d) {
  while (y <=900 ) {
    fill(255);
    circle(x, y, d);
    x = x + 100;
    if ( x == 900) {
      x = 0;
      y = y +100;
    }
  }
}






  void pattern3Clicks() {
    if (mouseX > 50 && mouseX < 150 && mouseY > 350 && mouseY < 450) {
      mode = pattern2;
    }

    if (mouseX > 650 && mouseX < 750 && mouseY > 350 && mouseY < 450) {
      mode = pattern1;
    }
  }
