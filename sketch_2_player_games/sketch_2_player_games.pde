//mode framework
 int mode;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int GAMEOVER = 3;


//images and fonts
PImage soccer;
PFont cool;
PFont supeer;
PFont score;
PFont gameover;

int x;
int y;
int leftscore, rightscore, timer;
//key variables
boolean wkey, skey, akey, dkey, upkey, downkey, leftkey, rightkey, arms;
//player
float leftx, lefty, leftd, rightx, righty, rightd;
//goalie
float gleftx, glefty, gleftd, grightx, grighty, grightd;
//ball variables
float ballx, bally, balld;
float vx, vy, vxgr, vygr, vxl, vyl, vxgl, vygl, vxr, vyr;
//color variables
color blue = #1982c4;

void setup() {
  size(1000,800);
 mode = GAME;
 arms = true;
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
  
  ballx = width/2;
  bally=  height/2;
  balld= 50;
    vx = 0;
  vy = 0;
    //initialize keyboard variables
  wkey = skey = akey = dkey= upkey = downkey = leftkey = rightkey = false;
  
  rightscore = leftscore = 0;
  timer = 90;
}




void draw() {
   if (mode==INSTRUCTIONS) {
    instructions();
  } else if (mode ==GAME) {
    game();
  }else if(mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
}
  
  
  
