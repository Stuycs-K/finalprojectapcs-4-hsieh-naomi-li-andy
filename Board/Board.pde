import java.util.*;
import java.io.*;

static ArrayList<Piece> pieces = new ArrayList<Piece>(0);
static ArrayList<Piece> white = new ArrayList<Piece>(0);
static ArrayList<Piece> black = new ArrayList<Piece>(0);
static ArrayList<int[]> positions = new ArrayList<int[]>(0);
static boolean blackInCheck = false;
static boolean whiteInCheck = false;
static int turnNumber = 1;

boolean selectingPiece = true;
boolean pawnPromoting;
Piece selectedPiece;
Piece pawnBeingPromoted;

King wKing;
King bKing;

void gulpin(float x, float y, boolean shiny) {
  stroke(0);
  if (shiny) {
    fill(108, 186, 204);
  } else {
    fill(132, 194, 40);
  }
  circle(x, y, 64);

  ellipse(x+15, y+4, 20, 10);
  ellipse(x+15, y+12, 20, 10);
  if (shiny) {
    stroke(108, 186, 204);
  } else {
    stroke(132, 194, 40);
  }
  rect(x+3, y-2, 15, 25);
  stroke(0);
  strokeWeight(3);
  line(x+3, y-2, x+9, y-6);
  line(x+20, y-6, x+26, y-2);
  strokeWeight(2);
  if (shiny) {
    fill(255, 192, 103);
  } else {
    fill(255, 241, 100);
  }
  pushMatrix();
  translate(x-23, y-17);
  rotate(-PI/6);
  ellipse(0, 0, 30, 15);
  popMatrix();
}

void electrode(float x, float y, boolean shiny) {
  stroke(0);
  if (shiny) {
    fill(50, 130, 200);
  } else {
    fill(255, 0, 0);
  }
  circle(x, y, 64);
  if (shiny) {
    fill(255, 240, 255);
    stroke(255, 240, 255);
  } else {
    fill(240, 240, 240);
    stroke(255, 240, 255);
  }
  arc(x, y, 59, 59, PI, 2*PI);
  ellipse(x, y, 59, 13);
  arc(x+2, y+10, 30, 23, 0, PI);
  if (shiny) {
    stroke(50, 130, 200);
    fill(50, 130, 200);
  } else {
    stroke(255, 0, 0);
    fill(255, 0, 0);
  }
  ellipse(x+2, y+10, 30, 5);
  if (shiny) {
    fill(255, 240, 255);
    stroke(255, 240, 255);
  } else {
    fill(240, 240, 240);
    stroke(255, 240, 255);
  }
  ellipse(x, y, 59, 13);
  stroke(0);
  strokeWeight(0.5);
  line(x, y+21.5, x+1, y+19);
  line(x+7, y+21.5, x+9, y+17);
  strokeWeight(1);
  fill(0);
  ellipse(x-7, y-3, 2, 6);
  ellipse(x+13, y-3, 2, 6);
  line(x-13, y-10, x-5, y-5);
  line(x+19, y-10, x+11, y-5);
  noFill();
  strokeWeight(2);
  circle(x, y, 64);
}

void solosis(float x, float y, boolean shiny) {
  stroke(0);
  if (shiny) {
    fill(110, 170, 190);
  } else {
    fill(170, 230, 183);
  }
  circle(x, y, 64);
  if (shiny) {
    fill(155, 210, 170);
    stroke(155, 210, 170);
  } else {
    fill(200, 255, 220);
    stroke(200, 255, 220);
  }
  ellipse(x-10, y, 30, 35);
  ellipse(x+10, y, 30, 35);
  if (shiny) {
    stroke(110, 170, 190);
  } else {
    stroke(170, 230, 183);
  }
  line(x, y-13, x, y-20);
  line(x, y+13, x, y+20);
  if (shiny) {
    fill(255, 204, 153);
    stroke(155, 104, 53);
  } else {
    fill(255, 255, 153);
    stroke(155, 155, 53);
  }
  pushMatrix();
  translate(x+20, y-15);
  rotate(PI/12);
  ellipse(-3, 0, 10, 5);
  ellipse(-5, 5, 15, 7);
  popMatrix();
  stroke(0);
  fill(0);
  ellipse(x-13, y, 7, 10);
  ellipse(x+13, y, 7, 10);
  if (shiny) {
    stroke(220, 173, 170);
    fill(220, 173, 170);
  } else {
    stroke(255, 153, 170);
    fill(255, 153, 170);
  }

  quad(x, y-7, x+4, y, x, y+7, x-4, y);
}
/*void mew(float x, float y, boolean shiny){
 if(shiny){
 fill(135, 206, 235);
 }
 else{
 fill(255, 182, 193);
 }
 strokeWeight(2);
 stroke(0);
 pushMatrix();
 translate(x-12, y-12);
 rotate(-PI/3);
 ellipse(0, 0, 35, 45);
 popMatrix();
 pushMatrix();
 translate(x+14, y-12);
 rotate(PI/3);
 ellipse(0, 0, 35, 45);
 popMatrix();
 ellipse(x, y+12, 35, 45);
 ellipse(x, y, 70, 64);
 if(shiny){
 stroke(135, 206, 235);
 }
 else{
 stroke(255, 182, 193);
 }
 strokeWeight(1);
 ellipse(x, y+12, 30, 40);
 pushMatrix();
 translate(x-12, y-12);
 rotate(-PI/3);
 ellipse(0, 0, 30, 40);
 popMatrix();
 pushMatrix();
 translate(x+14, y-12);
 rotate(PI/3);
 ellipse(0, 0, 30, 40);
 popMatrix();
 strokeWeight(2);
 stroke(0);
 fill(255);
 ellipse(x-15, y, 15, 30);
 ellipse(x+15, y, 15, 30);
 fill(0);
 ellipse(x-12, y+3, 10, 20);
 ellipse(x+17, y+3, 10, 20);
 if(shiny){
 fill(61, 76, 153);
 }
 else{
 fill(51, 153, 255);
 }
 ellipse(x-12, y+3, 10, 15);
 ellipse(x+17, y+3, 10, 15);
 fill(255);
 strokeWeight(1);
 stroke(255);
 ellipse(x-10, y, 7, 5);
 ellipse(x+20, y, 7, 5);
 }*/

void spheal(float x, float y, boolean shiny) {
  stroke(0);
  if (shiny) {
    fill(203, 155, 211);
  } else {
    fill(156, 182, 240);
  }
  strokeWeight(2);
  stroke(0);
  pushMatrix();
  translate(x-25, y-25);
  rotate(-PI/3);
  circle(0, 0, 20);
  popMatrix();
  pushMatrix();
  translate(x+25, y-25);
  rotate(PI/3);
  circle(0, 0, 20);
  popMatrix();
  circle(x, y, 64);
  if (shiny) {
    stroke(248, 224, 217);
    fill(248, 224, 217);
  } else {
    stroke(242, 228, 200);
    fill(242, 228, 200);
  }
  ellipse(x, y+12, 54, 38);
  stroke(255);
  fill(255);
  triangle(x-14, y+5, x-10, y+5, x-12, y+10);
  triangle(x+14, y+5, x+10, y+5, x+12, y+10);
  if (shiny) {
    stroke(203, 155, 211);
    fill(203, 155, 211);
  } else {
    stroke(156, 182, 240);
    fill(156, 182, 240);
  }
  ellipse(x-9, y-5, 25, 20);
  ellipse(x+9, y-5, 25, 20);
  if (shiny) {
    stroke(203, 155, 211);
  } else {
    stroke(156, 182, 240);
  }
  rect(x-22, y-17, 45, 13, 28);
  rect(x-5, y-5, 5, 4, 28);
  
  fill(0);
  stroke(0);
  circle(x-12, y-10, 10);
  circle(x+12, y-10, 10);
  fill(255);
  circle(x-10, y-12, 6);
  circle(x+14, y-12, 6);
  noFill();
  circle(x, y, 64);
}

void piplup(float x, float y, boolean shiny) {
  stroke(0);
  if (shiny) {
    fill(10, 166, 178);
  } else {
    fill(68, 132, 190);
  }
  circle(x, y, 64);
  if (shiny) {
    fill(106, 234, 230);
    stroke(106, 234, 230);
  } else {
    fill(178, 209, 212);
    stroke(178, 209, 212);
  }
  rect(x-9, y-5, 18, 15);
  triangle(x-3, y-6, x+3, y-6, x, y-11);
  pushMatrix();
  translate(x-9, y-3);
  rotate(-PI/6);
  triangle(0, 0, 6, 0, 3, -5);
  popMatrix();
  pushMatrix();
  translate(x+4, y-6);
  rotate(PI/4);
  triangle(0, 0, 6, 0, 3, -5);
  popMatrix();
  fill(255);
  stroke(255);
  ellipse(x-17, y+3, 20, 35);
  ellipse(x+17, y+3, 20, 35);
  ellipse(x, y+17, 42, 25);
  if (shiny) {
    fill(232, 226, 139);
    stroke(232, 226, 139);
  } else {
    fill(242, 236, 139);
    stroke(242, 236, 139);
  }
  ellipse(x, y+7, 20, 17);
  stroke(186, 142, 35);
  noFill();
  arc(x+1, y+3, 30, 15, PI/3, 2*PI/3);
  stroke(0);
  fill(0);
  ellipse(x-17, y-2, 9, 15);
  ellipse(x+17, y-2, 9, 15);
  stroke(255);
  fill(255);
  ellipse(x-17, y-5, 3, 5);
  ellipse(x+17, y-5, 3, 5);
}

void rowlet(int x, int y) {
  //place 2d Primatives relative to x and y.

  // creates the head shape
  fill(224, 187, 141);
  ellipse(x, y + 40, 290, 300);
  noFill();
  noStroke();
  fill(255);
  circle(x - 40, y, 120);
  circle(x + 40, y, 120);
  // creates the nose

  stroke(0);
  fill(235, 166, 5);
  ellipse(x, y+11, 31, 60);
  fill(235);
  ellipse(x, y-4, 31, 65);
  noFill();
  arc(x-20, y+13, 45, 72, 0, 0.4);



  endShape(CLOSE);
  // creates the lower body
  noStroke();
  fill(255);
  ellipse(x, y + 140, 290, 100);
  noFill();
  stroke(0);
  ellipse(x, y + 40, 290, 300);
  //creates the leaves
  fill(76, 168, 96);
  stroke(0);
  beginShape();
  vertex(x, y+85);
  vertex(x, y+100);
  vertex(x-30, y+115);
  vertex(x-55, y+110);
  vertex(x-60, y+105);
  vertex(x-70, y+90);
  vertex(x-60, y+75);
  vertex(x-55, y+70);
  vertex(x-25, y+65);
  endShape(CLOSE);
  beginShape();
  vertex(x, y+85);
  vertex(x, y+100);
  vertex(x+30, y+115);
  vertex(x+55, y+110);
  vertex(x+60, y+105);
  vertex(x+70, y+90);
  vertex(x+60, y+75);
  vertex(x+55, y+70);
  vertex(x+25, y+65);
  endShape(CLOSE);
  noFill();
  line(x+4, y+95, x+20, y+88);
  line(x+20, y+88, x+22, y+89);
  line(x+22, y+89, x+24, y+89);
  line(x-4, y+95, x-20, y+88);
  line(x-20, y+88, x-22, y+89);
  line(x-22, y+89, x-24, y+89);
  //creates the eyes
  fill(0);
  ellipse(x - 50, y-5, 25, 40);
  ellipse(x + 50, y-5, 25, 40);
  noFill();
  fill(255);
  ellipse(x - 50, y-5, 12, 15);
  ellipse(x + 50, y-5, 12, 15);
  noFill();
  //details
  stroke(0);
  line(x-63, y-37, x - 35, y - 17);
  line(x+63, y-37, x + 35, y - 17);
  //change colors and try out different processing commands.
}


void ditto(float x, float y, boolean shiny) {
  if (shiny) {
    fill(102, 204, 234);
  } else {
    fill(204, 102, 204);
  }
  strokeWeight(2);
  stroke(0);
  circle(x, y, 64);
  fill(0);
  circle(x-15, y-3, 2);
  circle(x+15, y-3, 2);
  noFill();
  arc(x, y+2, 85, 20, PI/3, 2*PI/3);
}

void pokeball(color ballColor, color base, float x, float y) {
  // tint(255, 127);
  strokeWeight(2);
  fill(base);
  stroke(ballColor);
  circle(x, y, 64);
  // stroke(base);
  fill(ballColor);
  arc(x, y+2, 64, 64, PI, 2*PI);
  stroke(base);
  line(x-32, y-2, x+32, y-2);
  stroke(ballColor);
  strokeWeight(3);
  line(x-32, y+2, x+32, y+2);
  stroke(base);
  line(x-32, y+4, x+32, y+4);
  stroke(base);
  fill(ballColor);
  strokeWeight(2);
  circle(x, y, 16);
  fill(base);
  circle(x, y, 8);
  noFill();
  stroke(ballColor);
  circle(x, y, 64);
}

void chessboard() {
  boolean switcher = true;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      strokeWeight(1);
      // tint(255, 255);
      if (switcher) {
        fill(0);
        square(j*100, i*100, 100);
        pokeball(255, 0, j*100+50, i*100+50);
        switcher = false;
      } else {
        fill(255);
        square(j*100, i*100, 100);
        pokeball(0, 255, j*100+50, i*100+50);
        switcher = true;
      }
    }
    switcher = !switcher;
  }
}

void setup() {
  pawnPromoting = false;
  turnNumber = 1;
  wKing = new King(new int[] {4, 7}, false);
  bKing = new King(new int[] {4, 0}, true);
  //Adding Kings and Queens
  white.add(wKing);
  black.add(bKing);
  white.add(new Queen(new int[] {3, 7}, false, wKing));
  black.add(new Queen(new int[] {3, 0}, true, bKing));

  // Adding Pawns to each side with a for loop (0, 0) represents top left hand corner and (7,7) represents bottom right hand corner)
  for (int count = 0; count < 8; count++) {
    black.add(new Pawn(new int[] {count, 1}, true, bKing));
  }
  for (int count = 0; count < 8; count++) {
    white.add(new Pawn(new int[] {count, 6}, false, wKing));
  }
  // Adding Bishops
  white.add(new Bishop(new int[] {2, 7}, false, wKing));
  white.add(new Bishop(new int[] {5, 7}, false, wKing));
  black.add(new Bishop(new int[] {2, 0}, true, bKing));
  black.add(new Bishop(new int[] {5, 0}, true, bKing));





  //Adding Knights and Rooks
  white.add(new Rook(new int[] {0, 7}, false, wKing));
  white.add(new Rook(new int[] {7, 7}, false, wKing));
  black.add(new Rook(new int[] {0, 0}, true, bKing));
  black.add(new Rook(new int[] {7, 0}, true, bKing));

  white.add(new Knight(new int[] {1, 7}, false, wKing));
  white.add(new Knight(new int[] {6, 7}, false, wKing));
  black.add(new Knight(new int[] {1, 0}, true, bKing));
  black.add(new Knight(new int[] {6, 0}, true, bKing));

  size(800, 800);
  chessboard();

  // SETUP OF WHITE PIECES
  for (int incrementer = 0; incrementer < white.size(); incrementer++) {

    if (white.get(incrementer).getType().equals("PAWN")) {
      ditto(white.get(incrementer).getPos()[0] * 100 + 50, height - 150, white.get(incrementer).side());
    } else if (white.get(incrementer).getType().equals("BISHOP")) {
      piplup(white.get(incrementer).getPos()[0] * 100 + 50, height - 50, white.get(incrementer).side());
    } else if (white.get(incrementer).getType().equals("KNIGHT")) {
      solosis(white.get(incrementer).getPos()[0] * 100 + 50, height - 50, white.get(incrementer).side());
    } else if (white.get(incrementer).getType().equals("ROOK")) {
      electrode(white.get(incrementer).getPos()[0] * 100 + 50, height - 50, white.get(incrementer).side());
    } else if (white.get(incrementer).getType().equals("QUEEN")) {
      gulpin(white.get(incrementer).getPos()[0] * 100 + 50, height - 50, white.get(incrementer).side());
    } else {
      spheal(white.get(incrementer).getPos()[0] * 100 + 50, height - 50, white.get(incrementer).side());
    }
  }
  // SETUP OF BLACK PIECES
  for (int incrementer = 0; incrementer < black.size(); incrementer++) {
    if (black.get(incrementer).getType().equals("PAWN")) {
      ditto(black.get(incrementer).getPos()[0] * 100 + 50, 150, black.get(incrementer).side());
    } else if (black.get(incrementer).getType().equals("BISHOP")) {
      piplup(black.get(incrementer).getPos()[0] * 100 + 50, 50, black.get(incrementer).side());
    } else if (black.get(incrementer).getType().equals("KNIGHT")) {
      solosis(black.get(incrementer).getPos()[0] * 100 + 50, 50, black.get(incrementer).side());
    } else if (black.get(incrementer).getType().equals("ROOK")) {
      electrode(black.get(incrementer).getPos()[0] * 100 + 50, 50, black.get(incrementer).side());
    } else if (black.get(incrementer).getType().equals("QUEEN")) {
      gulpin(black.get(incrementer).getPos()[0] * 100 + 50, 50, black.get(incrementer).side());
    } else {
      spheal(black.get(incrementer).getPos()[0] * 100 + 50, 50, black.get(incrementer).side());
    }
  }

  for (int count = 0; count < white.size(); count++) {
    pieces.add(black.get(count));
    pieces.add(white.get(count));
  }
  //  rowlet(150, 50);
  /* gulpin(750, 750, false);
   gulpin(650, 750, true);
   solosis(650, 650, true);
   solosis(750, 650, false);*/
}

void draw() {

  chessboard();
  //draws all white pieces
  for (int i = 0; i < white.size(); i++) {
    // text(""+white.get(i).isAlive(), 50, 50);
    if (white.get(i).isAlive()) {
      if (white.get(i).getType().equals("PAWN")) {
        ditto(white.get(i).getPos()[0] * 100 + 50, white.get(i).getPos()[1] * 100 + 50, white.get(i).side());
      } else if (white.get(i).getType().equals("BISHOP")) {
        piplup(white.get(i).getPos()[0] * 100 + 50, white.get(i).getPos()[1] * 100 + 50, white.get(i).side());
      } else if (white.get(i).getType().equals("KNIGHT")) {
        solosis(white.get(i).getPos()[0] * 100 + 50, white.get(i).getPos()[1] * 100 + 50, white.get(i).side());
      } else if (white.get(i).getType().equals("ROOK")) {
        electrode(white.get(i).getPos()[0] * 100 + 50, white.get(i).getPos()[1] * 100 + 50, white.get(i).side());
      } else if (white.get(i).getType().equals("QUEEN")) {
        gulpin(white.get(i).getPos()[0] * 100 + 50, white.get(i).getPos()[1] * 100 + 50, white.get(i).side());
      } else {
        spheal(white.get(i).getPos()[0] * 100 + 50, white.get(i).getPos()[1] * 100 + 50, white.get(i).side());
      }
    }
  }
  //draws all black pieces
  for (int i = 0; i < black.size(); i++) {
    if (black.get(i).isAlive()) {
      if (black.get(i).getType().equals("PAWN")) {
        ditto(black.get(i).getPos()[0] * 100 + 50, black.get(i).getPos()[1] * 100 + 50, black.get(i).side());
      } else if(black.get(i).getType().equals("BISHOP")){
        piplup(black.get(i).getPos()[0] * 100 + 50, black.get(i).getPos()[1] * 100 + 50, black.get(i).side());
      } else if(black.get(i).getType().equals("KNIGHT")){
        solosis(black.get(i).getPos()[0] * 100 + 50, black.get(i).getPos()[1] * 100 + 50, black.get(i).side());
      } else if(black.get(i).getType().equals("ROOK")){
        electrode(black.get(i).getPos()[0] * 100 + 50, black.get(i).getPos()[1] * 100 + 50, black.get(i).side());
      } else if(black.get(i).getType().equals("QUEEN")){
        gulpin(black.get(i).getPos()[0] * 100 + 50, black.get(i).getPos()[1] * 100 + 50, black.get(i).side());
      } else{
        spheal(black.get(i).getPos()[0] * 100 + 50, black.get(i).getPos()[1] * 100 + 50, black.get(i).side());
      }
      
    }
  }
  /*  gulpin(750, 750, false);
   gulpin(650, 750, true);
   solosis(650, 650, true);
   solosis(750, 650, false);
   electrode(650, 550, true);
   electrode(750, 550, false);*/
}

void mouseClicked() {
  System.out.println("TURN: " + turnNumber);
  int xpos = (int)mouseX/100;
  int ypos = (int)mouseY/100;
  if(!pawnPromoting){
    if (selectingPiece) {
      System.out.println("Selecting");
      if (turnNumber % 2 != 0) {
        for (int i = 0; i < white.size(); i++) {
          if (white.get(i).getPos()[0] == xpos && white.get(i).getPos()[1] == ypos) {
            selectedPiece = white.get(i);
            selectingPiece = false;
          }
        }
      } else {
        for (int i = 0; i < black.size(); i++) {
          if (black.get(i).getPos()[0] == xpos && black.get(i).getPos()[1] == ypos) {
            selectedPiece = black.get(i);
            selectingPiece = false;
          }
        }
      }
    } else {
      System.out.println("Moving");
      selectingPiece = true;
      System.out.println(selectedPiece.getType());
      if (selectedPiece.move(new int[]{xpos, ypos})) {
        turnNumber++;
        System.out.println("Successful move!");
        System.out.println(Arrays.toString(selectedPiece.getPos()));
      }
      if(turnNumber % 2 == 0){
        for(Piece p : black){
          if(p.getType().equals("PAWN")){
        //    if(p.getCanBeEnPassanted()) {System.out.println("pawn can be enpassanted");}
            p.setCanBeEnPassanted(false);
          }
        }
      }
      else{
        for(Piece p : white){
          if(p.getType().equals("PAWN")){
        //    if(p.getCanBeEnPassanted()) {System.out.println("pawn can be enpassanted");}
            p.setCanBeEnPassanted(false);
          }
        }
      }
      pawnPromotionChecker();
    }
  }
  
  
}

boolean gameOver() {
  return false;
}

void keyPressed(){
  if(pawnPromoting){
    if(key == 'q' || key == 'k' || key == 'r' || key == 'b'){
      if(pawnBeingPromoted.side()){
        black.remove(pawnBeingPromoted);
        if(key == 'q'){
          black.add(new Queen(pawnBeingPromoted.getPos(), true, bKing));
        }
        else if(key == 'k'){
          black.add(new Knight(pawnBeingPromoted.getPos(), true, bKing));
        }
        else if(key == 'r'){
          black.add(new Rook(pawnBeingPromoted.getPos(), true, bKing));
        }
        else{
          black.add(new Bishop(pawnBeingPromoted.getPos(), true, bKing));
        }
      }
      else{
         white.remove(pawnBeingPromoted);
        if(key == 'q'){
          white.add(new Queen(pawnBeingPromoted.getPos(), false, bKing));
        }
        else if(key == 'k'){
          white.add(new Knight(pawnBeingPromoted.getPos(), false, bKing));
        }
        else if(key == 'r'){
          white.add(new Rook(pawnBeingPromoted.getPos(), false, bKing));
        }
        else{
          white.add(new Bishop(pawnBeingPromoted.getPos(), false, bKing));
        }
      }
      pawnPromoting = false;
    }
  }
  
}

void pawnPromotionChecker() {
  for(Piece p: white){
    if(p.getType().equals("PAWN") && p.getPos()[1] == 0){
       pawnPromoting = true;
       pawnBeingPromoted = p;
    }
  }
  for(Piece p: black){
    if(p.getType().equals("PAWN") && p.getPos()[1] == 7){
       pawnPromoting = true;
       pawnBeingPromoted = p;
    }
  }
}
