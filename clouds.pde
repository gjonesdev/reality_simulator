
//we create an object drop first and the create an array of those objects
 float t, u, alf, shifth, shiftv, szh, szv, clr;
 
class Cloud {
  float x; // x postion of drop
  float y; // y position of drop
  float z; // z position of drop , determines whether the drop is far or near
  float len; // length of the drop
  float xspeed; // speed of te drop
  float k;
  float alpha;
  

  //near means closer to the screen , ie the higher the z value ,closer the drop is to the screen.
  Cloud() {
    k = random(50, 150);
    x  = random(-200, -100); // random x position ie width because anywhere along the width of screen
    y  = random(100, 600); // random y position, negative values because drop first begins off screen to give a realistic effect
    z  = random(3, 18); // z value is to give a perspective view , farther and nearer drops effect
    len = map(z, 0, 50, 50, 50); // if z is near then  drop is longer
    xspeed  = map(z, 0, 50, 1, 30); // if z is near drop is faster
    alpha = random(0, 255);
  }

  void travel() { // function  to determine the speed and shape of the drop 
   x = x + xspeed; // increment y position to give the effect of falling 
    float wind = map(z, 0, 20, 0, 0.2); // if z is near then gravity on drop is more
    xspeed = xspeed + wind; // speed increases as gravity acts on the drop

    if (x > width) { // repositions the drop after it has 'disappeared' from screen
      x = random(-200, -100);
      xspeed = map(z, 0, 20, 4, 10);
    }
  }
  

  void show() { // function to render the drop onto the screen
 noStroke();
 fill(255, 255, 255, alpha);
  arc(x, y, 200, 300, PI, TWO_PI);
  ellipse(x - 100, y - 50, 100, 100);
  ellipse(x + 100, y - 62.5, 125, 125);
  arc(x + 125, y, 50, 50, PI, TWO_PI);
  ellipse(x + 150, y - 40, 80, 80);
}
}


void cloudy() {
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].travel(); // sets the shape and speed of drop
    clouds[i].show(); // render drop
  }
}
