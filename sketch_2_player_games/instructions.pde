void instructions () {
  soccer = loadImage("stadium.jpg");
  image(soccer, 0, 0, width, height);
  cool= createFont("varsity_regular.ttf", 200);
  fill(255);
  textFont(cool);
  textSize(100);
  text("MINI SOCCER", 220, 200);
  textSize(40);
  text("for player A:", 370, 300);
  textSize(20);
  text("press W to move foward, A to move left, D to move right, S to move down", 150, 350);
  textSize(40);
   text("for player B:", 370, 400);
   textSize(20);
   text("press up arrow to move foward, left arrow to move left,", 220, 450);
  text("right arrow to move right, down arrow to move down", 230, 500);
  
  tactile();
}


void instructClicks() {
  if(mouseX > 300 && mouseX < 700 && mouseY > 550 && mouseY < 700) {
    mode = GAME;
  }
  
  
}


void tactile() {
  strokeWeight(20);
   fill(0);
  rect(300, 550, 400, 150);
  fill(255);
  textSize(100);
  fill(255);
  text("START", 340, 655);
  if(mouseX > 300 && mouseX < 700 && mouseY > 550 && mouseY < 700) {
    stroke(255, 0, 0);  
  }else{
    stroke(blue);
    fill(0);
    
  }
  
  
}
