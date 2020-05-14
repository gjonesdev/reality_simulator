float night_alpha;

void landscape() {
  fill(#395A6A);
  beginShape();
  vertex(0, height);
  vertex(0, height - 200);
  vertex(100, height - 300);
  vertex(400, height - 400);
  vertex(800, height  - 200);
  vertex(1200, height  - 300);
  vertex(width, height - 200);
  vertex(width, height);
  endShape(CLOSE);
  fill(#527D90);
  beginShape();
  vertex(0, height);
  vertex(0, height - 100);
  vertex(200, height - 200);
  vertex(400, height - 150);
  vertex(900, height  - 200);
  vertex(1100, height  - 100);
  vertex(width, height - 150);
  vertex(width, height);
  endShape(CLOSE);
}

void night() {
  if (time > height && time < height * 2 - 200 && night_alpha < 255) {
    night_alpha ++;
  } else {
    if (night_alpha > 0) {
      night_alpha --;
    }
  }
}


ArrayList<Star> stars;

class Star {
  float x; 
  float y; 
  float size;

  Star() {
    x  = random(width); 
    y  = random(height); 
    size = random(20);
  }

  void render() { 
    fill(255, night_alpha);
    ellipse(x, y, size, size);
  }
}

void stars() {
  night();
  for (int i = 0; i < stars.size(); i++) {
    Star s = stars.get(i);
    s.render();
  }
}
