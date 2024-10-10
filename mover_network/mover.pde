class Mover {

  //instance variables

  PVector loc; //location a pvector is an object that stores its x and y
  PVector vel; //velocity
  float d; //diameter
  boolean alive;

  //CONSTRUCTORS

  Mover () {
    d = 100;
    loc = new PVector (random(0, width), random(0, height)); //that sets x and y
    vel = new PVector (3, 0);//(random(-5, 5), random(-5, 5));
    vel.setMag(random(1, 5)); //random magnitude some are so and some are fast
    vel.rotate(radians(45)); //rotating in a random direction but same speed
    alive = true;
  }
  
  
  Mover(float x, float y) {
    d = 100;
    loc = new PVector (x, y); //that sets x and y
    vel = new PVector (1, 0);//(random(-5, 5), random(-5, 5));
    vel.setMag(random(1, 5)); //random magnitude some are so and some are fast
    vel.rotate(radians(45)); //rotating in a random direction but same speed
    alive = true;
  }


  //BEHAVIOUR FUNCTIONS
  void act () {
    move ();
    bounceOffEdge ();
    checkForDeletion();
  }
  
  void checkForDeletion() {
    if(dist(loc.x, loc.y, mouseX, mouseY) < d/2 && mousePressed) {
    alive = false;
      
    
    }
    
  }
  
  

  void move() {
    loc.add(vel); //add function of pvectors adds the x component for velocity on the x component of locations basically x = x + vx;
  }

  void bounceOffEdge () {
    if ( loc.x < 0 || loc.x > width) vel.x = -vel.x; //accessing x componenet of pvector location and velocity
    if ( loc.y < 0 || loc.y > height) vel.y = -vel.y;
  }


  void showBody () {
    noStroke();
    //fill(255, 20);
    if(alive == true) fill(255);
    else fill (0);
    circle(loc.x, loc.y, d);
  }

  void showConnections () {
    for (int i = 0; i < movers.size(); i ++) {
      Mover other = movers.get(i);
      float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      if (dist <= 200) { //allows lines to fade away
        float a = map(dist, 0, 200, 255, 0); //transparency value distance 0 to 200, transparency 255 to 0
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
        i = i ++;
      }
    }
  }
}
