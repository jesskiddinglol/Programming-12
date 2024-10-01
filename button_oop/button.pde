class Button {

  //instance variables
  int x, y, w, h; //x, y, is the ceneter
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
  
  
  //behaviour functions\
  void show() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {

      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30); //30 is rounded corner
    
    //text label
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);   
  } else {
    fill(highlight);
  }
  textSize(w/4);
  text(text, x, y);
  
  //if( mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
  //  clicked = true;
  //}else{
  //  clicked = false;
  //}
  }
}
