
//we create an object drop first and the create an array of those objects
class Drop {
  float x; // x postion of drop
  float y; // y position of drop
  float z; // z position of drop , determines whether the drop is far or near
  float len; // length of the drop
  float yspeed; // speed of te drop
  float cloudx = 100;
  float cloudx2 = 200;

  //near means closer to the screen , ie the higher the z value ,closer the drop is to the screen.
  Drop() {
    x  = random(width); // random x position ie width because anywhere along the width of screen
    y  = random(-500, -50); // random y position, negative values because drop first begins off screen to give a realistic effect
    z  = random(3, 18); // z value is to give a perspective view , farther and nearer drops effect
    len = map(z, 0, 20, 10, 20); // if z is near then  drop is longer
    yspeed  = map(z, 0, 20, 1, 20); // if z is near drop is faster
  }

  void fall() { // function  to determine the speed and shape of the drop 
    y = y + yspeed; // increment y position to give the effect of falling 
    float grav = map(z, 0, 20, 0, 0.2); // if z is near then gravity on drop is more
    yspeed = yspeed + grav; // speed increases as gravity acts on the drop

    if (y > height) { // repositions the drop after it has 'disappeared' from screen
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() { // function to render the drop onto the screen
    float thick = map(z, 0, 20, 1, 3); //if z is near , drop is more thicker 
    strokeWeight(thick); // weight of the drop
    stroke(3, 67, 255); // purple color
    line(x, y, x, y+len); // draws the line with two points
  }
}


void rain() {
  //background(230, 230, 250); // background color in RGB color cordinates
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall(); // sets the shape and speed of drop
    drops[i].show(); // render drop
  }
}