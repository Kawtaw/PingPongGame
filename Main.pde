Paddle leftPaddle = new Paddle(150,250,12,16);
Paddle rightPaddle = new Paddle(150,250,12,776);
StartButton Button1 = new StartButton(300,100,true);

int LeftScore = 0;
int RightScore = 0;
boolean Play = false;

ArrayList<Ball> ball;

void setup() {
  ball = new ArrayList<Ball>();
  background(50,50,50);
  size(800,600);
  
  if (width > displayWidth) {
    println("ERROR: Change ping pong table size-lengh, it is too big");
    exit();
  }
  if (height > displayHeight) {
    println("ERROR: Change ping pong table size-lengh, it is too big");
    exit();
  }
  ball.add(new Ball(400,300,10,3,3));
  ball.add(new Ball(400,300,10,-3,3));
  ball.add(new Ball(400,300,10,-3,-3));
  ball.add(new Ball(400,300,10,3,-3));
  ball.add(new Ball(400,300,10,4,4));
  ball.add(new Ball(400,300,10,-4,4));
  ball.add(new Ball(400,300,10,-4,-4));
  ball.add(new Ball(400,300,10,4,-4));
}

void draw() {
  noStroke();
  if (!Play) {
    fill(0,0,0);
    rect(0,0,800,600);
    fill(255,255,255);
    textSize(50);
    text("W,S and Arrow Key to Control",50,450);
    Button1.ChangeVisibility(true);
  } else {
    fill(50,50,50);
    rect(0,0,800,600);
    fill(255,255,255);
    leftPaddle.Step();
    rightPaddle.Step();
    for (int i = ball.size()-1; i >= 0; i--) { 
      Ball getBall = ball.get(i);
      getBall.step();
    }
    textSize(40);
    text(LeftScore+"/10",140,50);
    text(RightScore+"/10",625,50);
    LeftPaddleAI(); // Comment out this line to disable Left AI
    //RightPaddleAI(); // Comment out this line to disable Right AI
  }
  if (LeftScore >= 10 || RightScore >= 10) {
    fill(0,0,0);
    rect(0,0,800,600);
    fill(255,255,255);
    textSize(100);
    if (LeftScore > RightScore) {
      text("Left Won!",200,300);
    } else {
      text("Right Won!",170,300);
    }
    textSize(50);
    text("W,S and Arrow Key to Control",50,450);
    Button1.ChangeVisibility(true);
  }
}
