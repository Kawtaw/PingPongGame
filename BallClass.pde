class Ball {
  private int Radius;
  private int X;
  private int Y;
  
  private int iXm;
  private int iYm;
  
  private int Xm; // X Move
  private int Ym; // Y Move
  
  public Ball(int x, int y, int radius, int xm, int ym) {
    this.X = x;
    this.Y = y;
    this.Radius = radius;
    this.iXm = xm;
    this.iYm = ym;
    this.Xm = xm;
    this.Ym = ym;
  }
  
  public int getX() {
    return X;
  }
  public int getY() {
    return Y;
  }
  public int getXm() {
    return Xm;
  }
  public int getYm() {
    return Ym;
  }
  public int getRadius() {
    return Radius;
  }

  void Bounce(boolean Horizontal) {
    if (Horizontal) {
      Xm = Xm*-1;
    } else {
      Ym = Ym*-1;
    }
  }
  
  void reset() {
    X = 400;
    Y = 300;
    Xm = iXm;
    Ym = iYm;
  }

  void step() {
    X = X + Xm;
    Y = Y + Ym;
    if (X<20+Radius && Xm<0) {
      if (leftPaddle.getYp()<Y+Radius && leftPaddle.getYp()+leftPaddle.getLength()>Y-Radius) {
        Bounce(true);
      }
    } else if (X>780-Radius && Xm>0) {
      if (rightPaddle.getYp()<Y+Radius && rightPaddle.getYp()+rightPaddle.getLength()>Y-Radius) {
        Bounce(true);
      }
    }
    if (Y<0+Radius) {
      if (Ym < 0) {
        Bounce(false);
      }
    } else if (Y>600-Radius) {
      if (Ym > 0) {
        Bounce(false);
      }
    }
    if (X < 20) {
      X = 400;
      Y = 300;
      RightScore = RightScore + 1;
    } else if (X > 780) {
      X = 400;
      Y = 300;
      LeftScore = LeftScore + 1;
    }
    ellipse(X,Y,Radius*2,Radius*2);
  }
}
