class Paddle {
  private int Length;
  private int Yp;
  private int yMove = 0;
  private int PaddleSpeed;
  private int Xp;
  
  public Paddle(int lengths, int yp, int paddlespeed, int xp) {
    this.Length = lengths;
    this.Yp = yp;
    this.PaddleSpeed = paddlespeed;
    this.Xp = xp;
  }
  
  public void changeYMove(int a) {
    yMove = a;
  }
  
  public int getYp() {
    return Yp;
  }
  
  public int getYMove() {
    return yMove;
  }
  
  public int getLength() {
    return Length;
  }
  
  public void changeY(int newYp) {
    Yp = newYp;
  }
  
  void Step() {
   if (Yp < 0 && yMove == -1) {
      yMove = 0;
    }
    if (Yp > 600 - Length && yMove == 1) {
      yMove = 0;
    }
    Yp = Yp + yMove*PaddleSpeed;
    rect(Xp,Yp,8,Length);
  }
}
