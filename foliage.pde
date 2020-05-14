float trunkLen =    200;        // length of the trunk
float windInc =     0.01;       // how quickly wind changes speed (try changing)

float windSpeed =   0;          // speed, which will = angle of bend
float noisePos =    0;          // "position" in the Perlin noise

// for the fancier Pythagoras tree
float branchAngle = 30;         // angle between two branches
int minLen =        10;         // minimum size of branches

float grass_length = -1;
float windmulti = 10;

void tree() {
  pushMatrix();
  translate(treepos, height);
  stroke(#46320A);
  strokeWeight(5);
  line(0, 0, 0, -trunkLen);
  branch(trunkLen);

  windSpeed = noise(noisePos) * windmulti;
  noisePos += windInc;
  popMatrix();
}

void branch (float len) {

  float prevLen = len;
  len *= 0.5 * sqrt(2);    
  if (len > minLen) {

    float stiffness = map(len, minLen, trunkLen, 1.0, 0.2);
    float twist = windSpeed * stiffness;

    pushMatrix();                             
    translate(0, -prevLen);                   
    rotate(radians(-branchAngle + twist));    

    noStroke();
    fill (#076A26);
    ellipse(0, 0, 40, 40);
    stroke(#46320A);
    strokeWeight(2);
    line(0, 0, 0, -len);     
    branch(len);                             
    popMatrix();

    pushMatrix();
    translate(0, -prevLen);
    rotate(radians(branchAngle));
    line(0, 0, 0, -len);
    branch(len);
    popMatrix();
  }
}

void grass() {
  for (int x = -100; x < width + 100; x +=5) {
    pushMatrix();
    translate(x, height - 10);
    rotate(radians(windSpeed));
    stroke(0, 183, 35);
    strokeWeight(2);

    line(0, 0, 0, grass_length/100);

    if (grass_length > height - random(7000, 8000)) {
      if (weather == 3) {
        grass_length -= random(.03);
      }
      if (weather == 2) {
        grass_length -= random(.02);
      } else {
        grass_length -= random(.001);
      }
    }
    popMatrix();
  }
}
