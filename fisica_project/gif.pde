class Gif {
   //instance variables
  PImage [] frames;
  int x, y, w, h;
  int speed, numframes, cf;
  String before, after;
  
  //constructor
  Gif(String _b, String _a, int _f, int _s, int _x, int _y, int _w, int _h) {
    frames = new PImage[_f];
    before = _b;
    after = _a;
    numframes = _f;
    speed = _s;
    cf = 0;
    x = _x;
    y = _y;
    w = _w;
    h = _h;   
    
    int i = 0;
    while(i < numframes) {
     frames [i] = loadImage( before + i + after );
     i = i +1;
    }

}

void show() {
  
  

  if(cf == numframes) cf = 0; 
  image(frames [cf], x, y, w, h);
  if(frameCount % speed == 0) {cf ++;
 
}
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
