

public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  

  public void move(int[] newPos){
    if(canMove(newPos)){
      this.position = newPos;
      for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
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
  
  public boolean canCapture(Piece other){
    return this.getLegalMoves().contains(other.getPos());
  }
  
  public abstract void applyCheck(King other);
  
  public abstract boolean reachable(int[] newPos);
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> legalMoves = new ArrayList<int[]>();
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
         if(canMove(new int[]{i, j})){
            legalMoves.add(new int[]{i, j});
         }
      }
    }
    return legalMoves;
  }
  
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
