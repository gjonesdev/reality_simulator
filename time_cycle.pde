
int time = -100;

boolean newday = false;

int dayspeed = 1;

color day = #05BAFF;
color set = #DEB307;
color night =  #0C0081;

int whichGradient = 0;
float gradientPos = 0;

void newday() {
  if (time > height * 2) {
    time = - 100;
    newday = true;
  }
}

void color_select() {
  if (whichGradient == 0) {
    fill( lerpColor(day, set, gradientPos) );
    gradientPos += 0.001;
  } else if (whichGradient == 1) {
    fill( lerpColor(set, night, gradientPos) );
    gradientPos += 0.003;
  } else if (whichGradient == 2) {
    fill( lerpColor(night, day, gradientPos) );
    gradientPos += 0.001;
  }
  noStroke();
  rect(0, 0, width, height);
  if (gradientPos >= 1) {
    whichGradient += 1;
    if (whichGradient == 3) {
      whichGradient = 0;
    }
    gradientPos = 0;
  }


  fill(100, 100, 100, alpha); 
  rect (0, 0, width, height);
}


void cycle() {
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  circle(width/2, time, 100);
  time += dayspeed;
  newday();
}
