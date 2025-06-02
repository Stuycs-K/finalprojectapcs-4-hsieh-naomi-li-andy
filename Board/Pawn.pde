public class Pawn extends Piece {
  private boolean firstMove;

  public Pawn(int[] position, boolean shinySide, King king) {
    super.setAlive(true);
    super.setPos(position);
    super.setType("PAWN");
    super.setCheck(false);
    super.setSide(shinySide);
    super.setKing(king);
    this.firstMove = true;
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
   // System.out.println(Arrays.toString(newPos));
    if (contains) {
      int[] originalPos = this.getPos();
      this.setPos(newPos);
      Piece original = this.capture();
           if (this.side()){
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
                pieces.add(original);
              }
              this.setPos(originalPos);
              return false;
            }
          }
        }
      }
      
      else{
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
                pieces.add(original);
              }
              this.setPos(originalPos);
              return false;
            }
          }
        }
      }
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
        int incrementer = 0;
        boolean isItOver = true;
        while (isItOver && incrementer < white.size()){ // isItOver checks if opposing side can make a move next turn (true means no); loops through all of opposing pieces
          Piece savior = white.get(incrementer); 
          incrementer++;
          int secondIncrement = 0;
          ArrayList<int[]> legalMoves = savior.getLegalMoves();
          boolean isItOverII = true;
          while (isItOverII && secondIncrement < legalMoves.size()){ //isItOverII checks each legalMove of an opposing piece; returns true if none work
            int[] origPos = savior.getPos();
            savior.setPos(legalMoves.get(secondIncrement));
            secondIncrement++;
            Piece taken = savior.capture();
            boolean isItOverIII = false;        
            int thirdIncrement = 0;
            while (!isItOverIII && thirdIncrement < black.size()){ //isItOverIII checks if this side can capture the king next turn; returns false if ever a legal move
              if (black.get(thirdIncrement).canCapture(kingPos)){
                isItOverIII = true;
              }
              thirdIncrement++;
            }
            if (isItOverIII == false){
              isItOverII = false;
              isItOver = false;
            }
            if (taken != null){
              black.add(taken);
              pieces.add(taken);
            }
            savior.setPos(origPos);
          }
        }
         if (isItOver){
          System.out.println("checkmate: black wins");
         checkmated = true;
        }
        else{
          System.out.println("not over yet");
        }
      }
      
    else if (!this.side()){
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
        int incrementer = 0;
        boolean isItOver = true;
        while (isItOver && incrementer < black.size()){ // isItOver checks if opposing side can make a move next turn (true means no); loops through all of opposing pieces
          Piece savior = black.get(incrementer); 
          incrementer++;
          int secondIncrement = 0;
          ArrayList<int[]> legalMoves = savior.getLegalMoves();
          boolean isItOverII = true;
          while (isItOverII && secondIncrement < legalMoves.size()){ //isItOverII checks each legalMove of an opposing piece; returns true if none work
            int[] origPos = savior.getPos();
            savior.setPos(legalMoves.get(secondIncrement));
            secondIncrement++;
            Piece taken = savior.capture();
            boolean isItOverIII = false;        
            int thirdIncrement = 0;
            while (!isItOverIII && thirdIncrement < white.size()){ //isItOverIII checks if this side can capture the king next turn; returns false if ever a legal move
              if (white.get(thirdIncrement).canCapture(kingPos)){
                isItOverIII = true;
              }
              thirdIncrement++;
            }
            if (isItOverIII == false){
              isItOverII = false;
              isItOver = false;
            }
            if (taken != null){
              white.add(taken);
              pieces.add(taken);
            }
            savior.setPos(origPos);
          }
        }
         if (isItOver){
          System.out.println("checkmate: white wins");
         checkmated = true;
        }
        else{
          System.out.println("not over yet");
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

}
