void gameover () {
  background(0);
  redcar.removeFromWorld();
  redcar.setDrawable(false);
  purplecar.removeFromWorld();
  purplecar.setDrawable(false);
  leftlife = 12;
  rightlife = 12;
  //ask mr pellitier abt what happens the second time
  heart1.setDrawable(true);
  heart2.setDrawable(true);
  heart3.setDrawable(true);
  heart1P.setDrawable(true);
  heart2P.setDrawable(true);
  heart3P.setDrawable(true);

stroke(0);
  textSize(100);
  if (leftlife > rightlife || aliveP == false) {
    fill(red);
    rect(0, 0, width, height);
    fill(255);
    text("(LEFT WINS)", 400, 300);
  } else
  if (rightlife > leftlife || alive == false) {
    fill(purple);
    rect(0, 0, width, height);
    fill(255);
    text("(RIGHT WINS)", 400, 300);
  }

  if (alive == false) {
    fill(purple);
    rect(0, 0, width, height);
    fill(255);
    text("(RIGHT WINS)", 400, 300);
     int i = 0;
  if ( i < 1) {
    myButtons[1].show();
    if (myButtons[1].clicked) {
      mode = INTRO;
    }
    i = i + 1;
  }
  }
  if (aliveP == false) {
    fill(red);
    rect(0, 0, width, height);
    fill(255);
    text("(LEFT WINS)", 400, 300);
         int i = 0;
  if ( i < 1) {
    myButtons[2].show();
    if (myButtons[2].clicked) {
      mode = INTRO;
    }
    i = i + 1;
  }
  }
  // ask mr pellitier about this if(redcar.setSensor(false)) {
  //}
 
}



void gameoverClicks () {
}
