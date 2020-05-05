
Drop[] drops = new Drop[500]; // array of drop objects/
Cloud[] clouds = new Cloud[10];
int weather;

void setup() {
  fullScreen(); // size of the window
  for (int i = 0; i < drops.length; i++) { // we create the drops 
    drops[i] = new Drop();
  }

  for (int i = 0; i < clouds.length; i++) { // we create the drops 
    clouds[i] = new Cloud();
  }
  fill(0, 183, 35);
  rect(0, height - 30, width, height - 30);
}

void draw() {
  cycle();
  tree();

  print(weather);
  if (newday) {
    weather = int(random(3));
    newday = false;
  }
  if (weather == 1) {
    cloudy();
  }
  if (weather == 2) {
    cloudy();
    rain();
  }
}




  //if milli % 360 = 0 new day
  // if new day choose random weather from array

  // sun starts at bottom goes off screen
