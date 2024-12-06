
class FPlayer extends FGameObject {

  int frame;
  int direction;

  FPlayer () {
    super();
    frame = 0;
    direction = R;
    setName("player");
    setFillColor(red);
    setVelocity(0, 0);
    setRotatable(false);
  }

  void act () {
    input();
    collisions();
    animate();
    if (isTouching("spike") && getY() < 200) {
      setPosition(ogX, ogY);
      lives = lives -1;
      gameReset1();
    }
    if (isTouching("hammer")) {
      setPosition(ogX, ogY);
      lives = lives -1;
    }
    if (isTouching("tp")) {
      setPosition(ogX, ogY);
      lives = lives -1;
    }
    if(lives == 0) {
      mode = GAMEOVER;
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
    
    if (abs(vy) > 0.1) { //absolute value
      action = jump;
    }
  }

  void collisions() {
  }

  void animate () {
    if (frame >= action.length) frame = 0; //checking to see if got to the end or beyond then reset frames
    if (frameCount % 5 == 0) { //every fifth frame attach an image from the array
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
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
