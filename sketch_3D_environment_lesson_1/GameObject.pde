class FGameObject {

  float lives; //everything has size, location, and lives
  float size;
  PVector loc;

  FGameObject() { //default
   loc = new PVector(0, 0, 20);
   size = 2;
   lives = 1;   
  }
  
  FGameObject(float x, float y, float z) { //parameter constructor
    lives = 1;
    loc = new PVector(x, y, z);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(white);
    stroke(100);
    box(size);
    popMatrix();
  }


  void act () {

  }
  
 
}
