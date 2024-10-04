void instructions () {
  reset();
  background(0);
textFont(icon);
fill(255, 0, 0);
text("a", 80, 200);
fill(0, 0, 255);
text("S", 840, 200);
  fill(255);
  textFont(cool);
  textSize(100);
  text("MINI SOCCER", 200, 200);
  textSize(40);
  fill(255, 0, 0);
  text("for red player:", 370, 300);
  textSize(25);
  text("press W to move foward, A to move left, D to move right, S to move down", 65, 350);
  textSize(40);
  fill(0, 0, 255);
   text("for blue player:", 370, 400);
   textSize(25);
   text("press up arrow to move foward, left arrow to move left,", 170, 450);
  text("right arrow to move right, down arrow to move down", 180, 500);
  
  tactile();
}


void instructClicks() {
  if(mouseX > 300 && mouseX < 700 && mouseY > 550 && mouseY < 700) {
    mode = GAME;
  }
  
}
void reset() {
    background(#3DCE1D);
      int x = -25;
  while (x <= 1000) {
    fill(#37A520);
    rect(x, 0, 50, 800);
    x = x + 100;
  }
   vxgr = 0;
 vygr= 0;
 vxr = 0;
 vyr = 0;
 vxr = 0;
 vyl = 0;
 vxgl = 0;
 vygl = 0;
  gleftx = 70;
  glefty = height/2;
  gleftd = 80;
  grightx = 930;
  grighty = height/2;
  grightd= 80;
  leftx = 300;
  lefty = height/2;
  leftd = 80;
  rightx = 700;
  righty = height/2;
  rightd= 80;
  leftscore = 0;
  rightscore = 0;
  ballx = width/2;
  bally=  height/2;
  balld= 50;
    vx = 0;
  vy = 0;
  timer = 90;
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
