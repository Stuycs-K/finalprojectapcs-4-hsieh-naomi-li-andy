public class Rook extends Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private boolean canCastle;
  
  public void move(int[] newPos){}
  
  public void capture(Piece other){}
  
  public boolean canMove(int[] newPos){}
  
  public boolean canCapture(int[] newPos){}
  
  public boolean canCapture(Piece other){}
  
  public void applyCheck(King other){}
  
  public boolean castleStatus(){}
}
