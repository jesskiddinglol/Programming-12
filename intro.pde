void intro () {
image(back, 0, 0, width, height);
fill(sunset);
  //println("E");
  textFont(mario);
  textAlign(CENTER);
  text("PLATFORMER", 300, 160);
  textAlign(CORNER);
  
  int i = 0;
  if ( i < 1) {
    myButtons[0].show();
    if (myButtons[0].clicked) {
      mode = GAME;
      gameReset();
    }
    i = i + 1;
  }
  
}

void introClicks() {
}
