class Button { 

  //instance variables
  int x, y, w, h; //x, y, is the center
  boolean clicked;
  color highlight, normal;
  String text;

  //constructor
  Button (String t, int _x, int _y, int _w, int _h, color norm, color high) { //parameters capturing incoming values
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

Button (int picx, int picy, int picw, int pich) {
  
  x = picx;
  y = picy;
  w = picw;
  h = pich;
   
  
}

  //behaviour functions\

  void show() {
drawButton();
drawLabel();
   
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
  
  
  boolean touchingMouse() {
    return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }
  
  void drawButton() {
        if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30); //30 is rounded corner
  }
  
  void drawLabel() {
    
     //text label
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(w/4);
    text(text, x, y);

    
  }
  }
