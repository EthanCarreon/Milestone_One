class Player {

  int x, y, w, h;
  int vx, vy;
  
  int currentFrame, totalFrames, row, sx, sy;
  int hold, delay;
  
  int health;

  Player() {
    x = width/2;
    y = height/2;
    w = 40;
    h = 71;
    
    totalFrames = 3;
    row = 0;
    

    delay = 8;
  }

  void update() {
    if (left && !right) {
      vx = -3;
      row = 3;
    }
    if (right && !left) {
      vx = 3;
      row = 2;
    }
    if (!left && !right) {
      vx = 0;
    }
    if (up && !down) {
      vy = -3;
      row = 1;
    }
    if (down && !up) {
      vy = 3;
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

    
    if (y > 500 && atBegin) {
      reachedBottom = true;
      atBegin = false;
    }

    if (reachedBottom) {
      gameStat = "SMALL";
      atBegin = false;

    } else {
      checkWallCollisionsMap(p);
    }
    
    
  }
  void display() {
    copy( playerArt, 
          sx, sy, w, h, 
          x, y, w, h);
    
  }
}
