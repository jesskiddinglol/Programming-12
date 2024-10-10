ArrayList <Mover> movers; //inside the signs put the name of the type of object the array list will store

color purple = #cdb4db;
int numberOfMovers = 50;
void setup () {
  size (800, 800);
  movers = new ArrayList();//instantiate arraylist

  for ( int i = 0; i  < numberOfMovers; i ++) {
    movers.add(new Mover()); //calling the mover constructor
  }
}

void draw () {
  background(purple);

  for (int i = 0; i < movers.size(); i ++) { //evaluates to 0 because theres no movers and no code creating them
    //when u start adding numbers movers.size will change every frame
    //to accommodate for the fact we put more movers
    Mover m = movers.get(i); //getting the mover at index i out and giving it temporary name m
    m.act(); //getting a mover out of the array list at index i
    m.showBody();
    m.showConnections();
    if(m.alive == false) {
      movers.remove(i);
    } else {
      i = i + 1;
    }
  }
}

void mouseReleased () {
  //movers.add(new Mover(mouseX, mouseY)); //mouseX and mouseY lets class know to call the constructor with x, y parameters else sned it to the first constructor
}
