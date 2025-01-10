void intro () {
  background(0);
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
  
  println(myButtons[0].clicked);
}

void introClicks() {
}
