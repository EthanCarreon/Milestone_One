class Enemy {
  //props
  int x, y, w, h;

  int currentFrame, offsetX, offsetY, totalFrames, row, sx, sy;
  int hold, delay;

  boolean moveLeft, moveUp, moveRight, moveDown;

  int speed, vx, vy;
  
  boolean dead;

  Enemy(int[]pos) {
    w = 32;
    h = 32;
    x = pos[1]+w/2;
    y = pos[0]+h/2;

    currentFrame = 0;
    offsetX = 6 * w;
    offsetY = 4 * h;
    totalFrames = 3;
    row = 0;

    delay = 4;

    moveLeft = false;
    moveUp = false;
    moveRight = false;
    moveDown = false;

    speed = 1;
    vx = 0;
    vy = 0;
    
    dead = false;
    
  }
  
  void reset(){
   int[] newPos = createRandomEnemyStart();
   x = newPos[1]+w/2;
   y = newPos[0]+h/2;
   dead = false;
  }
  
  void die() {
    dead = true;
    println("enemy dead");
  }
  
  void update() {
    float distanceApart = dist(em.x+em.w/2, em.y+em.h/2, x+w/2, y+h/2);
    if (distanceApart < 200) {  
      if (abs(em.x-x) < abs(em.y-y)) {
        if (y < em.y) {
          moveUp = false;
          moveDown = true;
        } else {
          moveUp = true;
          moveDown = false;
        }
      } else {
        if (x < em.x) {
          moveLeft = false;
          moveRight = true;
        } else {
          moveLeft = true;
          moveRight = false;
        }
      }
    } else {
      moveLeft = false;
      moveUp = false;
      moveRight = false;
      moveDown = false;
    }

    if (moveLeft && !moveRight) {
      vx = -speed;
      row = 1;
    }
    if (moveRight && !moveLeft) {
      vx = speed;
      row = 2;
    }
    if (!moveLeft && !moveRight) {
      vx = 0;
    }

    if (moveUp && !moveDown) {
      vy = -speed;
      row = 3;
    }
    if (moveDown && !moveUp) {
      vy = speed;
      row = 0;
    }
    if (!moveUp && !moveDown) {
      vy = 0;
    }

    if (!moveLeft && !moveUp && !moveRight && !moveDown) {
      vx = 0;
      vy = 0;
      currentFrame = 1;
    }

    x += vx;
    y += vy;

    sx = currentFrame * w;
    sy = row * h;
    hold = (hold+1)%delay;
    if (hold == 0) {
      currentFrame = (currentFrame+1)%totalFrames;
    }
  }
  void display() {
    fill(121, 255, 254, 80);
    rect(x, y, w, h);
    fill(0);
    rect(x+w/2, y+h/2, 1, 1);
  }
}
