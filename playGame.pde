The void draw does all the proccess for gameplay by costantly updating variables for ball or paddle movement. 
It also repeatedly checks ball position to see if it should bounce or score.

void draw() {
  if (!GameOver) {
    noStroke();
    fill(50,50,50);
    rect(0,0,800,600);
    if (LPY < 0 && LPMove == -1) {
      LPMove = 0;
    }
    if (LPY > 600 - PaddleLength && LPMove == 1) {
      LPMove = 0;
    }
    if (RPY < 0 && RPMove == -1) {
      RPMove = 0;
    }
    if (RPY > 600 - PaddleLength && RPMove == 1) {
      RPMove = 0;
    }
    LPY = LPY + LPMove*PaddleSpeed;
    RPY = RPY + RPMove*PaddleSpeed;
    BallX = BallX + BallXMove*BallXSpeed;
    BallY = BallY + BallYMove*BallYSpeed;
    fill(255,255,255);
    rect(20-4,LPY,8,PaddleLength); // Left Paddel
    rect(780-4,RPY,8,PaddleLength); // Right Paddel
    ellipse(BallX,BallY,BallDiameter,BallDiameter);
    textSize(40);
    text(LeftScore+"/3",140,50);
    text(RightScore+"/3",625,50);
    checkPosition();
  } else {
    if (GameOver) {
      fill(0,0,0);
      rect(0,0,800,600);
      fill(255,255,255);
      textSize(100);
      if (LeftScore > RightScore) {
        text("Left Won!",200,300);
      } else {
        text("Right Won!",200,300);
      }
      textSize(50);
      text("Press P to Restart",200,400);
    }
  }
}
