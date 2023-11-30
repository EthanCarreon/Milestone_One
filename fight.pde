/*

MOST CODE FROM ASTERAVOID GAME
(using as combat mechanic)

*/

long startScore;
int scoreNum = 0;


float obstacle1X, obstacle1Y;
float obstacle2X, obstacle2Y;
float obstacle3X, obstacle3Y;
float obstacle4X, obstacle4Y;
float obstacle5X, obstacle5Y;

float playerX;
float playerY;

int bulletHit = 0;


void fight() {
  startScore = millis();
  
}

void startScorer() {
    scoreNum = int((millis() - startScore) / 100); 
    textSize(24);
    fill(255);
    text("Score: " + scoreNum, 350, 30);
}

void startFight(float obstacleSize, float obstacleSpeed) { 
    

  // if its normal mode, when the mouse left button is being held down, the speed when it goes up and down will be the normal speed
  
  if (mousePressed && mouseButton == LEFT && playerY > -100) {
    playerY -= 7;
  }
  else if (!mousePressed && playerY < 450){ 
    playerY += 7;
  }
  outOfBounds();

  collisionCheck(obstacleSize);
  drawObstacles(obstacleSize, obstacleSpeed);
  drawRocket();
  
  if (scoreNum >= 35) {
    currentEnemy.die();
    gameStat = "ENEMY";
    
  }
  if (bulletHit == 3) {
    gameStat = "LOST";
  }
  
}

void collisionCheck(float obstacleSize) {
  
  // use the checkCollision boolean function to check if the X and Y of the rocket meet with the X and Y of the obstacles
  
    if (checkCollision(playerX, playerY, obstacleSize, obstacle1X, obstacle1Y, obstacleSize) ||
      checkCollision(playerX, playerY, obstacleSize, obstacle2X, obstacle2Y, obstacleSize) ||
      checkCollision(playerX, playerY, obstacleSize, obstacle3X, obstacle3Y, obstacleSize) ||
      checkCollision(playerX, playerY, obstacleSize, obstacle4X, obstacle4Y, obstacleSize) ||
      checkCollision(playerX, playerY, obstacleSize, obstacle5X, obstacle5Y, obstacleSize)) {
        startScore = millis();
        
        bulletHit++;
        
    // if the checkCollision boolean function becomes true, send the rocket X and Y values back to the beginning, and reset the obstacles to a different random position
    playerX = 0;
    playerY = 200; 
  }
  
  // if the rockets X value hasn't reached 175, move to the right until it has
  
  if (playerX < 175) {
      playerX += 5;
  }

}

// this function will determine if the rocket has reached out of bounds (if rocket has went off the screen)

void outOfBounds() {    
    if (playerY < -80) {
       playerX = 0;
       playerY = 200;
       gameStat = "LOST";
       
    } else if (playerY > 420) {
       playerX = 0;
       playerY = 200;
       gameStat = "LOST";
    }
}

// drawing the actual rocket

void drawRocket() {  
  fill(252, 186, 3);
  rect(playerX + 43, playerY + 50, 25, 25);
}




// this function draws the actual asteroids and make them move to the right (there are a total of only five each time they appear on screen from the right)

void drawObstacles(float obstacleSize, float obstacleSpeed) {
  fill(224, 224, 224); 
  rect(obstacle1X, obstacle1Y, obstacleSize, obstacleSize);
  rect(obstacle2X, obstacle2Y, obstacleSize, obstacleSize);
  rect(obstacle3X, obstacle3Y, obstacleSize, obstacleSize);
  rect(obstacle4X, obstacle4Y, obstacleSize, obstacleSize);
  rect(obstacle5X, obstacle5Y, obstacleSize, obstacleSize);
  
  obstacle1X += obstacleSpeed;
  obstacle2X += obstacleSpeed;
  obstacle3X += obstacleSpeed;
  obstacle4X += obstacleSpeed;
  obstacle5X += obstacleSpeed;
}

// this function will make the asteroids completely randomized on the screen

void obstacleStart(float obstacleSize) {
  obstacle1X = random(width+700 - obstacleSize);
  obstacle1Y = random(height - obstacleSize);

  obstacle2X = random(width+700 - obstacleSize);
  obstacle2Y = random(height - obstacleSize);

  obstacle3X = random(width+700 - obstacleSize);
  obstacle3Y = random(height - obstacleSize);

  obstacle4X = random(width+700 - obstacleSize);
  obstacle4Y = random(height - obstacleSize);

  obstacle5X = random(width+700 - obstacleSize);
  obstacle5Y = random(height - obstacleSize);
}


void mousePressed() {
  if (mouseButton == LEFT) {
    mousePressed = true;
  }
  
  if (!buttonClicked) {
    if (mouseX > 200 && mouseX < 200+180 && mouseY > 170 && mouseY < 170 + 55) {
      buttonClicked = true;
      gameStat = "START";
    }  
  } 
 
  
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    mousePressed = false;
  }
}

boolean checkCollision(float x1, float y1, float z1, float x2, float y2, float z2) {
  return (x1 < x2 + z2 && x1 + z1 > x2 && y1 < y2 + z2 && y1 + z1 > y2);
}
