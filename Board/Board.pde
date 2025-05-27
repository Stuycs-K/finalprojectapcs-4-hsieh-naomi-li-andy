import java.util.*;
import java.io.*;

static ArrayList<Piece> pieces;
boolean pawnPromoting;

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
  if (shiny) {
    fill(203, 155, 211);
  }
  else {
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
    fill(248, 224, 217);
  }
  else {
    fill(242, 228, 200);
  }
  ellipse(x, y+12, 56, 40);
  if (shiny) {
    fill(203, 155, 211);
  }
  else {
    fill(156, 182, 240);
  }
  ellipse(x-9, y-5, 25, 20);
  ellipse(x+9, y-5, 25, 20);
  if (shiny) {
    stroke(203, 155, 211);
  }
  else {
    stroke(156, 182, 240);
  }
  rect(x-22, y-17, 45, 13, 28);
  rect(x-5, y-5, 5, 4, 28);
  stroke(0);
  fill(255);
  triangle(x-16, y+5, x-10, y+5, x-13, y+10); 
  triangle(x+16, y+5, x+10, y+5, x+13, y+10); 
  fill(0);
  circle(x-12, y-10, 10);
  circle(x+12, y-10, 10);
  fill(255);
  circle(x-10, y-12, 6);
  circle(x+14, y-12, 6);
}

void piplup(float x, float y, boolean shiny){
  stroke(0);
  if (shiny) {
    fill(10, 166, 178);
  }
  else {
    fill(68, 132, 190);
  }
  circle(x, y, 64);
  if (shiny) {
    fill(106, 234, 230);
    stroke(106, 234, 230);
  }
  else {
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
  }
  else {
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

void setup() {
  // Adding Pawns to each side with a for loop (0, 0) represents top left hand corner and (7,7) represents bottom right hand corner)
  ArrayList<Piece> white = new ArrayList<Piece>();
  for (int count = 0; count < 8; count++){
    white.add(new Pawn(new int[] {count , 0}, true));
  }
  ArrayList<Piece> black = new ArrayList<Piece>();
  for (int count = 0; count < 8; count++){
    black.add(new Pawn(new int[] {count, 7}, false));
  }
  // Adding Bishops
  white.add(new Bishop
  
  size(800, 800);
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
  ditto(50, 50, true);
  ditto(150, 50, false);
  spheal(50, 150, true);
  spheal(150, 150, false);
  piplup(50, 250, true);
  piplup(150, 250, false);
}

void draw(){}


boolean gameOver() {
  return false;
}

void pawnPromotion() {
}
