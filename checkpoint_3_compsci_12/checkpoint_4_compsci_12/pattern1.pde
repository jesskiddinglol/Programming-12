void pattern1() {
  background(255);

  int x = 0;
  int y = 0;
  while (y <= height) {
    rect(x, y, 100, 100);
    x = x + 100;//since x is plus 100 to get even must do 2 times 100 if x = x + 1 to get even is 2 times 1
    if ( x == width) {
      x = 0;
      y = y + 100;
    }
    if ((x % 200 == 0 && y % 200==0)||(x % 200 != 0 && y % 200!= 0)) {
      //all even x sqaures in off y coordinates //all odd x sqaures in even y coordinates
      fill(0);
    } else {
      fill(255, 0, 0);
    }
  }
}



void pattern1Clicks() {
  if (mouseX > 50 && mouseX < 150 && mouseY > 350 && mouseY < 450) {
    mode = pattern3;
  }

  if (mouseX > 650 && mouseX < 750 && mouseY > 350 && mouseY < 450) {
    mode = pattern2;
  }
}
