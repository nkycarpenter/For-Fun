/*
Team: Fighting Platypus 
Members: David Hallyburton, Nicole Carpenter
 12/4/2017
 CSCI182
 Homework 7: Team Game
 Description: This games uses the theme from the tv show Perry the Platypus. 
 The objective is to avoid the moving squares for as long as possible. If Perry 
 hits one of the squares or hits the edge of the screen the game will end and 
 display the time that the player was able to stay alive. If the player wants 
 to end the game prematurely, they can hit the 'p' button.
 */

// Starts Perry in the middle of the screen 
int circleX = 250;
int circleY = 250; 
int counter = 0;
//Int to change screens
int screenNum; 
//Pictures
PImage img;
PImage img2;
PImage img3;
//Font
PFont f;
// Set y-coordinate for lines
float y1;
float y2;
float y3;
float y4;
float y5;
float y6;
float y7;
float y8;
float y9;
float y10;
// Set x-coordinate for lines
float x1;
float x2;
float x3;
float x4;
float x5;
float x6;
float x7;
float x8;
float x9;
float x10;
//Floating square arrays
int numLines = 8;
float[] xf1 = new float[numLines];
float[] xf2 = new float[numLines];
float[] yf1 = new float[numLines];
float[] yf2 = new float[numLines];
float[] speed = new float[numLines]; // movement speeds of lines
//Timer int's----------
int actualSecs; 
int actualMins; 
int startSec = 0;
int startMin = 0;
int scrnSecs; 
int scrnMins = 0;
int restartSecs = 0;
int restartMins = 0;


void setup() {
  size(500, 500);
  img = loadImage("perry.png");
  img2= loadImage("Doof.jpg");
  img3= loadImage("Doofontrain.png");
  screenNum=0;
  f = loadFont("AdobeDevanagari-Bold-48.vlw");
  background(255);
  rectMode(CENTER);
  fill(255, 255, 0);
  textFont(f, 15);
  tint(200, 200, 200);
  noStroke();
}

void draw() {
  background(255);

  switch(screenNum) {
    //Start Screen
  case 0:
    //Background Picture
    tint(100, 100, 100);
    image(img2, 0, 0, 500, 500);
    noTint();
    //Timer Code --------------
    actualSecs = 0;
    actualMins = 0;
    //Start Screen Text
    textAlign (CENTER);
    text("Avoid the blocks for as long as possible", 250, 135);
    text (" using the Up, Right, Down,", 250, 160);
    text ("and Left arrow keys. Stay on screen and", 250, 185);
    text ("the time starts as soon as an arrow ", 250, 210);
    text (" is pressed. To end the game prematurely ", 250, 235);
    text ("press 'p'. Hit ENTER to begin.", 250, 260);
    text ("TEAM FIGHTING PLATYPUS ", 250, 400);
    text("/*Deserves an A*/", 250, 475);
    fill(255, 255, 0);
    //Loops for the Arrays
    for (int i = 0; i < numLines; i++) {
      xf1[i] = 0; // Set initial position
      speed[i] = (2); // Set initial speed
    }
    for (int i = 0; i < numLines; i++) {
      xf2[i] = 500; // Set initial position
      speed[i] =(2); // Set initial speed
    }
    for (int i =0; i < numLines; i++) {
      yf1[i] = 0; // Set initial position
      speed[i] = (2); // Set initial speed
    }
    for (int i =0; i < numLines; i++) {
      yf2[i] = 500; // Set initial position
      speed[i] =(2); // Set initial speed
    }

    break;
    //Play Screen
  case 1:
    //Background Picture
    tint(100, 100, 100);
    image(img2, 0, 0, 500, 500);
    noTint();
    //Counter int x,y randomization
    counter++;
    //Timer Code ---------------------------------------
    textAlign (LEFT);
    actualSecs = millis() / 1000; //convert milliseconds to seconds, store values.
    actualMins = millis() / 1000 / 60; //convert milliseconds to minutes, store values.
    scrnSecs = actualSecs - restartSecs; //seconds to be shown on screen
    scrnMins = actualMins - restartMins; //minutes to be shown on screen
    if (keyCode == ENTER) { //if mouse is pressed, restart timer
      restartSecs = actualSecs; //stores elapsed SECONDS
      scrnSecs = startSec; //restart screen timer  
      restartMins = actualMins; //stores elapsed MINUTES
      scrnMins = startMin; //restart screen timer
    }
    if (actualSecs % 60 == 0) { //after 60 secs, restart second timer  
      restartSecs = actualSecs;   //placeholder for this second in time
      scrnSecs = startSec; //reset to zero
    } 
    //displays time on screen
    fill(255,255,0);
    text("Time" + " " + scrnMins + " : " + scrnSecs, 20, 25);

    //Lines -------------------------------------------
   //Loopsto move the xf1 and xf2
    for (int i = 0; i < xf1.length; i++) {
      xf1[i] += speed[i]; // Update line position
      xf2[i] -= speed[i];
      if (xf1[i] > (width)&& xf2[i] <(width)) { // If off the right,
        xf1[i] = 0;
        xf2[i] =500;// return to the left
      }
      //Squares shown on screen
      fill( 255, 255, 0);
      rect(xf1[i], y1, 15, 15);
      rect(xf1[i], y2, 15, 15);
      rect(xf1[i], y3, 15, 15);
      rect(xf1[i], y4, 15, 15);
      rect(xf1[i], y5, 15, 15);
      rect(xf2[i], y6, 15, 15);
      rect(xf2[i], y7, 15, 15);
      rect(xf2[i], y8, 15, 15);
      rect(xf2[i], y9, 15, 15);
      rect(xf2[i], y10, 15, 15);
    }
    //Loop to change the y1 and y2 position every 400 frames
    if (counter % 400 == 0) {
      y1 = random(0, 500);
      y2 = random(0, 500);
      y3 = random(0, 500);
      y4 = random(0, 500);
      y5 = random(0, 500);
      y6 = random(0, 500);
      y7 = random(0, 500);
      y8 = random(0, 500);
      y9 = random(0, 500);
      y10 = random(0, 500);
    } 
    //Loops to end the game if Perry runs into any of the squares
    for (int i = 0; i < xf1.length; i++) { 
      if (dist(xf1[i], y1, circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf1.length; i++) { 
      if (dist(xf1[i], y2, circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf1.length; i++) {
      if (dist(xf1[i], y3, circleX, circleY) < 15) {
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf1.length; i++) { 
      if (dist(xf1[i], y4, circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf1.length; i++) {
      if (dist(xf1[i], y5, circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf2.length; i++) {
      if (dist(xf2[i], y6, circleX, circleY) < 15) {
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf2.length; i++) {
      if (dist(xf2[i], y7, circleX, circleY) < 15) {
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf2.length; i++) {
      if (dist(xf2[i], y8, circleX, circleY) < 15) {
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf2.length; i++) { 
      if (dist(xf2[i], y9, circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < xf2.length; i++) {
      if (dist(xf2[i], y10, circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    //Loops to move the yf1 and yf2 arrays
    for (int i = 0; i < yf1.length; i++) {
      yf1[i] += speed[i]; // Update line position
      yf2[i] -= speed[i];
      if (yf1[i] > (height)&& yf2[i] <(height)) { // If off the right,
        yf1[i] = 0; // return to the left
        yf2[i] =500;
      } 
      //Squares that show up on screen
      fill( 255, 255, 0);
      rect(x1, yf1[i], 15, 15);
      rect(x2, yf1[i], 15, 15);
      rect(x3, yf1[i], 15, 15);
      rect(x4, yf1[i], 15, 15);
      rect(x5, yf1[i], 15, 15);
      rect(x6, yf2[i], 15, 15);
      rect(x7, yf2[i], 15, 15);
      rect(x8, yf2[i], 15, 15);
      rect(x9, yf2[i], 15, 15);
      rect(x10, yf2[i], 15, 15);
    }
    //Loop to change the x1 and x2 position every 400 frames
    if (counter % 400 == 0) {   
      x1 = random(0, 500);
      x2 = random(0, 500);
      x3 = random(0, 500);
      x4 = random(0, 500);
      x5 = random(0, 500);
      x6 = random(0, 500);
      x7 = random(0, 500);
      x8 = random(0, 500);
      x9 = random(0, 500);
      x10 = random(0, 500);
    }
    //Loops to end the game if Perry runs into any of the squares
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x1, yf1[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x2, yf1[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x3, yf1[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x4, yf1[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x5, yf1[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x6, yf2[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x7, yf2[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x8, yf2[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x9, yf2[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }
    for (int i = 0; i < yf1.length; i++) { 
      if (dist(x10, yf2[i], circleX, circleY) < 15) { 
        screenNum = 2;
      }
    }

    break;
    //End Game Screen
  case 2:
    //Background Picture
    tint(100, 100, 100);
    image(img3, 0, 0, 500, 500);
    noTint();
    //End Game Text
    textAlign (CENTER);
    fill(255, 255, 0);
    text ("Game Over", 250, 350);
    text ("Time" + " " + scrnMins + " : " + scrnSecs, 250, 375);
    noLoop();
  }
  //Keyboard controls for Perry
  if (key == CODED) {
    if (keyCode == UP) {
      circleY--;
    } else if (keyCode == DOWN) {
      circleY++;
    } else if (keyCode == LEFT) {
      circleX--;
    } else if (keyCode == RIGHT) {
      circleX++;
    }
    //Code for Perry
    fill(255, 0, 0);
    image(img, circleX, circleY, 25, 25);
  }
  //Loop for if Perry goes off screen the game ends
  if (circleX <= 0 || circleX >= 500 || circleY <= 0 || circleY >= 500) {
    screenNum = 2;
  }
}
//Function to change screens
void keyReleased() {
  if (screenNum == 0 && keyCode == ENTER) { //starts game
    actualSecs = restartSecs;
    screenNum = 1;
  } else if (screenNum == 1 && key == 'p') { //ends game
    screenNum = 2;
  }
}
