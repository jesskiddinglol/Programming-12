void pattern3 () {
background(0, 255, 0);
}



void pattern3Clicks() {
  if(mouseX > 50 && mouseX < 150 && mouseY > 350 && mouseY < 450) {
  mode = pattern2;
}

if(mouseX > 650 && mouseX < 750 && mouseY > 350 && mouseY < 450) {
mode = pattern1;
}
  
}
