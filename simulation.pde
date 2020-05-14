float alpha;
int weather;
float treepos;

void setup() {
  fullScreen(); 
  drops = new ArrayList<Drop>(); 
  clouds = new ArrayList<Cloud>();
  stars = new ArrayList<Star>();
  for (int i = 0; i < 50; i++) {
    Star s = new Star();
    stars.add(s);
  }
  treepos = random(100, width - 100);
}

void draw() {
  color_select();
  cycle();
  stars();
  landscape();
  tree();
  grass();
  rain();
  cloudy();
  weather();
  noStroke();
  pushMatrix();
  fill(#6A481C);
  rect(0, height - 10, width, height - 10);
  popMatrix();
}
