void intro () {
  background(blue);
  cars.show();
  textSize(1);
  textFont(flag);

  //textFont(cool);
  fill(beige);
  text("(RACING CARS)", 400, 100);
  
     int i = 0; 
  if( i < 1) {
   myButtons[0].show();
    if(myButtons[0].clicked) {
      mode = GAME;
    }
    i = i + 1;
  }
}


void introClicks() {

}
