void weather() {
  if (newday) {
    if (int(weather) == 1 || int(weather) == 2) { 
      weather = int(random(4));
    } else {
      weather = int(random(3));
    }
    newday = false;
  }

  switch(weather) {
  case 0: 
    cloudcol = 255;
    if (alpha > 0) {
      alpha--;
    }
    if (windmulti < 10) {
      windmulti++;
    }
    if (windmulti > 10) {
      windmulti--;
    }
    println("none");  // Does not execute
    break;
  case 1: 
    cloudcol = #BCBCBC;
    if (alpha < 100) {
      alpha++;
    }
    if (alpha > 100) {
      alpha--;
    }
    if (windmulti < 50) {
      windmulti++;
    }
    if (windmulti > 50) {
      windmulti--;
    }
    while (clouds.size() < 5) {
      Cloud c = new Cloud();
      clouds.add(c);
    }

    println("clouds");  // Prints "One"
    break;

  case 2: 
    cloudcol = #BCBCBC;
    if (alpha < 100) {
      alpha++;
    }
    if (alpha > 100) {
      alpha--;
    }
    if (windmulti < 15) {
      windmulti++;
    }
    if (windmulti > 15) {
      windmulti--;
    }
    while (clouds.size() < 5) {
      Cloud c = new Cloud();
      clouds.add(c);
    }
    for (int i = 0; i < 5; i++) {
      Drop d = new Drop();
      drops.add(d);
    }
    println("light rain");
    break;
  case 3: 
    if (alpha < 200) {
      alpha++;
    }
    if (alpha > 200) {
      alpha--;
    }
    if (windmulti < 80) {
      windmulti++;
    }
    if (windmulti > 80) {
      windmulti--;
    }
    cloudcol = #676767;
    while (clouds.size() < 20) {
      Cloud c = new Cloud();
      clouds.add(c);
    }
    for (int i = 0; i < 10; i++) {
      Drop d = new Drop();
      drops.add(d);
    }
    println("heavy rain");
    break;
  }
}
