public class Knight extends Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  
  public void move(int[] newPos){}
  
  public void capture(Piece other){}
  
  public boolean canMove(int[] newPos){}
  
  public boolean canCapture(int[] newPos){}
  
  public boolean canCapture(Piece other){}
  
  public void applyCheck(King other){}

}
