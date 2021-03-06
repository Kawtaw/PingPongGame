void RightPaddleAI() {
  int Distance = 9000;
  Ball trackBall = ball.get(0);
  for (int i = ball.size()-1; i >= 0; i--) { 
    Ball getBall = ball.get(i);
    if (getBall.getXm() > 0 && getBall.getX() > 20) {
      int a = abs(getBall.getX()-800);
      if (abs(a) == 3) {
        a = ceil(a*1.31);
      }
      if (Distance > a) {
        Distance = a;
        trackBall = ball.get(i);
      }
    }
  }
  if (trackBall.getY() > (rightPaddle.getYp()) && trackBall.getY() < (rightPaddle.getYp()+rightPaddle.getLength())) {
    rightPaddle.changeYMove(0);
  } else if (trackBall.getY() > (rightPaddle.getYp()+rightPaddle.getLength()/2)) {
    if (rightPaddle.getYp() < 450) {
      rightPaddle.changeYMove(1);
    }
  } else {
    if (rightPaddle.getYp() > 0) {
      rightPaddle.changeYMove(-1);
    }
  }
}
