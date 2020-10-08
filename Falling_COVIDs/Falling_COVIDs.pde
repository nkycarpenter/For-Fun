/*
Nicole Carpenter
 10/7/2020
 Catch the Apples!!
 */

int maskX = (250);
int maskY = (425);
int counter = 0;
int screenNum; 
PFont f;
PImage img1;
PImage img2;
float d;

int actualSecs; 
int actualMins; 
int startSec = 0;
int startMin = 0;
int scrnSecs; 
int scrnMins = 0;
int restartSecs = 0;
int restartMins = 0;

Orb myOrbs[] = new Orb[30];


//---------------------------------------------------------------------------------------------
void setup() {
  size(500, 500);
  img1 = loadImage("covid-virus.png");
  img2 = loadImage("face-mask.png");
  f = loadFont("AdobeDevanagari-Bold-48.vlw");
  fill(255, 255, 0);
  textFont(f, 15);
  tint(200, 200, 200);
  noStroke();
  for (int i = 0; i < 30; i++) {   //Death Orbs
    myOrbs[i] = new Orb();
  }
}
//---------------------------------------------------------------------------------------------
void draw() {
  background(255);

  switch(screenNum) {
    //----------------------------------------
  case 0: //Start Screen
    image(img1, 150, 225, 200, 200);
    fill(0);
    noStroke();
    rect(0, 0, 500, 35);
    actualSecs = 0;
    actualMins = 0;
    textAlign (CENTER);
    text("Avoid the Falling Viruses", 250, 100);
    text("for as Long as Possible", 250, 130);
    text ("Using the Right and Left Arrow Keys", 250, 180);
    text ("Press ENTER to Start", 250, 205);
    break;
    //----------------------------------------
  case 1:  //Play Screen
    for (int i = 0; i < 30; i++) {  //Death Balls
      myOrbs[i].fall();
      myOrbs[i].display();
    }
    //----------------------------------------
    fill(0);
    noStroke();
    rect(0, 0, 500, 35);
    textAlign (LEFT);  //displays score on screen
    textFont(f, 10);
    fill(255, 255, 255);
    text("Viruses Acquired" + " " + counter + " ", 5, 25);
    if (counter > 100) {
      screenNum = screenNum +1;
    }
    //Timer Code ---------------------------------------
    textAlign (RIGHT);
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
    fill(255);
    text("Time" + " " + scrnMins + " : " + scrnSecs, 490, 25);
    loop();
    break;


    //----------------------------------------
  case 2: // End Screen
    background(255);
    rect(0, 0, 500, 35);
    textAlign (CENTER);
    textFont(f, 20);
    text ("You now have the Virus!", 250, 100);
    text ("Press ENTER to Restart", 250, 135);
    text ("Time" + " " + scrnMins + " : " + scrnSecs, 250, 170);
    image(img1, 150, 225, 200, 200);
    noLoop();
  }
  //----------------------------------------
  //Basket
  if (key == CODED) {
    if (keyCode == LEFT) {
      maskX--;
    } else if (keyCode == RIGHT) {
      maskX++;
    }
    fill(200, 0, 0);
    rectMode(CENTER);
    rect(maskX, maskY, 2, 2);
    imageMode(CENTER);
    image(img2, maskX, maskY, 40, 20);
    imageMode(CORNER);
  }
  //Future fire
  if (maskX <= 0 || maskX >= 500 ) {
  }
  //Bottom
  fill(0);
  noStroke();
  rectMode(CORNERS);
  rect (0, 435, 500, 500);

  if (screenNum == 2) {
    print("You lasted " + scrnMins + ":" + scrnSecs);
  }
}
//---------------------------------------------------------------------------------------------
void keyReleased() {
  if (screenNum == 0 || screenNum == 2 && keyCode == ENTER) { //starts game
    screenNum = 1;
    counter = 0;
    scrnMins = 0;
    scrnSecs = 0;
    maskX = 250;
    maskY = 425;
    loop();
  } else if ( screenNum == 1 && keyCode == BACKSPACE) {
    screenNum = 0;
  }
}

//---------------------------------------------------------------------------------------------
class Orb {
  color b;
  float xpos;
  float ypos;
  float yspeed;
  Orb() {
    b = color(0);
    xpos = random(0, 500);
    ypos = random(-450, 0);
    yspeed = 2;
  }
  void display () {
    ellipseMode(CENTER);
    fill(b);
    stroke(50, 50, 50);
    ellipse(xpos, ypos, 1, 1);
    image(img1, xpos-5, ypos-5, 15, 15);
  }
  void fall () {
    ypos = ypos + yspeed;
    if (ypos > height) {
      xpos = random(0, 500);
      ypos = random(-200, 0);
    }
    if (dist(maskX, maskY, xpos, ypos) < 10) {
      counter++;
    }
  }
}
