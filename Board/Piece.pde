public class Piece{
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
  }
}
