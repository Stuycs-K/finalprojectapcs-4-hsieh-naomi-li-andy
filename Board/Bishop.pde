public class Bishop extends Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  public Bishop(int[] position, boolean shinySide){
    this.alive = true;
    this.position = position;
    this.type = "BISHOP";
    this.inCheck = false; // maybe change this to king only after everything works for runtime 
    this.shinySide = shinySide;
  }
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    for (int row = 0; row < 8; row++){
      for (int col = 0; col < 8; col++){
         if (reachable(new int[] {row, col})){
            toReturn.add(new int[] {row, col});
         }
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
  
  public void applyCheck(King other){}

}
