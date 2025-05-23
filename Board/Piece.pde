public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  public abstract void move(int[] newPos);
  
  public abstract void capture(Piece other);
  
  public abstract boolean canMove(int[] newPos);
   
  public abstract boolean canCapture(int[] newPos);
  
  public abstract boolean canCapture(Piece other);
  
  public abstract void applyCheck(King other);
  
  public abstract boolean reachable(int[] newPos);
  
  public boolean isAlive(){
      return alive;
  }
  
  public int[] getPos(){
      return position;
  }
  
  public String getType(){
      return type;
  }
  
  public boolean getCheckStatus(){
      return inCheck; 
  }
  
  public void setCheckStatus(boolean status){
      this.inCheck = status;
  }
  
  public boolean side(){
      return shinySide;
  }
}
