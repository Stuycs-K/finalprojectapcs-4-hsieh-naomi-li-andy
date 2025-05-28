

public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  

  public boolean move(int[] newPos){
    if(canMove(newPos)){
      this.position = newPos;
      for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
        if(pieces.get(i).getPos().equals(newPos)){
             capture(pieces.get(i), newPos);
        }
      }
      return true;
    }
    return false;
  }
  
  public void capture(Piece other, int[] newPos){
    if(canMove(newPos) && other.getPos().equals(newPos) && other.side() != this.side()){
        other.setAlive(false);
    } 
  }
  
  public abstract boolean canMove(int[] newPos);
  
  public boolean canCapture(Piece other){
    return this.getLegalMoves().contains(other.getPos());
  }
  
  public abstract void applyCheck(King other);
  
  public abstract boolean reachable(int[] newPos);
  
  public abstract ArrayList<int[]> getLegalMoves();
  
  public boolean isAlive(){
      return alive;
  }
  
  public void setAlive(boolean life){
      alive = life;
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
