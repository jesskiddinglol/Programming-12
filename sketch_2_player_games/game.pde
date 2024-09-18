void game() {
  
  noStroke();
  background(#3DCE1D);
  
 
  
  int x = -25;
  while(x <= 1000){
    fill(#37A520);
    rect(x, 0, 50, 800);
    x = x + 100;
  }
  
  fill(255);
  rect(490, 0, 20, 800);
   ellipse(500, 0, 150, 150);
  ellipse(500, 800, 150, 150);
  supeer = createFont("super.ttf", 100);
  textFont(supeer);
  fill(0);
  textSize(30);
  text("EXIT", 450, 790);
  
  goals();
 
  //players and goalies
  fill(255, 0, 0);
  circle(gleftx, glefty, gleftd);
  circle(leftx, lefty, leftd);
  fill(0, 0, 255);
  circle(rightx, righty, rightd);
   circle(grightx, grighty, grightd);
  //keyboard movement
  if(dkey == true) gleftx = gleftx+5;
  if(akey == true) gleftx = gleftx - 5;
  if(wkey == true) glefty = glefty -5;
  if(skey == true) glefty = glefty + 5;
  if(dkey == true) leftx = leftx+5;
  if(akey == true) leftx = leftx - 5;
  if(wkey == true) lefty = lefty -5;
  if(skey == true) lefty = lefty + 5;
  
  if (upkey == true) grighty = grighty - 5;
  if ( downkey == true)grighty = grighty + 5;
  if (leftkey == true)grightx = grightx - 5;
  if ( rightkey == true)grightx = grightx + 5;
  if (upkey == true) righty = righty - 5;
  if ( downkey == true)righty = righty + 5;
  if (leftkey == true)rightx = rightx - 5;
  if ( rightkey == true)rightx = rightx + 5;
    
    if(lefty > 750) {
      lefty = 750;
    }
    
     if(lefty < 50) {
      lefty = 50;
    }
    
    
    if(leftx > 950) {
      leftx = 950;
    }
    
     if(leftx < 50) {
      leftx = 50;
    }
    
    if(righty > 750) {
      righty = 750;
    }
    
     if(righty < 50) {
      righty = 50;
    }
    
    
    if(rightx > 950) {
      rightx = 950;
    }
    
     if(rightx < 50) {
      rightx = 50;
    }
  
if(gleftx > 150) {
  gleftx = 150;
}
if (gleftx < 0) {
  gleftx = 0;
}

if(glefty < 250) {
  glefty = 250;
}
if(glefty > 550) {
  glefty = 550;
}


if(grightx > 1000) {
  grightx = 1000;
}
if (grightx < 850) {
  grightx = 850;
}

if(grighty < 250) {
  grighty = 250;
}
if(grighty > 550) {
  grighty = 550;
}
  
  
  
 
  }
  
  void goals() {
    //goals
  fill(255);
  rect(0, 250, 150, 300);
  fill(#37A520);
  rect(0, 260, 140, 280);
   fill(255);
  fill(255);
  rect(850, 250, 150, 300);
  fill(#37A520);
  rect(860, 260, 140, 280);
  }



void gameClicks() {
  if(mouseX > 425 && mouseX < 575 && mouseY > 725 && mouseY < 800){
    mode = INSTRUCTIONS;
  }
  
  
}
