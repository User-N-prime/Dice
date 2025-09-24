Die[] dice = new Die[9];

void setup() {
  size(230, 350);
  frameRate(30); // allow animation

  int index = 0;
  for (int y = 20; y <= 160; y += 70) {
    for (int x = 20; x <= 160; x += 70) {
      dice[index] = new Die(x, y);
      index++;
    }
  }
}

void draw() {
  background(150);

  int total = 0;
  for (Die d : dice) {
    d.update();
    d.show();
    total += d.currentSide;
  }

  textSize(40);
  fill(0);
  text("Total: " + total, 45, 300);
}

void mousePressed() {
  for (Die d : dice)
    d.roll();
}

class Die {
  int myX, myY;
  int currentSide = 3;
  int targetSide;
  float progress = 0;
  boolean isAnim = false;
  float rotation;
  float scaleFactor = 1;

  Die(int x, int y) {
    myX = x;
    myY = y;
  }

  void roll() {
    targetSide = (int)(Math.random() * 6 + 1);
    progress = 0;
    isAnim = true;
    rotation = 0;
  }

  void update() {
    // animation
    if (isAnim) {
      progress += 0.1;
      rotation = sin(progress * PI) * PI / 4;
      scaleFactor = 1 + 0.2 * sin(progress * PI);

      // timer for animation
      if (progress >= 1) {
        progress = 1;
        isAnim = false;
        currentSide = targetSide;
        rotation = 0;
        scaleFactor = 1;
      } 
      // transition btwn dice vals
      else
        currentSide = (int)lerp(currentSide, targetSide, progress);
    }
  }

  void show() {
    pushMatrix();
    translate(myX + 25, myY + 25);
    rotate(rotation);
    scale(scaleFactor);
    translate(-25, -25);
    
    // shadow
    fill(0, 50);
    noStroke();
    rect(5, 5, 50, 50);

    // die face
    fill(col(currentSide));
    stroke(0);
    rect(0, 0, 50, 50);

    // dots
    fill(0);
    drawDots(currentSide);

    popMatrix();
  }
  
  // # of dots for each type of face
  void drawDots(int side) {
    if (side == 1) {
      ellipse(25, 25, 10, 10);
    } 
    else if (side == 2) {
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    } 
    else if (side == 3) {
      ellipse(12.5, 12.5, 10, 10);
      ellipse(25, 25, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    } 
    else if (side == 4) {
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    } 
    else if (side == 5) {
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(25, 25, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    } 
    else {
      ellipse(12.5, 12.5, 10, 10);
      ellipse(12.5, 25, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(37.5, 25, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
  }

  // color for each type of face
  color col(int side) {
    if (side == 1) 
      return color(255, 102, 102);
    else if (side == 2) 
      return color(255, 178, 102);
    else if (side == 3) 
      return color(255, 255, 102);
    else if (side == 4) 
      return color(102, 255, 102);
    else if (side == 5) 
      return color(102, 178, 255);
    else 
      return color(178, 102, 255);
  }
}
