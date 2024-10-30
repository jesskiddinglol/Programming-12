void gameover () {
background(255, 0, 0);
textSize(100);
if(leftlife > rightlife) {
  text("LEFT WINS", 100, height/2);
} else 
if(rightlife > leftlife) {
    text("RIGHT WINS", 100, height/2);
}

  
}



void gameoverClicks () {
  
  mode = INTRO;
  
}
