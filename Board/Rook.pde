public class Rook extends Piece{
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
  
  boolean castleStatus(){}
}
