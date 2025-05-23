public class Bishop extends Piece{
   private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  
  public void capture(Piece other){}
  
  public boolean reachable(int[] newPos){
    return (newPos[0] == this.position[0] || newPos[1] == this.position[1] ||
    ((newPos[1] - this.position[1]) / (newPos[0] - this.position[0])) == 1 ||
     ((newPos[1] - this.position[1]) / (newPos[0] - this.position[0])) == -1);
  }
  
  public boolean canMove(int[] newPos){
   boolean pieceOnPos = false;
   int[] temp = new int[2];
   for(int i = 0; i < Board.pieces.size(); i++){
     temp = Board.pieces.get(i).getPos();
     if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
       pieceOnPos = true;
     }
    }
    return !pieceOnPos && this.reachable(newPos) && !inCheck;
  }
  
  
  public boolean canCapture(int[] newPos){}
  
  public boolean canCapture(Piece other){}
  
  public void applyCheck(King other){}

}
