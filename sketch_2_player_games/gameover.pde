void gameover () {
gameover = createFont("gameover.ttf", 200);
textFont(gameover);
  if(leftscore > rightscore) {
    fill(255, 0, 0, 10);
    rect(0, 0, width, height);
    fill(255);
    textSize(200);
    text("RED WINS", 120, 450);
  } else {
    fill(0, 0, 255, 10);
    rect(0, 0, width, height);
    fill(255);
    textSize(200);
  text("BLUE WINS", 90, 450);
}


  
}


void gameoverClicks() {
  mode = INSTRUCTIONS;
  
}
