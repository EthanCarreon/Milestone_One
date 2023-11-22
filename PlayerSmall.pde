class PlayerSmall {

  int x, y, w, h;
  int vx, vy;
  
  int currentFrame, totalFrames, row, sx, sy;
  int hold, delay;
  
  int health;

  PlayerSmall() {
    x = width/2;
    y = 0;
    w = 20;
    h = 36;
    
    totalFrames = 3;
    row = 0;
    
    delay = 8;
  }
  
 
  void update() {
    if (left && !right) {
      vx = -2;
      row = 3;
    }
    if (right && !left) {
      vx = 2;
      row = 2;
    }
    if (!left && !right) {
      vx = 0;
    }
    if (up && !down) {
      vy = -2;
      row = 1;
    }
    if (down && !up) {
      vy = 2;
      row = 0;
    }
    if (!up && !down) {
      vy = 0;
    }
    
    if(!left&&!up&&!right&&!down){
     currentFrame = 0;
     vx = 0;
     vy = 0;
    }
    
    x += vx;
    y += vy;
    
    sx = currentFrame * w;
    sy = row * h;
    
    hold = (hold+1)%delay;
    
    if(hold == 0){
      currentFrame = (currentFrame+1)%totalFrames;
    }
   
    
    if (atBegin) {
      gameStat = "START";
    }
    
    if (reachedBottom) {
      checkWallCollisionsMap2(ps);
      if (y < -25) {
        reachedBottom = false;
        atBegin = true;
      } 
    }    

  }
  void display() {
    copy( playerArtSmall, 
          sx, sy, w, h, 
          x, y, w, h);
    
  }
}
