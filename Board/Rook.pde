public class Rook extends Piece{
  private boolean canCastle;
  
  public Rook(int[] position, boolean shinySide, King king){
    super.setAlive(true);
    super.setPos(position);
    super.setType("ROOK");
    super.setCheck(false);
    super.setSide(shinySide);
    super.setKing(king);
    canCastle = true;
  }
  
  public boolean legalMovesContains(int[] newPos){
    if(!super.isAlive()){
      return false;
    }
    int originalPosX = this.getPos()[0];
    int originalPosY = this.getPos()[1];
    int currPosX = originalPosX;
    int currPosY = originalPosY;
    boolean canContinue = true;
    while (currPosX <= 7 && canContinue){
      currPosX += 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
             if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
          }
        }
      }
      if (canContinue){
         if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX >= 0 && canContinue){
      currPosX -= 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
             if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
          }
        }
      }
      if (canContinue){
         if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosY <= 7 && canContinue){
      currPosY += 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
             if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
          }
        }
        
      }
      if (canContinue){
         if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosY >= 0 && canContinue){
      currPosY -= 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
             if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
          }
        }
        
      }
      if (canContinue){
         if(newPos[0] == currPosX && newPos[1] == currPosY){
              return true;
            }
      }
    }
    return false;
  }
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    int originalPosX = this.getPos()[0];
    int originalPosY = this.getPos()[1];
    int currPosX = originalPosX;
    int currPosY = originalPosY;
    boolean canContinue = true;
    while (currPosX <= 7 && canContinue){
      currPosX += 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
            toReturn.add(new int[] {currPosX, currPosY});
          }
        }
      }
      if (canContinue){
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX >= 0 && canContinue){
      currPosX -= 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
            toReturn.add(new int[] {currPosX, currPosY});
          }
        }
      }
      if (canContinue){
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosY <= 7 && canContinue){
      currPosY += 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
            toReturn.add(new int[] {currPosX, currPosY});
          }
        }
        
      }
      if (canContinue){
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosY >= 0 && canContinue){
      currPosY -= 1;
      for (int count = 0; count < pieces.size(); count++){
        if (pieces.get(count).getPos()[0] == currPosX && pieces.get(count).getPos()[1] == currPosY){
          canContinue = false;
          if (pieces.get(count).side() != this.side()){
            toReturn.add(new int[] {currPosX, currPosY});
          }
        }
        
      }
      if (canContinue){
        toReturn.add(new int[] {currPosX, currPosY});
      }
    }
    return toReturn;
  }
  
  public boolean reachable(int[] newPos){
    return newPos[0] == this.getPos()[0] || newPos[1] == this.getPos()[1];
  }
  
  
  public boolean canMove(int[] newPos){
   boolean pieceOnPos = false;
   int[] temp = new int[2];
   for(int i = 0; i < Board.white.size() + Board.black.size(); i++){
     temp = Board.pieces.get(i).getPos();
     if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
       pieceOnPos = true;
     }
    }
    return !pieceOnPos && this.reachable(newPos) ;//&& super.checkChecker(newPos);
  }
  /*
  public String getType(){
    return "ROOK";
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
  
  public void setCastleStatus(boolean status){
    canCastle = status;
  }
}
