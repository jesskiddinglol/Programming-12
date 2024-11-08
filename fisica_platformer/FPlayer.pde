class FPlayer extends FBox {

  FPlayer () {
    super(gridSize, gridSize);
    setPosition(30, -10);
    setFillColor(red);
    setVelocity(0, 0);
    setRotatable(false);
  }

  void act () {
    if (akey) setVelocity(-200, getVelocityY());
    if (dkey) setVelocity(200, getVelocityY());
    if (wkey) setVelocity(getVelocityX(), -200);
    if (skey) setVelocity(getVelocityX(), 200);
  }
}
