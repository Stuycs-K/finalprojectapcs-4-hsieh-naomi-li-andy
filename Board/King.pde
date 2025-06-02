public class King extends Piece{
  private boolean canCastle;
  
  public King(int[] position, boolean shinySide){
    super.setAlive(true);
    super.setPos(position);
    super.setType("KING");
    super.setCheck(false);
    super.setSide(shinySide);
    canCastle = false;
    super.setHasMoved(false);
  //  super.setIsCastlingLeft(false);
  //  super.setIsCastlingRight(false);
  }
  
 
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    for (int col = 0; col < 8; col++){
      for (int row = 0; row < 8; row++){
        if (this.reachable(new int[] {col, row}) && this.canMove(new int[] {col, row})){
          toReturn.add(new int[] {col, row});
        }
      }
    }
    int[] castling = castle();
    if(!castling.equals(new int[0])){
      toReturn.add(castling);
    }
    return toReturn;
  }
  
  public boolean reachable(int[] newPos){
    if(!super.isAlive()){
      return false;
    }
    for(int i = -1; i <= 1; i++){
      for(int j = -1; j <= 1; j++){
        if(!(i == 0 && j == 0) && newPos[0] == super.getPos()[0] + i && newPos[1] == super.getPos()[1] + j){
          return true;
        }
        if(!(i == 0 && j == 0) && newPos[0] == super.getPos()[0] + j && newPos[1] == super.getPos()[1] + i){
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean canMove(int[] newPos){
    Piece temp;
    for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
      temp = Board.pieces.get(i);
      if(temp.isAlive() && temp.getPos()[0] == newPos[0] && temp.getPos()[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
        return false;
      }
      if(temp.side() != super.side() && temp.isAlive()){
        if(temp.getType().equals("KING") || temp.getType().equals("KNIGHT")){
            if(temp.reachable(newPos)){
              return false;
              
            }
         }
        else{
            if(temp.legalMovesContains(newPos)){
              return false;
            }
        }
        
      }
    }
    return this.reachable(newPos); 
  }
  
  
  
  
  public int[] castle(){
    Piece leftRook= null;
    Piece rightRook = null;
    boolean rightSide = true;
    boolean leftSide = true;
    if(!this.side()){
      for(int i = 0; i < white.size(); i++){ //gets rooks for the white side & checks if respective positions are empty
        if(white.get(i).getType().equals("ROOK") && white.get(i).getPos().equals(new int[]{0, 7})){
          leftRook = white.get(i);
        }
        else if(white.get(i).getType().equals("ROOK") && white.get(i).getPos().equals(new int[]{7, 7})){
          rightRook = white.get(i);
        }
        
        if(white.get(i).getPos().equals(new int[]{5,7}) || white.get(i).getPos().equals(new int[]{6,7})){
          rightSide = false;
        }
        if(white.get(i).getPos().equals(new int[]{3,7}) || white.get(i).getPos().equals(new int[]{2,7}) || white.get(i).getPos().equals(new int[]{1,7})){
          leftSide = false;
        }
      }
      for(int i = 0; i < black.size(); i++){ // checks if any of the places in between are being attacked & checks if respective positions are empty
        if(black.get(i).canCapture(new int[]{5, 7}) || black.get(i).canCapture(new int[]{6, 7})){
          rightSide = false;
        }
        if(black.get(i).canCapture(new int[]{3, 7}) || black.get(i).canCapture(new int[]{2, 7}) || black.get(i).canCapture(new int[]{1, 7})){
          leftSide = false;
        }
        
        if(black.get(i).getPos().equals(new int[]{5, 7}) || black.get(i).getPos().equals(new int[]{6, 7})){
          rightSide = false;
        }
        if(black.get(i).getPos().equals(new int[]{3, 7}) || black.get(i).getPos().equals(new int[]{2, 7}) || black.get(i).getPos().equals(new int[]{1, 7})){
          leftSide = false;
        }
      }
      if(leftSide && leftRook != null && !super.getCheckStatus() && leftRook.castleStatus()){
          return new int[]{2, 7};
      }
      if(rightSide && rightRook != null && !super.getCheckStatus() && rightRook.castleStatus()){
          return new int[]{6, 7};
      }
      
    }
    else{
       for(int i = 0; i < black.size(); i++){ //gets rooks for the black side & checks if respective positions are empty
        if(black.get(i).getType().equals("ROOK") && black.get(i).getPos().equals(new int[]{0, 0})){
          leftRook = black.get(i);
        }
        else if(black.get(i).getType().equals("ROOK") && black.get(i).getPos().equals(new int[]{7, 0})){
          rightRook = black.get(i);
        }
        
        if(black.get(i).getPos().equals(new int[]{5, 0}) || black.get(i).getPos().equals(new int[]{6, 0})){
          rightSide = false;
        }
        if(black.get(i).getPos().equals(new int[]{3, 0}) || black.get(i).getPos().equals(new int[]{2, 0}) || black.get(i).getPos().equals(new int[]{1, 0})){
          leftSide = false;
        }
      }
      for(int i = 0; i < white.size(); i++){ // checks if any of the places in between are being attacked & checks if respective positions are empty
        if(white.get(i).canCapture(new int[]{5, 0}) || white.get(i).canCapture(new int[]{6, 0})){
          rightSide = false;
        }
        if(white.get(i).canCapture(new int[]{3, 0}) || white.get(i).canCapture(new int[]{2, 0}) || white.get(i).canCapture(new int[]{1, 0})){
          leftSide = false;
        }
        
        if(white.get(i).getPos().equals(new int[]{5, 0}) || white.get(i).getPos().equals(new int[]{6, 0})){
          rightSide = false;
        }
        if(white.get(i).getPos().equals(new int[]{3, 0}) || white.get(i).getPos().equals(new int[]{2, 0}) || white.get(i).getPos().equals(new int[]{1, 0})){
          leftSide = false;
        }
      }
      if(leftSide && leftRook != null && !super.getCheckStatus() && leftRook.castleStatus()){
          return new int[]{2, 0};
      }
      if(rightSide && rightRook != null && !super.getCheckStatus() && rightRook.castleStatus()){
          return new int[]{6, 0};
      } 
    }
    return new int[0];
  }
  
  public void applyCheck(boolean checkStatus){
    if (this.side()){
      for (int count = 0; count < Board.black.size(); count++){
        Piece temp = black.get(count);
        temp.setCheck(checkStatus);
        temp.setKing(this);
        temp.setCheckingPiece(super.getCheckingPiece());
      }
    }
    else{
      for (int count = 0; count < Board.white.size(); count++){
        Piece temp = white.get(count);
        temp.setCheck(checkStatus);
        temp.setKing(this);
        temp.setCheckingPiece(super.getCheckingPiece());
      }
    }
  }
  
  /* 
  public String getType(){
    return "KING";
  }
 
  public int[] getPos(){
      return position;
  }
  
  public boolean side(){
      return shinySide;
  }
  */
  public boolean castleStatus(){
    return canCastle;
  }
  
  public void setCanCastle(boolean castle){
    canCastle = castle;
  }
}
