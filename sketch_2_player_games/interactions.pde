void mouseReleased() {
  if (mode==INSTRUCTIONS) {
    instructClicks();
  }else if (mode == GAME) {
    gameClicks();
  }else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
