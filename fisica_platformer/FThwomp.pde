class FThwomp extends FGameObject {

  int frame = 0;
  FThwomp (float x, float y) {
    super();
    setPosition(x, y);
    setStatic(true);
    setName("tp");
  }

  void act() {
    animate();
  }
  void animate() {
  }
}
