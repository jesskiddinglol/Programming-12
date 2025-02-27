void keyPressed() {
  //'' for keys minus to move up as reducing y coordinates
  if (key == 'w' || key == 'W')  wkey = true;
  if (key == 's' || key == 'S') skey=true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ') spacekey = true;
}



void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S')  skey=false;
  if (key == 'a' || key == 'W') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ') spacekey = false;
  if (key == 'q' || key == 'Q') qkey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  }else if (mode == GAME) {
    gameClicks();
  }else if (mode == GAME2) {
    game2Clicks();
  }else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}

void click () {

  mouseReleased = false; // next frame is back to false
  //check if mouse is being pressed
  if (mousePressed) wasPressed = true ;
  if (wasPressed && mousePressed == false) { //was it pressed and is it now not being pressed. mouse was pressed and its not pressed now
    mouseReleased = true; //when u press down mouse released is false and when ur not released mouse press is true
    wasPressed = false;
  }
}
