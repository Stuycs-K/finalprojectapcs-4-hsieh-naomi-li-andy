public class Rook extends Piece{
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private boolean canCastle;
  
  public Rook(int[] position, boolean shinySide){
    super.setAlive(true);
    this.position = position;
    type = "ROOK";
    super.setCheckStatus(false);
    this.shinySide = shinySide;
    canCastle = true;
  }
  
  public void capture(){ 
    if (this.side()){
      for (int count = 0; count < white.size(); count++){
        if (white.get(count).getPos()[0] == this.getPos()[0] && white.get(count).getPos()[1] == this.getPos()[1]){
          white.remove(count);
        }
      }
    }
    else{
      for (int count = 0; count < black.size(); count++){
        if (black.get(count).getPos()[0] == this.getPos()[0] && black.get(count).getPos()[1] == this.getPos()[1]){
          black.remove(count);
        }
      }
    }
  }
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    int originalPosX = this.getPos()[0];
    int originalPosY = this.getPos()[1];
    int currPosX = originalPosX;
    int currPosY = originalPosY;
    boolean canContinue = true;
    while (currPosX <= 7 && canContinue){
      currPosX += 1;
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
    while (currPosX >= 0 && canContinue){
      currPosX -= 1;
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
    while (currPosY <= 7 && canContinue){
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
    while (currPosY >= 7 && canContinue){
      currPosY -= 1;
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
    if(newPos[0] == this.position[0] && newPos[1] == this.position[1]){
      return false;
    }
    else if(newPos[0] == this.position[0]){
      if(newPos[1] < this.position[1]){
        for(int i = 1; i < this.position[1]; i++){
             for(Piece p : white){
               if(p.getPos()[0] == newPos[0] && p.getPos()[1] == newPos[1]+i){
                  return false;
               }
             }

            for(Piece p : black){
               if(p.getPos()[0] == newPos[0] && p.getPos()[1] == newPos[1]+i){
                  return false;
               }
             }
        }
        return true;
      }
    }
    else if(newPos[1] == this.position[1]){
      if(newPos[0] < this.position[0]){
        for(int i = 1; i < this.position[0]; i++){
             for(Piece p : white){
               if(p.getPos()[1] == newPos[1] && p.getPos()[0] == newPos[0]+i){
                  return false;
               }
             }
            for(Piece p : black){
               if(p.getPos()[1] == newPos[1] && p.getPos()[0] == newPos[0]+i){
                  return false;
               }
             }
        }
        return true;
      }
    }
    return false;
  }
  
  
  public boolean canMove(int[] newPos){
   boolean pieceOnPos = false;
   int[] temp = new int[2];
   for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
     temp = Board.pieces.get(i).getPos();
     if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
       pieceOnPos = true;
     }
    }
    return !pieceOnPos && this.reachable(newPos) && !inCheck;
  }
  
  public String getType(){
    return "ROOK";
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
  
  public boolean castleStatus(){
    return canCastle;  
  }
}
