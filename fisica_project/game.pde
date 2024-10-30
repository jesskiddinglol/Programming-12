void game() {
  
}

void heart () {
  heart1 = new FCircle(20);
  heart2 = new FCircle(20);
  heart3 = new FCircle(20);
  heart1.setRotatable(false);
  heart1.setStatic(true);
  heart1.setSensor(true);
  heart1.attachImage(Heart);
  heart1.setPosition(100, 90);
  heart2.setRotatable(false);
  heart2.setStatic(true);
  heart2.setSensor(true);
  heart2.attachImage(Heart);
  heart2.setPosition(150, 90);
  heart3.setRotatable(false);
  heart3.setStatic(true);
  heart3.setSensor(true);
  heart3.attachImage(Heart);
  heart3.setPosition(200, 90);
  world.add(heart1);
  world.add(heart2);
  world.add(heart3);
  Heart.resize(50, 40);
}
void heartP () {
  heart1P = new FCircle(20);
  heart2P = new FCircle(20);
  heart3P = new FCircle(20);
  heart1P.setRotatable(false);
  heart1P.setStatic(true);
  heart1P.setSensor(true);
  heart1P.attachImage(HeartP);
  heart1P.setPosition(600, 90);
  heart2P.setRotatable(false);
  heart2P.setStatic(true);
  heart2P.setSensor(true);
  heart2P.attachImage(HeartP);
  heart2P.setPosition(650, 90);
  heart3P.setRotatable(false);
  heart3P.setStatic(true);
  heart3P.setSensor(true);
  heart3P.attachImage(HeartP);
  heart3P.setPosition(700, 90);
  world.add(heart1P);
  world.add(heart2P);
  world.add(heart3P);
  HeartP.resize(50, 40);
}

void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 0);
  //world.setEdges();
}

void makeTraffic() {
  traffic = new FBox(200, 70);
  traffic.setPosition(-100, (random(250, 550)));
  traffic.attachImage(Truck);
  Truck.resize(200, 200);
  Truck2.resize(200, 170);
  traffic.setFillColor(red);
  traffic.setDensity(0.2);
  traffic.setFriction(0);
  traffic.setRestitution(0.7);
  traffic.setVelocity(900, 0);
  traffic.setRotatable(false);
  world.add(traffic);
}




void makeRedCar() {
  redcar = new FBox (75, 125);
  redcar.attachImage(Red);
  Red.resize(200, 200);
  Explosion.resize(150, 150);
  redcar.setPosition(RedcarX, RedcarY);
  redcar.setDensity(0.2);
  redcar.setFriction(0);
  redcar.setRestitution(0.7);
  redcar.setFillColor(red);
  redcar.setRotation(4.72);
  redcar.setRotatable(false);
  world.add(redcar);
}
void makePurpleCar() {
  purplecar = new FBox (75, 125);
  purplecar.attachImage(Purple);
  purplecar.setPosition(PurpcarX, PurpcarY);
  purplecar.setFillColor(purple);
  Purple.resize(200, 200);
  purplecar.setDensity(0.8);
  purplecar.setRotation(4.72);
  purplecar.setFriction(0);
  purplecar.setRestitution(0.7);
  purplecar.setRotatable(false);
  world.add(purplecar);
}

boolean hitTruck(FBox car) {
  ArrayList < FContact > contactList = car.getContacts();
  //ArrayList < FContact > fcontactList = purplecar.getContacts();
  int i = 0;
  while ( i < contactList.size() ) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(traffic))
      return true;
    i = i + 1;
  }
  return false;
}

void gameClicks() {

}
