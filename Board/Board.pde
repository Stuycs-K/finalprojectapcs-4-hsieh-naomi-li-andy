import java.util.*;
import java.io.*;

static ArrayList<Piece> pieces;
boolean pawnPromoting;

void pokeball(color ballColor, color base, float x, float y){
  fill(base);
  stroke(ballColor);
  circle(x, y, 74);
  stroke(base);
  fill(ballColor);
  arc(x, y, 74, 74, PI, 2*PI);
  
}

void setup() {
  size(800, 800);
  boolean switcher = true;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (switcher) {
        fill(0);
        pokeball(255, 0, j*100+50, i*100+50);
        switcher = false;
      } else {
        fill(255);
        pokeball(0, 255, j*100+50, i*100+50);
        switcher = true;
      }
      square(i*100, j*100, 100);
      delay(1000);
    }
    switcher = !switcher;
  }
}

void draw() {
}

boolean gameOver(){
 return false;
}
 
void pawnPromotion(){}
