class Mover {

  //instance variables

  PVector location; //location
  float vx, vy; //velocity
  float d; //diameter

  //CONSTRUCTOR

  Mover () {
    d = 100;
    x = random(0, width);
    y = random(0, height);
    vx = random(-1, 1);
    vy = random (-1, 1);
  }

  //BEHAVIOUR FUNCTIONS
  void act () {
    move ();
    bounceOffEdge ();
  }

  void move() {
    x = x + vx;
    y = y + vy;
  }

  void bounceOffEdge () {
    if ( x < 0 || x > width) vx = -vx;
    if ( y < 0 || y > height) vy = -vy;
  }


  void showBody () {
    noStroke();
    fill(255, 20);
    circle(x, y, d);
  }

  void showConnections () {
    for (int i = 0; i < numberOfMovers; i ++) {
      float dist = dist(x, y, movers[i].x, movers [i].y);
      if (dist <= 200) { //allows lines to fade away
        float a = map(dist, 0, 200, 255, 0); //transparency value distance 0 to 200, transparency 255 to 0
        stroke(255, a);
        strokeWeight(2);
        line(x, y, movers[i].x, movers[i].y);
        i = i ++;
      }
    }
  }
}
