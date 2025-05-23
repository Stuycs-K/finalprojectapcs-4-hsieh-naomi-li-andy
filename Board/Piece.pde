public class Piece{

public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  public void move(int[] new Pos){
  }
  
  public void capture(Piece other){
  }
  
  public boolean canMove(int[] newPos){
  }
   
  public boolean canCapture(int[] newPos){
  }
  
  public boolean canCapture(Piece other){
  }
  
  public void applyCheck(King other){
  }
  
  public boolean isAlive(){
  }
  
  public int[] getPos(){
  }
  
  public String getType(){
  }
  
  public boolean getCheckStatus(){
  }
  
  public void setCheckStatus(boolean status){
  }
  
  public boolean side(){
  public void move(int[] newPos){
    if(canMove(newPos)){
      this.position = newPos;
    }
  }
  
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
