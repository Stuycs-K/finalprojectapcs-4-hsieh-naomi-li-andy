public class Pawn extends Piece{
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  public Pawn(int[] position, boolean shinySide){
    super.setAlive(true);
    this.position = position;
    this.type = "PAWN";
    this.inCheck = false;
    this.shinySide = shinySide;
  }
  
  public void capture(Piece other){}
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    for (int col = 0; col < 8; col++){
      for (int row = 0; row < 8; row++){
         if (reachable(new int[] {col, row})){
            toReturn.add(new int[] {col, row});
         }
      }
    }
    return toReturn;
  }
  

  public boolean reachable(int[] newPos){
    return (newPos[0] == this.position[0] && newPos[1] == this.position[1] + 1 && this.canMove(newPos));
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
  
  
  public void applyCheck(King other){}
  
  public String getType(){
    return "PAWN";
  }
  
  public int[] getPos(){
      return position;
  }
  
  public boolean side(){
      return shinySide;
  }

}
