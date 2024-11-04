class Button {
  
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;

  
  Button (String t, int _x, int _y, int _w, int _h, color norm, color high) {
     x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;

    
  }
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
    return mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }

  void drawButton() {
    if (touchingMouse()) {
      fill(highlight);
      stroke(normal);
    } else {
      fill(normal);
      stroke(highlight);
    }
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
    textSize(w/5);
    text(text, x+150, y+50);
  
  
  
  }
  
  
}
