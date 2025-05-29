public class King extends Piece{
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private boolean canCastle;
  
  public King(int[] position, boolean shinySide){
    super.setAlive(true);
    this.position = position;
    type = "KING";
    super.setCheckStatus(false);
    this.shinySide = shinySide;
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
    for(int i = -1; i <= 1; i++){
      for(int j = -1; j <= 1; j++){
        if(!(i == 0 && j == 0) && newPos[0] == this.position[0] + i && newPos[1] == this.position[1] + j){
          return true;
        }
        if(!(i == 0 && j == 0) && newPos[0] == this.position[0] + j && newPos[1] == this.position[1] + i){
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean canMove(int[] newPos){
    boolean willBeCaptured = false;
    boolean pieceOnPos = false;
    int[] temp = new int[2];
    for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
      temp = Board.pieces.get(i).getPos();
      if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
        pieceOnPos = true;
      }
      if(Board.pieces.get(i).canCapture(this)){
        willBeCaptured = true;
      }
    }
    return !pieceOnPos && !willBeCaptured && this.reachable(newPos); 
  }
  
 
  
  public void applyCheck(King other){}
  
  public void castle(){}
  
  public void applyCheck(){}
  
  public String getType(){
    return "KING";
  }
  
  public int[] getPos(){
      return position;
  }
  
  public boolean side(){
      return shinySide;
  }
  
  public boolean castleStatus(){
    return canCastle;
  }
}
