public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private King king;
  private Piece checkingPiece; 
  
  public void capture(){ // needs to be corrected (edit: seems to work for pawn capturing)
    if (this.side()){
      for (int count = 0; count < white.size(); count++){
        if (white.get(count).getPos()[0] == this.getPos()[0] && white.get(count).getPos()[1] == this.getPos()[1]){
          white.remove(count);
        }
      }
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == this.getPos()[0] && pieces.get(count).getPos()[1] == this.getPos()[1]){
          if (pieces.get(count).side() == false){
            pieces.remove(count);
          }
        }
      }
    }
    else{
      for (int count = 0; count < black.size(); count++){
        if (black.get(count).getPos()[0] == this.getPos()[0] && black.get(count).getPos()[1] == this.getPos()[1]){
          black.remove(count);
        }
      }
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == this.getPos()[0] && pieces.get(count).getPos()[1] == this.getPos()[1]){
          if (pieces.get(count).side() == true){
            pieces.remove(count);
          }
        }
      }
    }
  }

  public boolean move(int[] newPos){
   // System.out.println("trying to move");
    boolean contains = false;
    for(int[] i : this.getLegalMoves()){
    //  System.out.println(Arrays.toString(i));
      if(i[0] == newPos[0] && i[1] == newPos[1]){
        contains = true;
      }
    }
    System.out.println(Arrays.toString(newPos));
    if(contains){
      this.setPos(newPos);
      this.capture();
      System.out.println("moving in func");
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
    //System.out.println("calling canCapture for " + this.getType());
    return this.reachable(other.getPos());
  }
  
  
  public void applyCheck(King other){
    if(this.canCapture(other)){
       other.applyCheck();
       other.setCheckingPiece(this);
    }
  }
  
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
  
  public void setPos(int[] newPos){
      position = new int[2];
      position[0] = newPos[0];
      position[1] = newPos[1];
  }
  
  public String getType(){
      return type;
  }
  
  public void setType(String type){
    this.type = type;
  }
  
  public boolean getCheckStatus(){
      return inCheck; 
  }
  
  public void setCheck(boolean status){
      this.inCheck = status;
  }
  
  public boolean side(){
      return shinySide;
  }
  
   public void setSide(boolean side){
      shinySide = side;
  }
  
  public void setKing(King king){
      this.king = king;
  }
  
  public King getKing(){
      return king;
  }
  
  public void setCheckingPiece(Piece attacker){
      checkingPiece = attacker;
  }
  
  public Piece getCheckingPiece(){
      return checkingPiece;
  }
  
  
}
