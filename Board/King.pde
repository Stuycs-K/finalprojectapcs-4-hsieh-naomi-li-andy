public class King extends Piece{
<<<<<<< HEAD
  boolean alive;
  int[] position;
  String type;
  boolean inCheck;
  boolean shinySide;
  boolean canCastle;
  
  public void move(int[] newPos){}
  
  public void capture(Piece other){}
  
  boolean canMove(int[] newPos){}
  
  boolean canCapture(int[] newPos){}
  
  boolean canCapture(Piece other){}
  
  void applyCheck(King other){}
  
  boolean isAlive(){}
  
  int[] getPos(){}
  
  String getType(){}
  
  boolean getCheckStatus(){}
  
  void setCheckStatus(boolean status){}
  
  boolean side(){}
  
  void castle(){}
  
  void applyCheck(){}
  
  boolean castleStatus(){}
=======
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private boolean canCastle;
  
  
  public void capture(Piece other){}
  
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
    for(int i = 0; i < Board.pieces.size(); i++){
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
  
  public boolean canCapture(int[] newPos){}
  
  public boolean canCapture(Piece other){}
  
  public void applyCheck(King other){}
  
  public void castle(){}
  
  public void applyCheck(){}
  
  public boolean castleStatus(){}
>>>>>>> 81baaa0fedc750a9f613f9bd91e69aab60c42daa
}
