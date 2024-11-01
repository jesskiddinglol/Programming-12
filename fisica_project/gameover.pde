void gameover () {
background(255, 0, 0);
redcar.removeFromWorld();
redcar.setDrawable(false);
purplecar.removeFromWorld();
purplecar.setDrawable(false);
heart1.removeFromWorld();
heart1.setDrawable(false);
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
