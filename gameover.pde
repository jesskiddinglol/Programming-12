void gameover() {
  background(255);
  text("YOU LOSE", 200, 200);
  //println("over");
}


void gameoverClicks() {
  mode = INTRO;
  println("o: ", INTRO, mode);
}
