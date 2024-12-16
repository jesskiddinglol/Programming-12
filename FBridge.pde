class FBridge extends FGameObject {

  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
    setFriction(4);
  }


  void act() {
    if(isTouching("player")) {
      setStatic(false);
      setSensor(true);
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
