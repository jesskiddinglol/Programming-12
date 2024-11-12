void intro () {
  background(blue);
  cars.show();

  if (mouseX > 250 && mouseX < 550 && mouseY > 600 && mouseY < 700) {
    textFont(flag);
    fill(beige);
    text("(                 )", 400, 100);
    fill(mag);
    textFont(cool);
    text("RACING CARS", 400, 100);
    textSize(100);
    fill(nat);
    text("ARE YOU READY?", 400, 200);
  } else {
    textSize(2);
    textFont(flag);
    fill(mag);
    text("(                 )", 400, 100);

    fill(beige);
    textFont(cool);

    text("RACING CARS", 400, 100);
    fill(nat);
    textSize(60);
    text("AVOID THE TRAFFIC", 400, 200);
    fill(nat);
    text("Left Player", 200, 300);
    text("Right Player", 600, 300);
    textSize(20);
    fill(light);
     text("wkey to move up", 200, 330);
     text("skey to move down", 200, 370);
     text("akey to move forward", 200, 410);
     text("dkey to move back", 200, 450);
         text("upkey to move up", 600, 330);
     text("downkey to move down", 600, 370);
     text("leftkey to move forward", 600, 410);
     text("rightkey to move back", 600, 450);
  }

  int i = 0;
  if ( i < 1) {
    myButtons[0].show();
    if (myButtons[0].clicked) {
      mode = GAME;
    }
    i = i + 1;
  }
}


void introClicks() {
}
