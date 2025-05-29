public class Bishop extends Piece{
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  public Bishop(int[] position, boolean shinySide){
    super.setAlive(true);
    this.position = position;
    this.type = "BISHOP";
    super.setCheckStatus(false); // maybe change this to king only after everything works for runtime 
    this.shinySide = shinySide;
  }
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    int originalPosX = this.getPos()[0];
    int originalPosY = this.getPos()[1];
    int currPosX = originalPosX;
    int currPosY = originalPosY;
    boolean canContinue = true;
    while (currPosX <= 7 && currPosY >= 0 && canContinue){
      currPosX += 1;
      currPosY -= 1;
      if (positions.contains(new int[] {currPosX, currPosY})){
        canContinue = false;
      }
      else{
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX >= 0 && currPosY >= 0 && canContinue){
      currPosX -= 1;
      currPosY -= 1;
      if (positions.contains(new int[] {currPosX, currPosY})){
        canContinue = false;
      }
      else{
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX <= 7 && currPosY <= 7 && canContinue){
      currPosX += 1;
      currPosY += 1;
      if (positions.contains(new int[] {currPosX, currPosY})){
        canContinue = false;
      }
      else{
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX >= 0 && currPosY <= 7 && canContinue){
      currPosX -= 1;
      currPosY += 1;
      if (positions.contains(new int[] {currPosX, currPosY})){
        canContinue = false;
      }
      else{
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    return toReturn;
  }
  
  
  public boolean reachable(int[] newPos){
    return (newPos[1] - this.position[1]) / (newPos[0] - this.position[0]) == 1 ||
    (newPos[1] - this.position[1]) / (newPos[0] - this.position[0]) == -1;
  }
  
  public boolean canMove(int[] newPos){
   boolean pieceOnPos = false;
   int[] temp = new int[2];
   if (Board.turnNumber % 2 == 1){
     for(int i = 0; i < Board.white.size(); i++){
       temp = Board.pieces.get(i).getPos();
       if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
         pieceOnPos = true;
       }
      }
   }
   else{
     for(int i = 0; i < Board.black.size(); i++){
       temp = Board.pieces.get(i).getPos();
       if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
         pieceOnPos = true;
       }
      }
   }
    return !pieceOnPos && this.reachable(newPos) && !inCheck;
  }
  
  public String getType(){
    return "BISHOP";
  }
  
  public int[] getPos(){
      return position;
  }
  
  public boolean side(){
      return shinySide;
  }
  
  public void setCheck(boolean newValue){
    this.inCheck = newValue;
  }
  
  public void applyCheck(King other){}

}
