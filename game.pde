void game() {
  if (lives == 0) {
    mode = GAMEOVER;
  }
}



void gameClicks() {
  mode = GAME2;
  game2Setup();
}
void gameSetup() {
  gameReset();
  //gamePipe();
}
