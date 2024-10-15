void keyPressed() {
  if(key == 'w' || key == 'W') wkey = true;
  if(key=='a' || key == 'A') akey = true;
  if(key =='s' || key == 'S') skey = true;
    if(key =='d' || key == 'D') dkey = true;
    if(key == UP) upkey = true;
  if(key == DOWN) downkey = true;
  if(key == LEFT) leftkey = true;
  if(key == RIGHT) rightkey = true;
}


void keyReleased() {
  if(key == 'w' || key == 'W') wkey = false;
  if(key=='a' || key == 'A') akey = false;
  if(key =='s' || key == 'S') skey = false;
    if(key =='d' || key == 'D') dkey = false;
    if(key == UP) upkey = false;
  if(key == DOWN) downkey = false;
  if(key == LEFT) leftkey = false;
  if(key == RIGHT) rightkey = false;
}
