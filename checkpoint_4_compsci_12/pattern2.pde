void pattern2 () {
background(0);

int x = 0;
int y = 50;



while( y <= 850 ) {
  fill(0, 255, 0);
  triangle(x, y, x+50, y-50, x+100, y);
  triangle(x, y, x+50, y-100, x +100, y);
  x = x+100;
  
  if(x == width) {
    x = 0;
    y = y + 50;
  }
}
}

void pattern2Clicks() {
  if(mouseX > 50 && mouseX < 150 && mouseY > 350 && mouseY < 450) {
  mode = pattern1;
}

if(mouseX > 650 && mouseX < 750 && mouseY > 350 && mouseY < 450) {
mode = pattern3;
}
  
  
}
