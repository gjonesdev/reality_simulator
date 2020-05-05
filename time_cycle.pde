
int time = 0;
boolean newday = false;
boolean night = false;
int dayspeed = 10;


void newday() {
  if (time > height + height) {
    time = 0;
    newday = true;
  }
}


void cycle() {
  float cycle = map(time, 0, height, 0, 1);
  int sundown = color(1, 3, 85);
  //int sunset = color(255, 152, 26);
  int day = color(10, 220, 255);
  int gradient = lerpColor(day, sundown, cycle);
  background(gradient);
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  circle(width/2, time, 100);
  time += dayspeed;
  newday();
}



////Starting Position of cycle
//int dayTime = 0;
////
////change to cause cycles to change fast. HINT: Lower numbers = faster cycles
//int daySpeed = 10;
//////
////Whether cycle will start off increasing or decresing. HINT: Keep opposite
//boolean wax = true;
//boolean wane = false;
////

//void cycle() {
//  //Changes the cycle
//  if (frameCount%10 == 0) {

//    if (wax) {
//      dayTime++;
//    }
//    if (wane) {
//      dayTime--;
//    }
//    if (dayTime > 10*daySpeed) {
//      wane = true; 
//      wax = false;
//    }
//    if (dayTime < -10*daySpeed) {
//      wax = true; 
//      wane = false;
//    }
//  }
//  //
//  //Sky---------------------------------------------------------------
//  background((100-abs(dayTime-1*daySpeed)), 0, 100 + dayTime*15*(1/daySpeed));
//  //
//  //Sun--------------------------------------------------------------
//  fill(255, 255, 0);
//  ellipse(width/2, height/1.02 - dayTime*35*(1/daySpeed), 50, 50);
//  //
//  //Moon-------------------------------------------------------------------
//  fill(255);
//  ellipse(width/2, height + 200 + dayTime*55*(1/daySpeed), 50, 50);
//  //
//  //Sea---------------------------------------------------------------
//  fill(255);
//  rect(0, height/1.1, width, 500);
//  //
//  //Stars----------------------------------------------------------------
//  if (dayTime < -4.5*daySpeed) {

//    for (int i = 1; i < 10; i++) {

//      fill(255);
//      if (frameCount%15 == 0) {
//        ellipse((i+random(10))*100, (i+random(10))*100, 5, 5);
//      }
//    }
//  }
//
