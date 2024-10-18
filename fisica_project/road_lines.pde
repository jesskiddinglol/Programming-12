class Road {
  
  float x;
  float y;
  float s, w;
  float vx;
  boolean onScreen;
  
  Road(float _x, float _y, float _s, float _w) {
    x = _x;
    y = _y;
     s = _s;
     w = _w;
    vx = 10; 
    y = 390;
    s = 100;
     w = 10;
     x = -100;
     onScreen = true;
  }
  
  void show() {
    fill(255);
    rect(x, y, s, w);

  }
  
  
  void act() {
     x = x + vx;
     if(x > width) {
       onScreen = !onScreen;
     }
  }
  
}
