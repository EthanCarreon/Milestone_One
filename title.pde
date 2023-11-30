class Title {
  
void drawTitle (float x, float y, float w, float h) {
  if (mouseIsOverTitle() && !buttonClicked) {
    fill(220);
    rect(x, y, w, h);
    fill(0);
    textSize(60);
    text("START", 200, 220);
  } else {
    fill(170);
    rect(x, y, w, h);
    fill(0);
    textSize(60);
    text("START", 200, 220);
  }
  
}

void drawBackground() {
  
  textSize(80);
  fill(255);
  text("nonamegame", 95, 80);

}

  boolean mouseIsOverTitle() {
    if (mouseX > 200 && mouseX < 200+180 && mouseY > 170 && mouseY < 170 + 55) {
      return true;
    } else {
      return false;
    }
  }
  

}
