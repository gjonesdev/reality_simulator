ArrayList<Drop> drops;

class Drop {
  float x; 
  float y; 
  float z; 
  float len; 
  float yspeed; 
  
  Drop() {
    x  = random(-1000, width); 
    y  = random(-500, -50); 
    z  = random(3, 18);
    len = map(z, 0, 20, 10, 20); 
    yspeed  = map(z, 0, 20, 1, 20);
  }

  void fall() {  
    y = y + yspeed;  
    x = x + windSpeed / 5;
    float grav = map(z, 0, 20, 0, 0.2); 
    yspeed = yspeed + grav; 
  }

  void render() { 
    float thick = map(z, 0, 20, 1, 3);  
    strokeWeight(thick); 
    stroke(3, 67, 255); 
    line(x, y, x, y+len); 
  }
}

void rain() {
  for (int i = 0; i < drops.size(); i++) {
    Drop d = drops.get(i);
    d.fall(); 
    d.render(); 

    if (d.y > height) { 
     drops.remove(i);
    }
  }
}
