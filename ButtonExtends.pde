class StartButton extends Button {
  boolean Visible;
  int X = 300;
  int Y = 200;
  
  StartButton (int x, int y, boolean visible) {
    X = x;
    Y = y;
    Visible = visible;
  }
  
  public void ChangeVisibility(boolean visible) {
    if (visible) {
      fill(255,125,0);
      textSize(50);
      rect(X,Y,200,100);
      fill(0,255,0);
      text("Press P",X+20,Y+60);
    }
  }
}
