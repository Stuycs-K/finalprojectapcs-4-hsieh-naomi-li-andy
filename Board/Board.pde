import java.util.*;
import java.io.*;

static ArrayList<Piece> pieces;
boolean pawnPromoting;

void setup() {
  size(800, 800);
  boolean switcher = true;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (switcher) {
        fill(0);
        switcher = false;
      } else {
        fill(255);
        switcher = true;
      }
      square(i*100, j*100, 100);
    }
    switcher = !switcher;
  }
}

void draw(){}


boolean gameOver(){
 return false;
}
 
void pawnPromotion(){}
