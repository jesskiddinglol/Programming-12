class Mover {

  //instance variables

  PVector loc; //location a pvector is an object that stores its x and y
  PVector vel; //velocity
  float d; //diameter

  //CONSTRUCTOR

  Mover () {
    d = 100;
    loc = new PVector (random(0, width), random(0, height)); //that sets x and y
    vel = new PVector (3, 0);//(random(-5, 5), random(-5, 5));
    vel.setMag(random(1, 5)); //random magnitude some are so and some are fast
    vel.rotate(radians(random(0, 360))); //rotating in a random direction but same speed
  }

  //BEHAVIOUR FUNCTIONS
  void act () {
    move ();
    bounceOffEdge ();
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
    fill(255, 20);
    circle(loc.x, loc.y, d);
  }

  void showConnections () {
    for (int i = 0; i < numberOfMovers; i ++) {
      float dist = dist(loc.x, loc.y, movers[i].loc.x, movers [i].loc.y);
      if (dist <= 200) { //allows lines to fade away
        float a = map(dist, 0, 200, 255, 0); //transparency value distance 0 to 200, transparency 255 to 0
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, movers[i].loc.x, movers[i].loc.y);
        i = i ++;
      }
    }
  }
}
