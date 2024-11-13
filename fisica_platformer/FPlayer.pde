class FPlayer extends FBox {

  FPlayer () {
    super(gridSize, gridSize);
    setPosition(30, -10);
    setName("player");
    setFillColor(red);
    setVelocity(0, 0);
    setRotatable(false);
  }

  void act () {
    handleInput();
    checkForCollisions();
  }
  void handleInput() {
    if (akey) setVelocity(-200, getVelocityY());
    if (dkey) setVelocity(200, getVelocityY());
    if (wkey) setVelocity(getVelocityX(), -200);
    if (skey) setVelocity(getVelocityX(), 200);
  }

  void checkForCollisions() {
    ArrayList <FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i ++) {
      FContact fc = contacts.get(i);
      if (fc.contains ("spike")) {
        setPosition(0, 0);
      }
    }
  }
}
