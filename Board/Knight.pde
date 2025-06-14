public class Knight extends Piece{
  
  public Knight(int[] position, boolean shinySide, King king){
    super.setAlive(true);
    super.setPos(position);
    super.setType("KNIGHT");
    super.setCheck(false);
    super.setSide(shinySide);
    super.setKing(king);
  }
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    for (int col = 0; col < 8; col++){
      for (int row = 0; row < 8; row++){
        if (this.reachable(new int[] {col, row}) && this.canMove(new int[] {col, row})){
          for (int count = 0; count < pieces.size(); count++){
            if (pieces.get(count).side() != this.side()){
              toReturn.add(new int[] {col, row});
              }
          }
        }
      }
    }
    return toReturn;
  }
  
  public boolean reachable(int[] newPos){
    boolean legalMove = (newPos[0] == super.getPos()[0] + 2 && newPos[1] == super.getPos()[1] + 1)
            || (newPos[0] == super.getPos()[0] - 2 && newPos[1] == super.getPos()[1] + 1)
            || (newPos[0] == super.getPos()[0] + 2 && newPos[1] == super.getPos()[1] - 1)
            || (newPos[0] == super.getPos()[0] - 2 && newPos[1] == super.getPos()[1] - 1)
            || (newPos[1] == super.getPos()[1] + 2 && newPos[0] == super.getPos()[0] + 1)
            || (newPos[1] == super.getPos()[1] - 2 && newPos[0] == super.getPos()[0] + 1)
            || (newPos[1] == super.getPos()[1] + 2 && newPos[0] == super.getPos()[0] - 1)
            || (newPos[1] == super.getPos()[1] - 2 && newPos[0] == super.getPos()[0] - 1); 
    return legalMove && super.isAlive();
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
    return !pieceOnPos && this.reachable(newPos);
  }
  /*
  public String getType(){
    return "KNIGHT";
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
  */


}
