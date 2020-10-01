class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean upDown = false;
  private boolean leftDown = false;
  private boolean downDown = false;
  private boolean rightDown = false;
  
  public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  
  public boolean aDown()
  {
    return aDown;
  }
  
  public boolean sDown()
  {
    return sDown;
  }
  
  public boolean dDown()
  {
    return dDown;
  }
  
   public boolean upDown()
  {
    return upDown;
  }
  
  public boolean leftDown()
  {
    return leftDown;
  }
  
  public boolean rightDown()
  {
    return rightDown;
  }
  
  public boolean downDown()
  {
    return downDown;
  }
  
    void onArrowPressed(char ch)
  {
    if (key == CODED){
      if (keyCode == UP){
      upDown = true;
      }else if (keyCode == LEFT){
      leftDown = true;
      }else if (keyCode == RIGHT){
      rightDown = true;
      }else if (keyCode == DOWN){
      downDown = true;
      }
    }
   
  } 
  void onKeyPressed(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = true;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = true;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
  }
  
  void onKeyReleased(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = false;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = false;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = false;
    }
  }
    void onArrowReleased(char ch){
    
 if (key == CODED){
      if (keyCode == UP){
      upDown = false;
      }else if (keyCode == LEFT){
      leftDown = false;
      }else if (keyCode == RIGHT){
      rightDown = false;
      }else if (keyCode == DOWN){
      downDown = false;
      }
}
  }
}
