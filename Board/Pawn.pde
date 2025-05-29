public class Pawn extends Piece{
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private boolean firstMove;
  
  public Pawn(int[] position, boolean shinySide){
    super.setAlive(true);
    this.position = position;
    this.type = "PAWN";
    super.setCheckStatus(false);
    this.shinySide = shinySide;
    firstMove = true;
  }
  
  public void capture(Piece other){}
  
   public boolean move(int[] newPos){
    boolean contains = false;
    for(int[] i : this.getLegalMoves()){
      System.out.println(Arrays.toString(i));
      if(i[0] == newPos[0] && i[1] == newPos[1]){
        contains = true;
      }
    }
    System.out.println(Arrays.toString(newPos));
    if(contains){
      this.position = newPos;
      firstMove = false;
      System.out.println("moving in func");
      for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
        if(pieces.get(i).getPos().equals(newPos)){
             capture(pieces.get(i), newPos);
        }
      }
      return true;
    }
    return false;
  }
  
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
  //  if(newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] - 1) System.out.println("New x: " + newPos[0] + " New y: " + newPos[1] + " Old x: " + this.getPos()[0] + " Old y: " + this.getPos()[1]);
    boolean legalMove = false;
    if(this.side()){
      legalMove = newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] + 1;
      if(firstMove){
        legalMove = legalMove || newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] + 2;
      }
    }
    else{
      legalMove = newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] - 1;
      if(firstMove){
        legalMove = legalMove || newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] - 2;
      }
    }
    return (legalMove && this.canMove(newPos));
  }
  
  public boolean canMove(int[] newPos){
   boolean pieceOnPos = false;
   int[] temp = new int[2];
   for(int i = 0; i < Board.white.size() + Board.black.size() && !pieceOnPos; i++){
     temp = Board.pieces.get(i).getPos();
     if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
       System.out.println("oh no a piece");
       System.out.println(Board.pieces.get(i).getType());
       System.out.println(Arrays.toString(temp) + " " + Arrays.toString(newPos));
       pieceOnPos = true;
     }
    }
    return !pieceOnPos && !inCheck;
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
