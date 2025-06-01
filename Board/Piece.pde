public abstract class Piece{
  private boolean alive;
  private int[] position;
  private String type;
  private boolean inCheck;
  private boolean shinySide;
  private King king;
  private Piece checkingPiece; 
  
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
   System.out.println("white:"+Board.whiteInCheck);
   System.out.println("black:"+Board.blackInCheck);
    boolean contains = false;
    if(getType().equals("KING")){
      contains = this.canMove(newPos);
    }
    else{
      for(int[] i : this.getLegalMoves()){
    //  System.out.println(Arrays.toString(i));
      if(i[0] == newPos[0] && i[1] == newPos[1]){
        contains = true;
      }
    }
    }
    
    System.out.println(Arrays.toString(newPos));
    
    if(contains){
      if(getCheckStatus()){
        King temp = king;
        applyCheck(king, false);
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
              }
              this.setPos(originalPos);
              return false;
            }
          }
        }
      }
      
      if(!this.getType().equals("KING")){
      }
//      this.capture();
      System.out.println("moving in func");
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
  
  public boolean canCapture(Piece other){
    //System.out.println("calling canCapture for " + this.getType());
    return this.reachable(other.getPos());
  }
  
  
  public void applyCheck(King other, boolean checkStatus){
    if(this.canCapture(other)){
       other.applyCheck(checkStatus);
       other.setCheckingPiece(this);
    }
  }
  
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
  
  public boolean getCanBeEnPassanted(){
    return false;
  }
  
  public void setCanBeEnPassanted(boolean canBe){}
  
}
