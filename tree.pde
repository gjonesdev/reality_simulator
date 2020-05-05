float trunkLen =    200;        // length of the trunk
float windInc =     0.01;       // how quickly wind changes speed (try changing)

float windSpeed =   0;          // speed, which will = angle of bend
float noisePos =    0;          // "position" in the Perlin noise

// for the fancier Pythagoras tree
float branchAngle = 30;         // angle between two branches
int minLen =        10;         // minimum size of branches
float treepos = random(100, width - 100);

void tree() {
  pushMatrix();
  translate(treepos, height);
  stroke(255);
  strokeWeight(3);
  line(0, 0, 0, -trunkLen);
  branch(trunkLen);

  // update wind speed using 1D Perlin noise
  // noise() returns a value 0 to 1, so mult by 30 means
  // the wind speed will result in an angle of 0-30º
  windSpeed = noise(noisePos) * 30;
  noisePos += windInc;

  // random() will generate movement that is jerky and unrealistic
  // try this instead and see what happens
  // windSpeed += random(-0.6,0.5);
  popMatrix();
}

void branch (float len) {

  // store previous and reduce branch length
  float prevLen = len;
  len *= 0.5 * sqrt(2);    // experiment with changing this and see what happens

  // keep going until the branches are too small
  if (len > minLen) {

    // larger branches are stiffer than little ones
    float stiffness = map(len, minLen, trunkLen, 1.0, 0.2);

    // add some twist based on the wind speed and stiffness
    float twist = windSpeed * stiffness;

    // draw left branches
    pushMatrix();                             // local mode
    translate(0, -prevLen);                   // move up to top of prev branch
    rotate(radians(-branchAngle + twist));    // rotate to new position + twist from wind*
    line(0, 0, 0, -len);                      // draw as a line
    branch(len);                              // call again!
    popMatrix();

    // *NOTE: we only add twist to branches on the left side
    // it's more realistic but try it with both to see what happens

    // draw right branches too
    pushMatrix();
    translate(0, -prevLen);
    rotate(radians(branchAngle));
    line(0, 0, 0, -len);
    branch(len);
    popMatrix();
  }
}
