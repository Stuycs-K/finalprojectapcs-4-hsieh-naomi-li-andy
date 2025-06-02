public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private King king;
  private Piece checkingPiece; 
  
  public String namingConvention(){
    if (this.getType().equals("KING")){
      return "K";
    }
    if (this.getType().equals("KNIGHT")){
      return "N";
    }
    if (this.getType().equals("ROOK")){
      return "R";
    }
    if (this.getType().equals("BISHOP")){
      return "B";
    }
    else{
      return "";
    }
  }
  
  public Piece capture(){ // needs to be corrected (edit: seems to work for pawn capturing)
    if (this.side()){
      for (int count = 0; count < white.size(); count++){
        if (white.get(count).getPos()[0] == this.getPos()[0] && white.get(count).getPos()[1] == this.getPos()[1]){
          white.remove(count);
        }
      }
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == this.getPos()[0] && pieces.get(count).getPos()[1] == this.getPos()[1]){
          if (pieces.get(count).side() == false){
            return pieces.remove(count);
          }
        }
      }
    }
    else{
      for (int count = 0; count < black.size(); count++){
        if (black.get(count).getPos()[0] == this.getPos()[0] && black.get(count).getPos()[1] == this.getPos()[1]){
          black.remove(count);
        }
      }
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == this.getPos()[0] && pieces.get(count).getPos()[1] == this.getPos()[1]){
          if (pieces.get(count).side() == true){
            return pieces.remove(count);
          }
        }
      }
    }
    return null;
  }

  public boolean move(int[] newPos){
   // System.out.println("trying to move");

    boolean contains = false;
    if(getType().equals("KING")){
      contains = this.canMove(newPos);
   //   System.out.println("running castle check");
      Piece leftRook= null;
      Piece rightRook = null;
      boolean rightSide = true;
      boolean leftSide = true;

       if (!this.side()) {
      //   System.out.println("white");
      for (int i = 0; i < white.size(); i++) { //gets rooks for the white side & checks if respective positions are empty
  //    System.out.println("looping");
     // System.out.println(leftSide + " " + rightSide);
    //  System.out.println(Arrays.toString(white.get(i).getPos()));
        if (white.get(i).getType().equals("ROOK") && white.get(i).getPos()[0] == 0 && white.get(i).getPos()[1] == 7) {
          leftRook = white.get(i);
        } else if (white.get(i).getType().equals("ROOK") && white.get(i).getPos()[0] == 7 && white.get(i).getPos()[1] == 7) {
          rightRook = white.get(i);
        }

        if (white.get(i).getPos()[0] == 5 && white.get(i).getPos()[1] == 7 || white.get(i).getPos()[0] == 6 && white.get(i).getPos()[1] == 7) {
          rightSide = false;
        //  System.out.println("can't castle to the right");
        }
        if (white.get(i).getPos()[0] == 3 && white.get(i).getPos()[1] == 7 || white.get(i).getPos()[0] == 2 && white.get(i).getPos()[1] == 7 || white.get(i).getPos()[0] == 1 && white.get(i).getPos()[1] == 7) {
          leftSide = false;
       //   System.out.println("can't castle to the left");
        }
      }
      for (int i = 0; i < black.size(); i++) { // checks if any of the places in between are being attacked & checks if respective positions are empty
      if(!(black.get(i).getType().equals("PAWN") || black.get(i).getType().equals("KING"))){
        if (black.get(i).canCapture(new int[]{5, 7}) || black.get(i).canCapture(new int[]{6, 7})) {
          rightSide = false;
        //  System.out.println("can't castle to the right");
        }
        if (black.get(i).canCapture(new int[]{3, 7}) || black.get(i).canCapture(new int[]{2, 7})) {
          leftSide = false;
       //   System.out.println("can't castle to the left");
        }

        if (black.get(i).getPos()[0] == 5 && black.get(i).getPos()[1] == 7 || black.get(i).getPos()[0] == 6 && black.get(i).getPos()[1] == 7) {
          rightSide = false;
        //  System.out.println("can't castle to the right");
        }
        if (black.get(i).getPos()[0] == 3 && black.get(i).getPos()[1] == 7 || black.get(i).getPos()[0] == 2 && black.get(i).getPos()[1] == 7 || black.get(i).getPos()[0] == 1 && black.get(i).getPos()[1] == 7) {
          leftSide = false;
        //  System.out.println("can't castle to the left");
        }
      }
      }
      if (leftSide && leftRook != null && !whiteInCheck && leftRook.castleStatus()) {
        if(newPos[0] == 2 && newPos[1] == 7){
        //  System.out.println("castling to the left");
          contains = true;
          leftRook.setPos(new int[]{3, 7});
        }
      }
      if (rightSide && rightRook != null && !whiteInCheck && rightRook.castleStatus()) {
        if(newPos[0] == 6 && newPos[1] == 7){
          
         // System.out.println("castling to the right");
          contains = true;
          rightRook.setPos(new int[]{5, 7});
        }
      }
    } else {
   //   System.out.println("black");
      for (int i = 0; i < black.size(); i++) { //gets rooks for the black side & checks if respective positions are empty
        if (black.get(i).getType().equals("ROOK") && black.get(i).getPos()[0] == 0 && black.get(i).getPos()[1] == 0) {
          leftRook = black.get(i);
        } else if (black.get(i).getType().equals("ROOK") && black.get(i).getPos()[0] == 7  && black.get(i).getPos()[1] == 0) {
          rightRook = black.get(i);
        }

        if (black.get(i).getPos()[0] == 5 && black.get(i).getPos()[1] == 0 || black.get(i).getPos()[0] == 6 && black.get(i).getPos()[1] == 0) {
          rightSide = false;
        //  System.out.println("can't castle to the right");
        }
        if (black.get(i).getPos()[0] == 3 && black.get(i).getPos()[1] == 0 || black.get(i).getPos()[0] == 2 && black.get(i).getPos()[1] == 0 || black.get(i).getPos()[0] == 1 && black.get(i).getPos()[1] == 0) {
          leftSide = false;
        //  System.out.println("can't castle to the left");
        }
      }
      for (int i = 0; i < white.size(); i++) { // checks if any of the places in between are being attacked & checks if respective positions are empty
        if (!(white.get(i).getType().equals("PAWN") || white.get(i).getType().equals("KING"))) {
          if (white.get(i).canCapture(new int[]{5, 0}) || white.get(i).canCapture(new int[]{6, 0})) {
            rightSide = false;
          //  System.out.println("can't castle to the right");
          }
          if (white.get(i).canCapture(new int[]{3, 0}) || white.get(i).canCapture(new int[]{2, 0})) {
            leftSide = false;
          //  System.out.println("can't castle to the left");
          }

          if (white.get(i).getPos()[0] == 5 && white.get(i).getPos()[1] == 0 || white.get(i).getPos()[0] == 6 && white.get(i).getPos()[1] == 0) {
            rightSide = false;
           // System.out.println("can't castle to the right");
          }
          if (white.get(i).getPos()[0] == 3 && white.get(i).getPos()[1] == 0 || white.get(i).getPos()[0] == 2 && white.get(i).getPos()[1] == 0 || white.get(i).getPos()[0] == 1 && white.get(i).getPos()[1] == 0) {
            leftSide = false;
           // System.out.println("can't castle to the left");
          }
        }
      }
      if (leftSide && leftRook != null && !blackInCheck && leftRook.castleStatus()) {
        if(newPos[0] == 2 && newPos[1] == 0){
          contains = true;
          leftRook.setPos(new int[]{3, 0});
        }
      }
      if (rightSide && rightRook != null && !blackInCheck && rightRook.castleStatus()) {
        if(newPos[0] == 6 && newPos[1] == 0){
          contains = true;
          rightRook.setPos(new int[]{5, 0});
        }
      }
    }
   // System.out.println("Castle check finished. Left side check: " + leftSide + " Rook null? " + (leftRook == null) + " Right side check: " + rightSide  + " Rook null? " + (rightRook == null));
    
    }
    

    
    else{
      for(int[] i : this.getLegalMoves()){
    //  System.out.println(Arrays.toString(i));
      if(i[0] == newPos[0] && i[1] == newPos[1]){
        contains = true;
      }
    }
    }
    
    
    if(contains){
      if(this.getType().equals("ROOK")){
        this.setCastleStatus(false);
      }
      if(getCheckStatus()){
        King temp = king;
       // applyCheck(king, false);
      }
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
      blackInCheck = false;
      whiteInCheck = false;
      System.out.println(this.Pos

      int[] kingPos = new int[] {9, 9};
      
      if (this.side()){
        try{
          kingPos = white.get(1).getKing().getPos();
        }catch (NullPointerException e){
          
        }
        for (int i = 0; i < black.size(); i++){
          if (black.get(i).canCapture(kingPos)){
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
                             try{
               kingPos = white.get(1).getKing().getPos();}
               catch (Exception e){}
              if (black.get(thirdIncrement).canCapture(kingPos)){
                isItOverIII = true;
              }
              thirdIncrement++;
            }
            if (taken != null){
              black.add(taken);
              pieces.add(taken);
            }
            savior.setPos(origPos);
            if (isItOverIII == false){
              isItOverII = false;
              isItOver = false;
            }
          }
        }
         if (isItOver){
           if (blackInCheck || whiteInCheck){
          System.out.println("checkmate: black wins");}
          else{
            System.out.println("Stalemate");
          }
         checkmated = true;
        }

      }
      
    else if (!this.side()){
        try{
          kingPos = black.get(1).getKing().getPos();
        }catch (NullPointerException e){
          
        }
        for (int i = 0; i < white.size(); i++){
          if (white.get(i).canCapture(kingPos)){
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
                             try{
               kingPos = black.get(1).getKing().getPos();}
               catch (Exception e){}
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
           if (blackInCheck || whiteInCheck){
          System.out.println("checkmate: white wins");}
          else{
            System.out.println("Stalemate");
          }
         checkmated = true;
        }
      
      }
      
      return true;
    }
    return false;
  }
  
  public void capture(Piece other, int[] newPos){
    if(canMove(newPos) && other.getPos().equals(newPos) && other.side() != this.side()){
        other.setAlive(false);
    } 
  }
  public boolean legalMovesContains(int[] newPos){
    return false;
  }
  
  public abstract boolean canMove(int[] newPos);
  
  public boolean canCapture(int[] otherPos){
    //System.out.println("calling canCapture for " + this.getType());
    ArrayList<int[]> legalMoves = this.getLegalMoves();
    for (int i = 0; i < legalMoves.size(); i++){
      if (legalMoves.get(i)[0] == otherPos[0] && legalMoves.get(i)[1] == otherPos[1]){
        return true;
      }
    }
    return false;
  }
  

  
  /*
  public void applyCheck(King other, boolean checkStatus){
    if(this.canCapture(other)){
       other.applyCheck(checkStatus);
       other.setCheckingPiece(this);
    }
  }*/
  
  public abstract boolean reachable(int[] newPos);
  
  public abstract ArrayList<int[]> getLegalMoves();
  
  public boolean isAlive(){
      return alive;
  }
  
  public void setAlive(boolean life){
      alive = life;
  }
  
  public int[] getPos(){
      return position;
  }
  
  public void setPos(int[] newPos){
      position = new int[2];
      position[0] = newPos[0];
      position[1] = newPos[1];
  }
  
  public String getType(){
      return type;
  }
  
  public void setType(String type){
    this.type = type;
  }
  
  public boolean getCheckStatus(){
      return inCheck; 
  }
  
  public void setCheck(boolean status){
      this.inCheck = status;
  }
  
  public boolean side(){
      return shinySide;
  }
  
   public void setSide(boolean side){
      shinySide = side;
  }
  
  public void setKing(King king){
      this.king = king;
  }
  
  public Piece getKing(){
      return king;
  }
  
  public void setCheckingPiece(Piece attacker){
      checkingPiece = attacker;
  }
  
  public Piece getCheckingPiece(){
      return checkingPiece;
  }
  /*
  public boolean checkChecker(int[] newPos){
     if(this.getCheckStatus()){
        int[] opos = this.getPos();
        this.setPos(newPos);
        if(newPos.equals(this.getCheckingPiece().getPos())){
           this.setPos(opos);
           return true;
        }
        else if(!this.getCheckingPiece().canCapture(this.getKing())){
          this.setPos(opos);
          return true;
        }
        else{
          return false;
        }
    }
    return true;
  }
  */
  
  public boolean getCanBeEnPassanted(){
    return false;
  }
  
  public void setCanBeEnPassanted(boolean canBe){}
  
  public boolean castleStatus(){
    return false;
  }
  
  public void setCastleStatus(boolean status){}
  
}
