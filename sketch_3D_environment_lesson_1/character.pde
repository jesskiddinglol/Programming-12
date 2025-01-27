
boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  
  fwdx = eyeX + cos(leftRightHeadAngle)*200;
  fwdz = eyeZ + sin(leftRightHeadAngle)*200;
  fwdy = eyeY;
  
  mapx = int(fwdx+2000)/gridSize; //converting float to int
  mapy = int(fwdz+2000)/gridSize;
  
  if(map.get(mapx, mapy)== white) {
    return true; //can move
  } else {
    return false; //only in empty space
  }
  
}
boolean canMoveBackward() {
  float bwdx, bwdy, bwdz;
  int mapx, mapy;
  
  bwdx = eyeX - cos(leftRightHeadAngle)*200;
  bwdz = eyeZ - sin(leftRightHeadAngle)*200;
  bwdy = eyeY;
  
  mapx = int(bwdx+2000)/gridSize; //converting float to int
  mapy = int(bwdz+2000)/gridSize;
  
  if(map.get(mapx, mapy)== white) {
    return true; //can move
  } else {
    return false; //only in empty space
  }
  
}
boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;
  
  leftx = eyeX + cos(leftRightHeadAngle-radians(90))*200;
  leftz = eyeZ + sin(leftRightHeadAngle-radians(90))*200;
  lefty = eyeY;
  
  mapx = int(leftx+2000)/gridSize; //converting float to int
  mapy = int(leftz+2000)/gridSize;
  
  if(map.get(mapx, mapy)== white) {
    return true; //can move
  } else {
    return false; //only in empty space
  }
  
}
boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy;
  
  rightx = eyeX + cos(leftRightHeadAngle+radians(90))*200;
  rightz = eyeZ + sin(leftRightHeadAngle+radians(90))*200;
  righty = eyeY;
  
  mapx = int(rightx+2000)/gridSize; //converting float to int
  mapy = int(rightz+2000)/gridSize;
  
  if(map.get(mapx, mapy)== white) {
    return true; //can move
  } else {
    return false; //only in empty space
  }
  
}
