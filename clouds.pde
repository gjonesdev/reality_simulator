ArrayList<Cloud> clouds;
color cloudcol = 255;

class Cloud {
  float x; 
  float y; 
  float z; 
  float len; 
  float xspeed; 
  float k;

  Cloud() {
    k = random(50, 150);
    x  = random(-200, -100); 
    y  = random(50, 200); 
    z  = random(3, 18); 
    len = map(z, 0, 50, 50, 50); 
    xspeed  = map(z, 0, 50, 1, 30); 
  }

  void travel() {  
    x = x + xspeed;  
    
    xspeed = xspeed + windSpeed/1000; 
  }


  void render() { 
    noStroke();
    fill(cloudcol);
    arc(x, y, 200, 300, PI, TWO_PI);
    ellipse(x - 100, y - 50, 100, 100);
    ellipse(x + 100, y - 62.5, 125, 125);
    arc(x + 125, y, 50, 50, PI, TWO_PI);
    ellipse(x + 150, y - 40, 80, 80);
  }
}


void cloudy() {
  for (int i = 0; i < clouds.size(); i++) {
    Cloud c = clouds.get(i);
    c.travel(); 
    c.render(); 

    if (c.x > width) { 
      clouds.remove(i);
    }
  }
}
