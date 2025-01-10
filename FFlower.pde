class FFlower extends FGameObject {

 FFlower(float x, float y) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setName("flower");
    setStatic(true);
  }

  void act() {
   collide();
  }

  void collide() {
    
    
  }
}
