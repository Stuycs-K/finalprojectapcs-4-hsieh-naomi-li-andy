public class Piece{

public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  

  public void move(int[] newPos){
    if(canMove(newPos)){
      this.position = newPos;
      for(int i = 0; i < Board.pieces.size(); i++){
        if(pieces.get(i).getPos().equals(newPos)){
             capture(pieces.get(i), newPos);
        }
      }
    }
  }
  
  public void capture(Piece other, int[] newPos){
    if(canMove(newPos) && other.getPos().equals(newPos) && other.side() != this.side()){
        other.setAlive(false);
    } 
  }
  
  public abstract boolean canMove(int[] newPos);
  
  public abstract boolean canCapture(Piece other);
  
  public abstract void applyCheck(King other);
  
  public abstract boolean reachable(int[] newPos);
  
  public abstract ArrayList<int[]> getLegalMoves();
  
  public boolean isAlive(){
      return alive;
  }
  
  public boolean setAlive(boolean life){
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
