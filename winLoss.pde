void drawLoss() {
  
  textSize(80);
  fill(255);
  text("You Lost!", 95, 80);
  
  if (mousePressed && mouseX > 200 && mouseX < 200+180 && mouseY > 170 && mouseY < 170 + 55) {
      reset();
    } 
  
}

void drawReplay (float x, float y, float w, float h) {
  if (mouseIsOverReplay() && !buttonClicked) {
    fill(220);
    rect(x, y, w, h);
    fill(0);
    textSize(60);
    text("Replay", 200, 220);
  } else {
    fill(170);
    rect(x, y, w, h);
    fill(0);
    textSize(60);
    text("Replay", 200, 220);
  }
  
}

  boolean mouseIsOverReplay() {
    if (mouseX > 200 && mouseX < 200+180 && mouseY > 170 && mouseY < 170 + 55) {
      return true;
    } else {
      return false;
    }
  }
  
void reset() {
  p.reset();
  ps.reset();
  em.reset();
  for (int i = 0; i < enemies.length; i++) {
    enemies[i].reset();
  }
  gameStat = "START";
}
