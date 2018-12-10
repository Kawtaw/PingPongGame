void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      rightPaddle.changeYMove(-1);
    } else if (keyCode == DOWN) {
      rightPaddle.changeYMove(1);
    } 
  }
  if (key == 'w' || key == 'W') {
    leftPaddle.changeYMove(-1);
  } else if (key == 's' || key == 'S') {
    leftPaddle.changeYMove(1);
  }
  if (key == 'p' || key == 'P') {
    Restart();
  }
}
