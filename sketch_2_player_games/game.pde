void game() {

  noStroke();
  background(#3DCE1D);
  int x = -25;
  while (x <= 1000) {
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
  
  //arms
  if(arms == true) {
  fill(0);
ellipse(leftx+20, lefty-40, 60, 20);
ellipse(leftx-20, lefty+40, 60, 20);
  } else {
    ellipse(leftx-20, lefty-40, 60, 20);
ellipse(leftx+20, lefty+40, 60, 20);
  }
  
  
    
  //players and goalies
  fill(255, 0, 0);
  circle(gleftx, glefty, gleftd);
  circle(leftx, lefty, leftd);
  fill(0, 0, 255);
  circle(rightx, righty, rightd);
  circle(grightx, grighty, grightd);
  //keyboard movement
  if (dkey == true) gleftx = gleftx+5;
  if (akey == true) gleftx = gleftx - 5;
  if (wkey == true) glefty = glefty -5;
  if (skey == true) glefty = glefty + 5;
  if (dkey == true) leftx = leftx+5;
  if (akey == true) leftx = leftx - 5;
  if (wkey == true) lefty = lefty -5;
  if (skey == true) lefty = lefty + 5;
 

  if (upkey == true) grighty = grighty - 5;
  if ( downkey == true)grighty = grighty + 5;
  if (leftkey == true)grightx = grightx - 5;
  if ( rightkey == true)grightx = grightx + 5;
  if (upkey == true) righty = righty - 5;
  if ( downkey == true)righty = righty + 5;
  if (leftkey == true)rightx = rightx - 5;
  if ( rightkey == true)rightx = rightx + 5;

  //player restrictions

  if (lefty > 750) {
    lefty = 750;
  }

  if (lefty < 50) {
    lefty = 50;
  }


  if (leftx > 950) {
    leftx = 950;
  }

  if (leftx < 50) {
    leftx = 50;
  }

  if (righty > 750) {
    righty = 750;
  }

  if (righty < 50) {
    righty = 50;
  }


  if (rightx > 950) {
    rightx = 950;
  }

  if (rightx < 50) {
    rightx = 50;
  }

  if (gleftx > 150) {
    gleftx = 150;
  }
  if (gleftx < 0) {
    gleftx = 0;
  }

  if (glefty < 250) {
    glefty = 250;
  }
  if (glefty > 550) {
    glefty = 550;
  }


  if (grightx > 1000) {
    grightx = 1000;
  }
  if (grightx < 850) {
    grightx = 850;
  }

  if (grighty < 250) {
    grighty = 250;
  }
  if (grighty > 550) {
    grighty = 550;
  }


  //ball
  fill(0);
  circle(ballx, bally, balld);

  ballx = ballx + vx;
  bally = bally + vy;
  vx = vx *0.97;
  vy = vy* 0.97;

  //playercollisions

  vxgr= vxgr* 0.05;
  vygr = vygr *0.05;
  vxr = vxr *0.05;
  vyr = vyr*0.05;
  grightx = grightx + vxgr;
  grighty = grighty + vygr;
 rightx = rightx + vxr;
  righty = righty + vyr;
  vxl = vxl * 0.05;
  vyl = vyl * 0.05;
  vxgl = vxgl * 0.05;
  vygl = vygl * 0.05;
    leftx = leftx + vxl;
  lefty = lefty + vyl;
    gleftx = gleftx + vxgl;
  glefty = glefty + vygl;



//right player to goalie
  if (dist( rightx, righty, grightx, grighty) <= grightd) {
    vxgr = (grightx - rightx)*2;
    vygr = (grighty - righty)*2;
    vxr = vxgr * -1;
    vyr = vygr*-1;
  }
  //right player to left player
  if(dist(rightx, righty, leftx, lefty) <= grightd) {
    vxl = (leftx - rightx);
    vyl = (lefty - righty);
    vxr = vxl * -1;
    vyr = vyl * -1;
  }
  //left player to left goalie
  if(dist(leftx, lefty, gleftx, glefty) <= grightd) {
    vxgl = (gleftx - leftx);
    vygl = (glefty - lefty);
    vxl = vxgl *-1;
    vyl = vygl * -1;
  }
  
  //left player to right goalie
  if(dist(leftx, lefty, grightx, grighty)<= grightd) {
vxgr = (grightx - leftx);
vygr = (grighty - lefty);
vxl = vxgr * -1;
vyl = vygr * -1;
  }
  
  //right player to left goalie
    if(dist(rightx, righty, gleftx, glefty)<= grightd) {
vxgl = (gleftx - rightx);
vygl = (glefty - righty);
vxr = vxgl * -1;
vyr = vygl * -1;
  }

  //players to ball
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    vx = 2;
    vy = 2;
    vx = (ballx - leftx)/5;
    vy = (bally - lefty)/5;
  }

  //player to ball
  if (dist(rightx, righty, ballx, bally) <= rightd/2 + balld/2) {
    vx = 2;
    vy = 2;
    vx = (ballx - rightx)/5;
    vy = (bally - righty)/5;
  }

  //goalie to ball
  if (dist(gleftx, glefty, ballx, bally) <= gleftd/2 + balld/2) {
    vx = 2;
    vy = 2;
    vx = (ballx - gleftx)/5;
    vy = (bally - glefty)/5;
  }

  //player to ball
  if (dist(grightx, grighty, ballx, bally) <= grightd/2 + balld/2) {
    vx = 2;
    vy = 2;
    vx = (ballx - grightx)/5;
    vy = (bally - grighty)/5;
  }


  //bounces off walls
  if (bally <= balld/2|| bally >= height- balld/2) {
    vy = vy * -1;
  }
  if (ballx <= balld/2 && bally >550) {
    vx = vx * - 1;
  }
  if (ballx <= balld/2 && bally < 250) {
    vx = vx * - 1;
  }
  if (ballx > width-balld/2 && bally >550) {
    vx = vx * - 1;
  }

  if (ballx > width-balld/2 && bally < 250) {
    vx = vx * - 1;
  }

  if (ballx <= -50 && bally > 250 && bally < 550 && timer < 0) {
    rightscore = rightscore + 1;
    ballx = 500;
    bally = 400;
    vx = 0;
    vy = 0;
    leftx = 300;
    lefty = height/2;
    rightx = 700;
    righty = height/2;
    gleftx = 70;
    glefty = height/2;
    grightx = 930;
    grighty = height/2;
  }


  if (ballx > width + balld && bally > 250 && bally < 550 && timer < 0) {
    leftscore = leftscore + 1;
    ballx = 500;
    bally = 400;
    vx = 0;
    vy = 0;
    leftx = 300;
    lefty = height/2;
    rightx = 700;
    righty = height/2;
    gleftx = 70;
    glefty = height/2;
    grightx = 930;
    grighty = height/2;
  }

  //scoreboard

  score = createFont("score.ttf", 200);
  fill(0);
  rect(485, 20, 30, 10);
  textFont(score);
  textSize(80);
  fill(blue);
  text(rightscore, 520, 50);
  fill(255, 0, 0);
  text(leftscore, 440, 50);
  textFont(supeer);
  fill(255, 255, 255, 100);
  timer = timer - 1;
  
  if(leftscore == 1) {
  mode = GAMEOVER;

}

if(rightscore ==1) {
  mode = GAMEOVER;
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
  if (mouseX > 425 && mouseX < 575 && mouseY > 725 && mouseY < 800) {
    mode = INSTRUCTIONS;
  }
}
