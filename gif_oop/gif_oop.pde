Gif space, duck1, duck2;

void setup () {
  size (800, 600);
  space = new Gif("space/frame_", "_delay-0.09s.gif", 16, 10, 0, 0, width, height);
  duck1 = new Gif("duck/frame_", "_delay-0.04s.gif", 15, 5, 500, 100, 200, 200);
  duck2 = new Gif("duck/frame_", "_delay-0.04s.gif", 15, 2, 200, 400, 200, 200);
  //Gif(string before, string after, number of frames, speed,  int x, int y, width, height)
}





void draw () {
  space.show();
  duck1.show();
  duck2.show();
}
