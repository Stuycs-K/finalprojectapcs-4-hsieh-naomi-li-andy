public class King extends Piece{
  private boolean canCastle;
  
  public King(int[] position, boolean shinySide){
    super.setAlive(true);
    super.setPos(position);
    super.setType("KING");
    super.setCheck(false);
    super.setSide(shinySide);
    canCastle = true;
  }
  
 
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    for (int col = 0; col < 8; col++){
      for (int row = 0; row < 8; row++){
        if (this.reachable(new int[] {col, row}) && this.canMove(new int[] {col, row})){
          toReturn.add(new int[] {col, row});
        }
      }
    }
    return toReturn;
  }
  
  public boolean reachable(int[] newPos){
    if(!super.isAlive()){
      return false;
    }
    for(int i = -1; i <= 1; i++){
      for(int j = -1; j <= 1; j++){
        if(!(i == 0 && j == 0) && newPos[0] == super.getPos()[0] + i && newPos[1] == super.getPos()[1] + j){
          return true;
        }
        if(!(i == 0 && j == 0) && newPos[0] == super.getPos()[0] + j && newPos[1] == super.getPos()[1] + i){
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean canMove(int[] newPos){
    Piece temp;
    for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
      temp = Board.pieces.get(i);
      if(temp.isAlive() && temp.getPos()[0] == newPos[0] && temp.getPos()[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
        return false;
      }
      if(temp.side() != super.side() && temp.isAlive()){
        if(temp.getType().equals("KING") || temp.getType().equals("KNIGHT")){
            if(temp.reachable(newPos)){
              System.out.println("will be captured by " + temp.getType());
              return false;
              
            }
         }
        else{
            if(temp.legalMovesContains(newPos)){
              System.out.println("will be captured by " + temp.getType());
              return false;
            }
        }
        
      }
    }
    return this.reachable(newPos); 
  }
  
 
  
  
  public void castle(){}
  
  public void applyCheck(boolean checkStatus){
    if (this.side()){
      for (int count = 0; count < Board.black.size(); count++){
        Piece temp = black.get(count);
        temp.setCheck(checkStatus);
        temp.setKing(this);
        temp.setCheckingPiece(super.getCheckingPiece());
      }
    }
    else{
      for (int count = 0; count < Board.white.size(); count++){
        Piece temp = white.get(count);
        temp.setCheck(checkStatus);
        temp.setKing(this);
        temp.setCheckingPiece(super.getCheckingPiece());
      }
    }
  }
  
  /* 
  public String getType(){
    return "KING";
  }
 
  public int[] getPos(){
      return position;
  }
  
  public boolean side(){
      return shinySide;
  }
  */
  public boolean castleStatus(){
    return canCastle;
  }
}
