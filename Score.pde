// This procedure increase the score for the player that scored
void Score(boolean Right) {
  if (Right) {
    LeftScore = LeftScore + 1;
  } else {
    RightScore = RightScore + 1;
  }
  SetBall();
  if (LeftScore >= 3) {
    GameOver = true;
  } else if (RightScore >= 3) {
    GameOver = true;
  }
}
