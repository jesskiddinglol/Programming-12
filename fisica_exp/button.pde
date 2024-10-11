class Button {

  int x, y, w, h;
  boolean clicked;
  color norm, high;

  Button(int _x, int _y, int _w, int _h, boolean _g, color _norm, color _high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    clicked = false;
    g = _g;
    norm = _norm;
    high = _high;
  }
   Button( boolean _e,int _x, int _y, int _w, int _h, color _norm, color _high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    clicked = false;
    e = _e;
    norm = _norm;
    high = _high;
  }

  void show() {
    drawButton();
    drawLabel();
    
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
    
    if( g == false) {
      world.setGravity(0, 0);
    }else world.setGravity(0, 900);
    
  }
  
 
  


  boolean touchingMouse() {
    return mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }

  void drawButton() {
    if (touchingMouse()) {
      fill(high);
    } else {
      fill(norm);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30); //30 is rounded corner
  }
  void drawLabel() {

    //text label
    if (touchingMouse()) {
      fill(255);
       textSize(50);
       text("OFF", x+15, y + 65);
    } else {
      fill(high);
      text("ON", x + 15, y + 65);
      textSize(50);
    }
  }
}
