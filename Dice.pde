Die[] dice = new Die[9];

void setup()
{
  size(230, 350);
  noLoop();
  
  int index = 0;
  for (int y = 20; y <= 160; y += 70) {
    for (int x = 20; x <= 160; x += 70) {
      dice[index] = new Die(x, y);
      index++;
    }
  }

  for (Die d : dice)
    d.roll();
}
void draw() {
  background(150);
  
  for (Die d : dice) {
    d.show();
  }
  
  int total = 0;
  for (Die d : dice)
    total += d.side;
  
  textSize(40);
  text("Total: " + total, 45, 300);
}
void mousePressed() {
  for (Die d : dice)
    d.roll();

  redraw();
}
class Die //models one single dice cube
{
  //variable declarations here
  int myX, myY, side;
  
  Die(int x, int y) {
    myX = x;
    myY = y;
  }
  
  void roll() {
    side = (int)(Math.random() * 6 + 1);
  }

 void show() {
  pushMatrix();
  translate(myX, myY);
  fill(0, 50);
  noStroke();
  rect(5, 5, 50, 50);
  
    if (side == 1) {
      fill(255, 102, 102);
      rect(0, 0, 50, 50);
      fill(0);
      ellipse(25, 25, 10, 10);
    }
    else if (side == 2) {
      fill(255, 178, 102);
      rect(0, 0, 50, 50);
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else if (side == 3) {
      fill(255, 255, 102);
      rect(0, 0, 50, 50);
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(25, 25, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else if (side == 4) {
      fill(102, 255, 102);
      rect(0, 0, 50, 50);
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else if (side == 5) {
      fill(102, 178, 255);
      rect(0, 0, 50, 50);
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(25, 25, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else {
      fill(178, 102, 255);
      rect(0, 0, 50, 50);
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(12.5, 25, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(37.5, 25, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
      popMatrix();
  }

}
