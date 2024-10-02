
Button blackbutton, bluebutton, pinkbutton, yellowbutton; //button is class mybutton is name of the actual thing 

color purple = #cdb4db;
color pink = #ff006e;
color yellow = #ffbe0b;
color navy = #003566;
boolean mouseReleased;
boolean wasPressed;
color bkg; //background

Button [] myButtons;
void setup() {
  size(800, 800);
  bkg = 255;
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  myButtons = new Button [4];
   myButtons [0]= new Button("BLACK", 580, 270, 300, 450, 0, 255);
   myButtons [1]= new Button("BLUE", 200, 150, 300, 200, navy, yellow);
   myButtons [2]= new Button("PINK", 200, 400, 300, 200, pink, purple);
   myButtons [3]= new Button("YELLOW", 400, 650, 700, 200, yellow, navy);
}



void draw() {
    click();
  background(bkg);
int i = 0;
while( i < 4) {
  myButtons[i].show ();
  if(myButtons[i].clicked) {
    bkg = myButtons[i].normal;
  }
i++;
}

  
}
