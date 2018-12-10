void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (rightPaddle.getYMove() == -1) {
        rightPaddle.changeYMove(0);
      }
    } else if (keyCode == DOWN) {
      if (rightPaddle.getYMove() == 1) {
        rightPaddle.changeYMove(0);
      }
    } 
  }
  if (key == 'w' || key == 'W') {
    if (leftPaddle.getYMove() == -1) {
      leftPaddle.changeYMove(0);
    }
  } else if (key == 's' || key == 'S') {
    if (leftPaddle.getYMove() == 1) {
      leftPaddle.changeYMove(0);
    }
  }
}
