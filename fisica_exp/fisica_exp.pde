import fisica.*;

//palette
PVector loc1;
PVector vel1;
PVector loc;
PVector vel;
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
float d;

//assets
PImage redBird;

FPoly topPlatform; 
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  loc1 = new PVector (100, random(100, 300)); 
  vel1 = new PVector (2, 0);
  loc = new PVector (100, random(500, 700)); 
  vel = new PVector (-2, 0);
  vel1.setMag(3);
  vel.setMag(5);
  d = random (100, 150);
  size(800, 800);
  
    
  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
  

}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================


void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(600, 400);
  bottomPlatform.vertex(650, 400);
  bottomPlatform.vertex(650, 600);
bottomPlatform.vertex(750, 600);
bottomPlatform.vertex(750, 400);
bottomPlatform.vertex(800, 400);
bottomPlatform.vertex(800, 650);
bottomPlatform.vertex(600, 650);
  

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
   

  if (frameCount % 20 == 0) {  //Every 20 frames ...
  
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
   
  }
  world.step();  //get box2D to calculate all the forces and new positions
  cloud();
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
 cloud1();
}


//===========================================================================================
void cloud1() {
  noStroke();
fill(255);
loc1.add(vel1);
circle(loc1.x, loc1.y, d);
circle(loc1.x-50, loc1.y, d);
circle(loc1.x+50, loc1.y, d);
circle(loc1.x, loc1.y-50, d);
if ( loc1.x < 0-d) loc1.x = 800;
 if( loc1.x > width+d) loc1.x = 0-d; 
  
}

void cloud() {
  noStroke();
fill(255);
loc.add(vel);
circle(loc.x, loc.y, d);
circle(loc.x-50, loc.y, d);
circle(loc.x+50, loc.y, d);
circle(loc.x, loc.y-50, d);
if ( loc.x < 0-d+5) loc.x = 800; 
 if( loc.x > width+d) loc.x = 0-d; 
  
}



void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(25, 100);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(0.25);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
