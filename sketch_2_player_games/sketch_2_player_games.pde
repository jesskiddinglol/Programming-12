//mode framework
 int mode;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int GAMEOVER = 3;

//images and fonts
PImage soccer;
PFont cool;

//color variables
color blue = #03045e;

void setup() {
  size(800,800);
 mode = INSTRUCTIONS;
  
  
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
  
  
  
