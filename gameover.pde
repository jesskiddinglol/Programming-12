void gameover() {
  if(lives  == 0) {
 lose.show();
  fill(red);
  text("YOU LOSE", 175, 200);
  }
   if(lives  > 0) {
    win.show();
  fill(blush);
  text("YOU WIN", 190, 200);
  }
  //println("over");
   int i = 0;
  if ( i < 1) {
    myButtons[1].show();
    if (myButtons[1].clicked) {
      mode = INTRO;
    }
    i = i + 1;
  }
}


void gameoverClicks() {
  println("o: ", INTRO, mode);
}
