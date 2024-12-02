class FPlayer extends FGameObject {

  int frame;
  int direction;
  int lives;

  FPlayer () {
    super();
    frame = 0;
    direction = R;
    setPosition(100, 200);
    setName("player");
    setFillColor(red);
    setVelocity(0, 0);
    setRotatable(false);
    
  }

  void act () {
    input();
    collisions();
    animate();
    if (isTouching("spike")) {
      setPosition(100, 200);
      gameReset();
    }
    if(isTouching("hammer") && hammer.getY() < 450) {
      setPosition(100, 200);
      gameReset();
    }
    if(isTouching("tp")) {
      setPosition(100, 200);
      gameReset();
    }
   
  }
  void input() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (vy == 0) {
      action = idle;
    }
    if (akey) {
      setVelocity(-200, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(200, vy);
      action = run;
      direction = R;
    }
    if (wkey&& getVelocityY() == 0) {
      setVelocity(vx, -400);
     
    }
    if (skey) {
      setVelocity(vx, 200);
    }
    if(getY() > 800) {
      setPosition(100, 200);
      
    }
    if(abs(vy) > 0.1) { //absolute value
      action = jump;
    }
  }

  void collisions() {
  }

  void animate () {
    if (frame >= action.length) frame = 0; //checking to see if got to the end or beyond then reset frames
    if (frameCount % 5 == 0) { //every fifth frame attach an image from the array
     if(direction == R) attachImage(action[frame]);
      if(direction == L) attachImage(reverseImage(action[frame]));
      frame ++; //attach next frame
    }
  }
}
//void checkForCollisions() {
//  ArrayList <FContact> contacts = getContacts();
//  for (int i = 0; i < contacts.size(); i ++) {
//    FContact fc = contacts.get(i);
//    if (fc.contains ("spike")) {
//      setPosition(0, 0);
//    }
//  }
//}
