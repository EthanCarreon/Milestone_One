void gameStat() {
  atBegin = true;
  renderMap1();
  p.update();
  p.display();
  //checkWallCollisionsMap(p);

}

void gameStatSmall() {
  renderMap2();
  ps.update();
  ps.display();
  //checkWallCollisionsMap(p);
}

void gameStatEnemy() {
  reachedEnemy = true;
  renderMap3();
  em.update();
  em.display();
  //checkWallCollisionsMap(p);
  for (int i = 0; i < enemies.length; i++) {
    if (enemies[i].dead == false) {
      enemies[i].update();
      checkWallCollisionsMap3(enemies[i]);
      enemies[i].display();
      if (rectangleIntersect(em, enemies[i]) == true) {
        fill(255, 0, 0, 70);
        rect(0, 0, width, height);
        currentEnemy = enemies[i];
        gameStat = "FIGHT";
        obstacleStart(obstacleSize);
        fight();
        println("combat start");
      }
    }
  }


}
