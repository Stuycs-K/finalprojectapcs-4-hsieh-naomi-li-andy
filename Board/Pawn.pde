public class Pawn extends Piece {
  private boolean firstMove;

  public Pawn(int[] position, boolean shinySide) {
    super.setAlive(true);
    super.setPos(position);
    super.setType("PAWN");
    super.setCheck(false);
    super.setSide(shinySide);
    this.firstMove = true;
  }

  public void capture() { // needs to be corrected (edit: seems to work for pawn capturing)
    if (this.side()) {
      for (int count = 0; count < white.size(); count++) {
        if (white.get(count).getPos()[0] == this.getPos()[0] && white.get(count).getPos()[1] == this.getPos()[1]) {
          white.remove(count);
        }
      }
    } else {
      for (int count = 0; count < black.size(); count++) {
        if (black.get(count).getPos()[0] == this.getPos()[0] && black.get(count).getPos()[1] == this.getPos()[1]) {
          black.remove(count);
        }
      }
    }
  }

  public boolean move(int[] newPos) {
    boolean contains = false;
    for (int[] i : this.getLegalMoves()) {
   //   System.out.println(Arrays.toString(i));
      if (i[0] == newPos[0] && i[1] == newPos[1]) {
        contains = true;
      }
    }
   // System.out.println(Arrays.toString(newPos));
    if (contains) {
      super.setPos(newPos);
      this.capture();
      firstMove = false;
  //    System.out.println("moving in func");
      for (int i = 0; i < Board.white.size() + Board.black.size(); i++) {
        if (pieces.get(i).getPos().equals(newPos)) {
          capture(pieces.get(i), newPos);
        }
      }
       int[] kingPos = new int[2];
      if (this.side()){
        for (int i = 0; i < white.size(); i++){
          if (white.get(i).getType().equals("KING")){
            kingPos = white.get(i).getPos();
          }
        }
        for (int i = 0; i < black.size(); i++){
          if (black.get(i).canCapture(kingPos)){
            System.out.println("check");
          }
        }
      }
      else{
        for (int i = 0; i < black.size(); i++){
          if (black.get(i).getType().equals("KING")){
            kingPos = black.get(i).getPos();
          }
        }
        for (int i = 0; i < white.size(); i++){
          if (white.get(i).canCapture(kingPos)){
            System.out.println("check");
          }
        }
      }
      return true;
    }
    return false;
  }

  public ArrayList<int[]> getLegalMoves() {
    //   System.out.println("calling getLegalMoves for pawn");
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    for (int col = 0; col < 8; col++) {
      for (int row = 0; row < 8; row++) {
        if (reachable(new int[] {col, row})) {
          toReturn.add(new int[] {col, row});
        }
      }
    }
    return toReturn;
  }


  public boolean reachable(int[] newPos) {
    //  System.out.println("calling reachable for pawn");
    //  if(newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] - 1) System.out.println("New x: " + newPos[0] + " New y: " + newPos[1] + " Old x: " + this.getPos()[0] + " Old y: " + this.getPos()[1]);
    boolean legalMove = false;
    if (this.side()) {
      legalMove = (newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] + 1);
      for (int count = 0; count < white.size(); count++) {
        if (white.get(count).getPos()[0] == newPos[0] && white.get(count).getPos()[1] == newPos[1]) {
          legalMove = false;
        }
      }
      if (firstMove) {
        legalMove = legalMove || newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] + 2;
      }
      for (int count = 0; count < white.size(); count++) {
        if (white.get(count).getPos()[0] == newPos[0] && white.get(count).getPos()[1] == newPos[1]) {
          legalMove = false;
        }
      }
      if (Math.abs(newPos[0] - this.getPos()[0]) == 1 && newPos[1] == this.getPos()[1] + 1) {
        for (int count = 0; count < white.size(); count++) {
          if (white.get(count).getPos()[0] == newPos[0] && white.get(count).getPos()[1] == newPos[1]) {
            legalMove = true;
          }
        }
      }
    } else {
      legalMove = newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] - 1;
      for (int count = 0; count < black.size(); count++) {
        if (black.get(count).getPos()[0] == newPos[0] && black.get(count).getPos()[1] == newPos[1]) {
          legalMove = false;
        }
      }
      if (firstMove) {
        legalMove = legalMove || newPos[0] == this.getPos()[0] && newPos[1] == this.getPos()[1] - 2;
      }
      for (int count = 0; count < black.size(); count++) {
        if (black.get(count).getPos()[0] == newPos[0] && black.get(count).getPos()[1] == newPos[1]) {
          legalMove = false;
        }
      }
      if (Math.abs(newPos[0] - this.getPos()[0]) == 1 && newPos[1] == this.getPos()[1] - 1) {
        for (int count = 0; count < black.size(); count++) {
          if (black.get(count).getPos()[0] == newPos[0] && black.get(count).getPos()[1] == newPos[1]) {
            legalMove = true;
          }
        }
      }
    }
    return (legalMove && this.canMove(newPos));
  }

  public boolean canMove(int[] newPos) {
    boolean pieceOnPos = false;
    int[] temp = new int[2];
    for (int i = 0; i < Board.white.size() + Board.black.size() && !pieceOnPos; i++) {
      temp = Board.pieces.get(i).getPos();
      if (temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())) {
        System.out.println("oh no a piece");
        System.out.println(Board.pieces.get(i).getType());
        System.out.println(Arrays.toString(temp) + " " + Arrays.toString(newPos));
        pieceOnPos = true;
      }
    }
    return !pieceOnPos && !super.getCheckStatus();
  }


/*
  public String getType() {
    return "PAWN";
  }

    public int[] getPos(){
   return position;
   }
   
   public boolean side(){
   return shinySide;
   }
   */
  public boolean getFirstMove() {
    return this.firstMove;
  }

}
