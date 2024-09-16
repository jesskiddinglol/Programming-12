void instructions () {
  soccer = loadImage("stadium.jpg");
  image(soccer, 0, 0, width, height);
  cool= createFont("varsity_regular.ttf", 200);
  fill(255);
  textFont(cool);
  textSize(100);
  text("MINI SOCCER", 100, 200);
  textSize(40);
  text("for player A:", 270, 300);
  textSize(20);
  text("press W to move foward, A to move left, D to move right, S to move down", 50, 350);
  textSize(40);
   text("for player B:", 270, 400);
   textSize(20);
   text("press up arrow to move foward, left arrow to move left,", 120, 450);
  text("right arrow to move right, down arrow to move down", 130, 500);
  
  tactile();
}


void instructClicks() {
  if(mouseX > 200 && mouseX < 600 && mouseY > 550 && mouseY < 700) {
    mode = GAME;
  }
  
  
}


void tactile() {
  fill(0);
  strokeWeight(20);
  rect(200, 550, 400, 150);
  if(mouseX > 200 && mouseX < 600 && mouseY > 550 && mouseY < 700) {
    stroke(255, 0, 0);  
  }else{
    stroke(blue);
    
  }
  
  
}
