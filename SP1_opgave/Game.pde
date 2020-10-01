import java.util.Random;

class Game
{
  private Random rnd;
  private final int width;
  private final int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int playerLife2;
  private Dot player;
  private Dot player2;
  private Dot[] enemies;
  private Dot [] food;
  
   
  Game(int width, int height, int numberOfEnemies, int numberOfFood)
  {
    if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0,0,width-1, height-1);
    player2 = new Dot(width-1,0,width-1, height-1);
    enemies = new Dot[numberOfEnemies];
    food = new Dot [numberOfFood];
    for(int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    for(int i = 0; i < numberOfFood; ++i)
    {
      //foods startposition
      food[i] = new Dot(width-1,height-1, width-1, height-1);
    }
    this.playerLife = 100;
    this.playerLife2 = 100;
  }
  public int getWidth()
  {
    return width;
  }
  public int getHeight()
  {
    return height;
  }
  public int getPlayerLife()
  {
    return playerLife;
  }
  public int getPlayerLife2()
  {
    return playerLife2;
  }
  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }
  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }
  public void onArrowPressed (char ch){
    keys.onArrowPressed(ch);
  }
  
  public void onArrowReleased (char ch){
    keys.onArrowReleased(ch);
  }
  public void update()
  {
    updatePlayer();
    updatePlayer2();
    updateEnemies();
    updateFood();
    checkForCollisions();
    clearBoard();
    populateBoard();
  }
  
  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }
  
  private void clearBoard()
  {
    for(int y = 0; y < height; ++y)
    {
      for(int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
    private void updateFood()
  {
    for(int i = 0; i < food.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - food[i].getX();
        int dy = player.getY() - food[i].getY();
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            //Player is to the right
            food[i].moveLeft();
          }
          else
          {
            //Player is to the left
            food[i].moveRight();
          }
        }
        else if(dy > 0)
        {
          //Player is down;
          food[i].moveUp();
        }
        else
        {//Player is up;
          food[i].moveDown();
        }
      }
      else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          food[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          food[i].moveLeft();
        }
        else if(move == 2)
        {
          //Move up
          food[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }
 
  private void updatePlayer()
  {
    if(keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if(keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if(keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if(keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }  
  }
  private void updatePlayer2(){
    if(keys.upDown() && !keys.downDown())
    {
      player2.moveUp();
    }
    if(keys.leftDown() && !keys.rightDown())
    {
      player2.moveLeft();
    }
    if(keys.downDown() && !keys.upDown())
    {
      player2.moveDown();
    }
    if(keys.rightDown() && !keys.leftDown())
    {
      player2.moveRight();
    }  
  }
  
  private void updateEnemies()
  {
    for(int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          }
          else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        }
        else if(dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        }
        else
        {//Player is up;
          enemies[i].moveUp();
        }
      }
            {
        //We follow
        int dx = player2.getX() - enemies[i].getX();
        int dy = player2.getY() - enemies[i].getY();
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            //Player 2 is to the right
            enemies[i].moveRight();
          }
          else
          {
            //Player 2 is to the left
            enemies[i].moveLeft();
          }
        }
        else if(dy > 0)
        {
          //Player 2 is down;
          enemies[i].moveDown();
        }
        else
        {//Player 2 is up;
          enemies[i].moveUp();
        }
      }
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          enemies[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        }
        else if(move == 2)
        {
          //Move up
          enemies[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }
    private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    //insert player2
    board[player2.getX()][player2.getY()] = 4;
    //Insert enemies
    for(int i = 0; i < enemies.length; ++i){
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    //insert food
    for(int i = 0; i < food.length; ++i)
    {
      board[food[i].getX()][food[i].getY()] = 3;
    }
  }
   
  private void checkForCollisions()
  {
    //Check enemy collisions - player 1
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision - player 1
        --playerLife;
      }
    }
    //Check enemy collision - player 2
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY())
      {
        //We have a collision - player 2 
        --playerLife2;
      }
    }
     for(int i = 0; i < food.length; ++i)
    {
      if(food[i].getX() == player.getX() && food[i].getY() == player.getY())
      {
        ++playerLife;
      }
    }
     for(int i = 0; i < food.length; ++i)
    {
      if(food[i].getX() == player2.getX() && food[i].getY() == player2.getY())
      {
        ++playerLife2;
      }
      
      if(food[i].getX() == player.getX() && food[i].getY() == player.getY()){
        food[i] = new Dot ((int)random(width-1), (int)random(height-1), width-1, height-1);

      }
      if(food[i].getX() == player2.getX() && food[i].getY() == player2.getY()){
        food[i] = new Dot ((int)random(width-1), (int)random(height-1), width-1, height-1);

      }
    }
    }
}
