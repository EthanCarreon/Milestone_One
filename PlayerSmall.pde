class PlayerSmall {
  //props
  int x, y, w, h;
  int vx, vy;
  
  int currentFrame, offsetX, offsetY, totalFrames, row, sx, sy;
  int hold, delay;
  
  int health;

  //constructor
  PlayerSmall() {
    x = width/2;
    y = 0;
    w = 20;
    h = 36;
    
    //currentFrame = 0;
    totalFrames = 3;
    row = 0;
    
    //hold = 0;
    delay = 8;
  }
  
  void reset(){
    x = width/2;
    y = 0;  
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
    
    //animate stuff
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
    
    if (x > 500 && reachedBottom) {
      reachedEnemy = true;
      reachedBottom = false;
    }
    
    if (reachedEnemy) {
      gameStat = "ENEMY";
    } else {
      checkWallCollisionsMap2(ps);
    }
    
    
  }
  void display() {
    copy( playerArtSmall, 
          sx, sy, w, h, 
          x, y, w, h);
    
  }
}
