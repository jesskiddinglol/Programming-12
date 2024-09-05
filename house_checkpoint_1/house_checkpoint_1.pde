


//palette
color yellowB = #ffea00;
color yellow = #ffb703;
color red = #c1121f;
color blue = #00b4d8;
color brown = #bc6c25;
color green = #a7c957;

//animation variables
float sunY;
boolean day;

void setup() {
  size(800, 800);
  background(blue);
  sunY = 150;
}

void draw() {
  background(blue);
  //sun
  noStroke();
  fill(yellowB);
  circle(150, sunY, 120);
  sunY= sunY+1.5;

  if (sunY>height&&day == true) {
    sunY =  -200;
    day = false;
  }

  if (day==true) {    
    fill(yellowB);
    circle(150, sunY, 120);
    sunY= sunY+1.5;
  } else {
    background(0);

}



//ground
stroke(3);
fill(green);
rect(0, 650, 800, 150);

//walls
fill(yellow);
rect(200, 400, 400, 300);

//roof
fill(red);
triangle(150, 400, 400, 200, 650, 400);

//door
fill(brown);
rect(350, 550, 100, 150);

//handle
fill(0);
circle(440, 650, 10);

//window
fill(255);
rect(240, 450, 80, 80);
rect(480, 450, 80, 80);
fill(0);
strokeWeight(3);
line(280, 450, 280, 530);
line(240, 490, 320, 490);
line(520, 450, 520, 530);
line(480, 490, 560, 490);


}
