void click () {

  mouseReleased = false; // next frame is back to false
  //check if mouse is being pressed
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) { //was it pressed and is it now not being pressed. mouse was pressed and its not pressed now
    mouseReleased = true; //when u press down mouse released is false and when ur not released mouse press is true
    wasPressed = false;
  }
}
