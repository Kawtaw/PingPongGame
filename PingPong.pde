int PaddleLength = 150; //150
int LPY = 250; // Left Paddle Y Position
int RPY = 250; // Right Paddle Y Position
int LPMove = 0; // Left Paddel Move
int RPMove = 0; // Right Paddle Move
int PaddleSpeed = 12; // Paddle Speed
float BallX = 0;
float BallY = 0;
float BallXSpeed = 3;
float BallYSpeed = 3;
int BallDiameter = 20;
int BallDiameterHalf = BallDiameter/2;

float BallMoveInitialX = 0;
float BallMoveInitialY = 0;

float BallXMove = 0;
float BallYMove = 0;

int LeftScore = 0;
int RightScore = 0;

boolean BallFroze = false;
boolean GameOver = false;

void SetBall() {
  BallFroze = false;
  BallX = 400;
  BallY = 300;
  BallMoveInitialX = floor(random(0,2));
  BallMoveInitialY = floor(random(0,2));
  BallXMove = BallMoveInitialX;
  if (BallMoveInitialY == 0) {
    BallYMove = BallMoveInitialY - 1;
  } else {
    BallYMove = BallMoveInitialY;
  }
  if (BallXMove == 0) {
    BallXMove = -1;
  }
  BallXSpeed = 3;
  BallYSpeed = 3;
  BallDiameter = 20;
  BallDiameterHalf = 10;
}

void setup() {
  background(50,50,50);
  size(800,600);
  SetBall();
}

void Restart() {
  LeftScore = 0;
  RightScore = 0;
  GameOver = false;
  LPY = 250;
  RPY = 250;
}

void Bounce(boolean Horizontal) {
  if (Horizontal) {
    BallXMove = BallXMove*-1;
  } else {
    BallYMove = BallYMove*-1;
  }
  BallXSpeed = BallXSpeed + 0.25; // Speed up ball horizontal movement
  BallYSpeed = BallYSpeed + 0.25; // Speed up ball vertical movement
}

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

void checkPosition() {
  BallDiameterHalf = BallDiameter/2;
  if (!BallFroze) {
    if (BallX<20+BallDiameterHalf && BallXMove<0) {
      if (LPY<BallY+BallDiameterHalf && LPY+PaddleLength>BallY-BallDiameterHalf) {
        Bounce(true);
      }
    } else if (BallX>780-BallDiameterHalf && BallXMove>0) {
      if (RPY<BallY+BallDiameterHalf && RPY+PaddleLength>BallY-BallDiameterHalf) {
        Bounce(true);
      }
    }
    if (BallY<0+BallDiameterHalf) {
      if (BallYMove < 0) {
        Bounce(false);
      }
    } else if (BallY>600-BallDiameterHalf) {
      if (BallYMove > 0) {
        Bounce(false);
      }
    }
    if (BallX<20+BallDiameterHalf && BallXMove<0) {
      BallFroze = true;
    } else if (BallX>780-BallDiameterHalf && BallXMove>0) {
      BallFroze = true;
    }
  } else {
    if (BallX+BallDiameterHalf<0) {
      Score(false);
    } else if (BallX-BallDiameterHalf>800) {
      Score(true);
    }
  }
}

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

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      RPMove = -1;
    } else if (keyCode == DOWN) {
      RPMove = 1;
    } 
  }
  if (key == 'w' || key == 'W') {
    LPMove = -1;
  } else if (key == 's' || key == 'S') {
    LPMove = 1;
  }
  if (key == 'p' || key == 'P') {
    Restart();
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (RPMove == -1) {
        RPMove = 0;
      }
    } else if (keyCode == DOWN) {
      if (RPMove == 1) {
        RPMove = 0;
      }
    } 
  }
  if (key == 'w' || key == 'W') {
    if (LPMove == -1) {
      LPMove = 0;
    }
  } else if (key == 's' || key == 'S') {
    if (LPMove == 1) {
      LPMove = 0;
    }
  }
}
