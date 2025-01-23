void drawMap() {
  for (int x = 0; x < map.width; x ++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == teal) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);
      }
      if (c == red) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oakPlanks, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, oakPlanks, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, oakPlanks, gridSize);
      }
    }
  }
}



void drawFloor(int start, int end, int level, int gap) {
  stroke(red);
  strokeWeight(1);
  int x = start; //start here
  int z = start;
  while (z < end) {
    texturedCube(x, level, z, oakPlanks, gap); //gap = gridSize
    x = x + gap;
    if (x >= end) {
      x = start; // go back to start
      z = z + gap; // go down one level of z
    }
  }
}
