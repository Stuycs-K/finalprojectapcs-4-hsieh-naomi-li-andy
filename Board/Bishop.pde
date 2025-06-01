public class Bishop extends Piece{
  
  public Bishop(int[] position, boolean shinySide, King king){
    super.setAlive(true);
    super.setPos(position);
    super.setType("BISHOP");
    super.setCheck(false); // maybe change this to king only after everything works for runtime 
    super.setSide(shinySide);
    super.setKing(king);
  }
  
  public boolean legalMovesContains(int[] newPos){
    if(!super.isAlive()){
      return false;
    }
    System.out.println("running inherited");
    int originalPosX = this.getPos()[0];
    int originalPosY = this.getPos()[1];
    int currPosX = originalPosX;
    int currPosY = originalPosY;
    boolean canContinue = true;
    while (currPosX <= 7 && currPosY >= 0 && canContinue){
      currPosX += 1;
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
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX >= 0 && currPosY >= 0 && canContinue){
      currPosX -= 1;
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
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX <= 7 && currPosY <= 7 && canContinue){
      currPosX += 1;
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
    while (currPosX >= 0 && currPosY <= 7 && canContinue){
      currPosX -= 1;
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
    return false;
  }
  
  public ArrayList<int[]> getLegalMoves(){
    ArrayList<int[]> toReturn = new ArrayList<int[]>();
    int originalPosX = this.getPos()[0];
    int originalPosY = this.getPos()[1];
    int currPosX = originalPosX;
    int currPosY = originalPosY;
    boolean canContinue = true;
    while (currPosX <= 7 && currPosY >= 0 && canContinue){
      currPosX += 1;
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
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX >= 0 && currPosY >= 0 && canContinue){
      currPosX -= 1;
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
    canContinue = true;
    currPosX = originalPosX;
    currPosY = originalPosY;
    while (currPosX <= 7 && currPosY <= 7 && canContinue){
      currPosX += 1;
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
    while (currPosX >= 0 && currPosY <= 7 && canContinue){
      currPosX -= 1;
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
    return toReturn;
  }
  
  
  public boolean reachable(int[] newPos){
    return (newPos[1] - super.getPos()[1]) / (newPos[0] - super.getPos()[0]) == 1 ||
    (newPos[1] - super.getPos()[1]) / (newPos[0] - super.getPos()[0]) == -1;
  }
  
  public boolean canMove(int[] newPos){
   boolean pieceOnPos = false;
   int[] temp = new int[2];
   if (Board.turnNumber % 2 == 1){
     for(int i = 0; i < Board.white.size(); i++){
       temp = Board.pieces.get(i).getPos();
       if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
         pieceOnPos = true;
       }
      }
   }
   else{
     for(int i = 0; i < Board.black.size(); i++){
       temp = Board.pieces.get(i).getPos();
       if(temp[0] == newPos[0] && temp[1] == newPos[1] && (Board.pieces.get(i).side() == this.side())){
         pieceOnPos = true;
       }
      }
   }
    return !pieceOnPos && this.reachable(newPos) && super.checkChecker(newPos);
  }
  /*
  public String getType(){
    return "BISHOP";
  }
  
  public int[] getPos(){
      return position;
  }
  
  public boolean side(){
      return shinySide;
  }
  */
  
  public void applyCheck(King other){}

}
