Mover [] movers;
int numberOfMovers = 50;
color purple = #cdb4db;
void setup () {
  size (800, 800);
  movers = new Mover[numberOfMovers]; //instantiate array

  for ( int i = 0; i  < numberOfMovers; i ++) {
    movers [i] = new Mover (); //calling the mover constructor
  }
}


void draw () {
  background(purple);

  for (int i = 0; i < numberOfMovers; i ++) {
    movers[i].act();
    movers[i].showBody();
    movers[i].showConnections();
  }
}
