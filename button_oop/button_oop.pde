
Button blackbutton, bluebutton, pinkbutton, yellowbutton; //button is class mybutton is name of the actual thing 

color purple = #cdb4db;
color pink = #ff006e;
color yellow = #ffbe0b;
color navy = #003566;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  blackbutton = new Button("BLACK", 550, 350, 300, 300, 0, 255);
  bluebutton = new Button("BLUE", 200, 150, 300, 200, navy, yellow);
  pinkbutton = new Button("PINK", 200, 400, 200, 200, pink, purple);
  yellowbutton = new Button("YELLOW", 400, 650, 600, 200, yellow, navy);
}



void draw() {
  blackbutton.show();
  bluebutton.show();
  pinkbutton.show();
  yellowbutton.show();
  
}
