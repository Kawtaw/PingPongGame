void LeftPaddleAI() {
  int Distance = 9000;
  Ball trackBall = ball.get(0);
  for (int i = ball.size()-1; i >= 0; i--) {
    Ball getBall = ball.get(i);
    if (getBall.getXm() < 0 && getBall.getX() > 20) {
      int a = abs(getBall.getX());
      if (abs(a) == 3) {
        a = ceil(a*1.31);
      }
      if (Distance > a) {
        Distance = a;
        trackBall = ball.get(i);
      }
    }
  }
  if (trackBall.getY() > (leftPaddle.getYp()) && trackBall.getY() < (leftPaddle.getYp()+leftPaddle.getLength())) {
    leftPaddle.changeYMove(0);
  } else if (trackBall.getY() > (leftPaddle.getYp()+leftPaddle.getLength()/2)) {
    if (leftPaddle.getYp() < 450) {
      leftPaddle.changeYMove(1);
    }
  } else {
    if (leftPaddle.getYp() > 0) {
      leftPaddle.changeYMove(-1);
    }
  }
}
