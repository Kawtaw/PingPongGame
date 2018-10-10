// Bounce the ball in a direction based on its parameter
void Bounce(boolean Horizontal) {
  if (Horizontal) {
    BallXMove = BallXMove*-1;
  } else {
    BallYMove = BallYMove*-1;
  }
  BallXSpeed = BallXSpeed + 0.25; // Speed up ball horizontal movement
  BallYSpeed = BallYSpeed + 0.25; // Speed up ball vertical movement
}
