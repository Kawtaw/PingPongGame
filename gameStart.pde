// This procedure reset the global variable for a new game.
void Restart() {
  LeftScore = 0;
  RightScore = 0;
  GameOver = false;
  SetBall();
  LPY = 250;
  RPY = 250;
}
