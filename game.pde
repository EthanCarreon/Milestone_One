void gameStat() {
  atBegin = true;
  renderMap1();
  p.update();
  p.display();
}

void gameStatSmall() {
  renderMap2();
  ps.update();
  ps.display();
}
