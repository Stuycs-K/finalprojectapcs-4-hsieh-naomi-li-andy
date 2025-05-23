public class King extends Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private boolean canCastle;
  
  public void move(int[] newPos){
    if(canMove(newPos)){
      this.position = newPos;
    }
  }
  
  public void capture(Piece other){}
  
  public boolean canMove(int[] newPos){
    boolean willBeCaptured = false;
    boolean pieceOnPos = false;
    int[] temp = new int[2];
    for(int i = 0; i < Board.pieces.size(); i++){
      temp = Board.pieces.get(i).getPos();
      if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
        pieceOnPos = true;
      }
      if(Board.pieces.get(i).canCapture(this)){
        willBeCaptured = true;
      }
    }
    return !pieceOnPos && !willBeCaptured; 
  }
  
  public boolean canCapture(int[] newPos){}
  
  public boolean canCapture(Piece other){}
  
  public void applyCheck(King other){}
  
  public void castle(){}
  
  public void applyCheck(){}
  
  public boolean castleStatus(){}
}
