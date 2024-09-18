//mode framework
 int mode;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int GAMEOVER = 3;

//images and fonts
PImage soccer;
PFont cool;
PFont supeer;

int x;
int y;

//key variables
boolean wkey, skey, akey, dkey, upkey, downkey, leftkey, rightkey;
//player
float leftx, lefty, leftd, rightx, righty, rightd;
//goalie
float gleftx, glefty, gleftd, grightx, grighty, grightd;

//color variables
color blue = #03045e;

void setup() {
  size(1000,800);
 mode = GAME;
  gleftx = 70;
  glefty = height/2;
  gleftd = 100;
  grightx = 930;
  grighty = height/2;
  grightd= 100;
  
  leftx = 300;
  lefty = height/2;
  leftd = 100;
  rightx = 700;
  righty = height/2;
  rightd= 100;
    //initialize keyboard variables
  wkey = skey = akey = dkey= upkey = downkey = leftkey = rightkey = false;
  
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
  
  
  
