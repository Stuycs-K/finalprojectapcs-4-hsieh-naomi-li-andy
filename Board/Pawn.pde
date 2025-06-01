public class Pawn extends Piece {
  private boolean firstMove;
  private boolean canBeEnPassanted;

  public Pawn(int[] position, boolean shinySide, King king) {
    super.setAlive(true);
    super.setPos(position);
    super.setType("PAWN");
    super.setCheck(false);
    super.setSide(shinySide);
    super.setKing(king);
    this.setFirstMove(true);
    this.setCanBeEnPassanted(false);
  }
/*
  public Piece capture() { // needs to be corrected (edit: seems to work for pawn capturing)
    if (this.side()) {
      for (int count = 0; count < white.size(); count++) {
        if (white.get(count).getPos()[0] == this.getPos()[0] && white.get(count).getPos()[1] == this.getPos()[1]) {
          Piece temp = white.get(count);
          pieces.remove(temp);
          return white.remove(count);
        }
      }
    } else {
      for (int count = 0; count < black.size(); count++) {
        if (black.get(count).getPos()[0] == this.getPos()[0] && black.get(count).getPos()[1] == this.getPos()[1]) {
          Piece temp = black.get(count);
          pieces.remove(temp);
          return black.remove(count);
        }
      }
    }
    return null;
  }*/

  public boolean move(int[] newPos) {
   System.out.println("white:"+Board.whiteInCheck);
   System.out.println("black:"+Board.blackInCheck);
    boolean contains = false;
    for (int[] i : this.getLegalMoves()) {
   //   System.out.println(Arrays.toString(i));
      if (i[0] == newPos[0] && i[1] == newPos[1]) {
        contains = true;
      }
    }
    //En Passant Code
    if(this.side()){
      for(int i = 0; i < Board.white.size(); i++){
         if(Board.white.get(i).getType().equals("PAWN") && Board.white.get(i).getPos()[0] == newPos[0] && Board.white.get(i).getPos()[0] != this.getPos()[0] && Board.white.get(i).getPos()[1] == newPos[1] - 1 && Board.white.get(i).getCanBeEnPassanted()){
           contains = true;
           Board.white.remove(i);
         }
      }
    }
    else{
      for(int i = 0; i < Board.black.size(); i++){
      //  if(Board.black.get(i).getType().equals("PAWN") && Board.black.get(i).getPos()[0] == newPos[0] && Board.black.get(i).getPos()[0] != this.getPos()[0] && Board.black.get(i).getPos()[1] == newPos[1] + 1){System.out.println("pawnchecker");}
         if(Board.black.get(i).getType().equals("PAWN") && Board.black.get(i).getPos()[0] == newPos[0] && Board.black.get(i).getPos()[0] != this.getPos()[0] && Board.black.get(i).getPos()[1] == newPos[1] + 1 && Board.black.get(i).getCanBeEnPassanted()){
           contains = true;
           Board.black.remove(i);
         }
      }
    }
   // System.out.println(Arrays.toString(newPos));
    if (contains) {
      int[] originalPos = this.getPos();
      this.setPos(newPos);
      Piece original = this.capture();
      if (this.side()){
        System.out.println(Arrays.toString(originalPos) + " " + Arrays.toString(getPos()));
        if(originalPos[0] == this.getPos()[0] && originalPos[1] == this.getPos()[1] - 2){
          this.setCanBeEnPassanted(true);
        }
        if (true){
          int[] kingPos = new int[] {9, 9};
          try{
            kingPos = black.get(1).getKing().getPos();
          }catch (NullPointerException e){
          }
          for (int i = 0; i < white.size(); i++){
            if (white.get(i).canCapture(kingPos)){
              System.out.println("illegal");
              if (original != null){
                white.add(original);
              }
              this.setPos(originalPos);
              return false;
            }
          }
        }
      }
      
      else{
        System.out.println(Arrays.toString(originalPos) + " " + Arrays.toString(getPos()));
        if(originalPos[0] == this.getPos()[0] && originalPos[1] == this.getPos()[1] + 2){
          this.setCanBeEnPassanted(true);
        }
        if (true){
          int[] kingPos = new int[] {9, 9};
          try{
            kingPos = white.get(1).getKing().getPos();
          }catch (NullPointerException e){
          }
          for (int i = 0; i < black.size(); i++){
            if (black.get(i).canCapture(kingPos)){
              System.out.println("illegal");
              if (original != null){
                black.add(original);
              }
              this.setPos(originalPos);
              return false;
            }
          }
        }
      }
      System.out.println(getFirstMove() + " " + getCanBeEnPassanted());
      if(!this.getFirstMove()){
        this.setCanBeEnPassanted(false);
      }
      firstMove = false;
  //    System.out.println("moving in func");
            int[] kingPos = new int[] {9, 9};
      
      if (this.side()){
        try{
          kingPos = white.get(1).getKing().getPos();
        }catch (NullPointerException e){
          
        }
        for (int i = 0; i < black.size(); i++){
          if (black.get(i).canCapture(kingPos)){
            System.out.println("check");
            Board.whiteInCheck = true;
          }
        }
      }
      else{
        try{
          kingPos = black.get(1).getKing().getPos();
        }catch (NullPointerException e){
        }
        for (int i = 0; i < white.size(); i++){
          if (white.get(i).canCapture(kingPos)){
            System.out.println("check");
            Board.blackInCheck = true;
          }
        }
      }
      return true;
    }
    return false;
  }
  
  public boolean legalMovesContains(int[] newPos){
    if(super.side()){
      if(this.getPos()[0]-1 == newPos[0] && this.getPos()[1]+1 == newPos[1] || this.getPos()[0]+1 == newPos[0] && this.getPos()[1]+1 == newPos[1]){
         return true && super.isAlive();
      }
    }
    else{
      if(this.getPos()[0]-1 == newPos[0] && this.getPos()[1]-1 == newPos[1] || this.getPos()[0]+1 == newPos[0] && this.getPos()[1]-1 == newPos[1]){
         return true && super.isAlive();
      }
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
    return (legalMove && this.canMove(newPos) && super.checkChecker(newPos));
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
    return !pieceOnPos;
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
  
  public void setFirstMove(boolean first){
    this.firstMove = first;
  }
  
  public boolean getCanBeEnPassanted(){
    return this.canBeEnPassanted;
  }
  
  public void setCanBeEnPassanted(boolean canBe){
    this.canBeEnPassanted = canBe;
  }

}
