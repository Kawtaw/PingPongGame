void Restart() {
  Play = true;
  leftPaddle.changeY(250);
  rightPaddle.changeY(250);
  for (int i = ball.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball getBall = ball.get(i);
    getBall.reset();
  }
  LeftScore = 0;
  RightScore = 0;
  Button1.ChangeVisibility(false);
}
