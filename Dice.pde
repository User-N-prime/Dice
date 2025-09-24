Die dyson, diana, dieLit, daidus, diane, dion, dilan, diya, dina;
void setup()
{
  size(500, 500);
  noLoop();
  
  dyson = new Die(20, 20);
  diana = new Die(90, 20);
  dieLit = new Die(160,20);
  daidus = new Die(20, 90);
  diane = new Die(90, 90);
  dion = new Die(160, 90);
  dilan = new Die(20, 160);
  diya = new Die(90, 160);
  dina = new Die(160, 160);
  dyson.roll();
  diana.roll();
  dieLit.roll();
  daidus.roll();
  diane.roll();
  dion.roll();
  dilan.roll();
  diya.roll();
  dina.roll();
}
void draw()
{
  dyson.show();
  diana.show();
  dieLit.show();
  daidus.show();
  diane.show();
  dion.show();
  dilan.show();
  diya.show();
  dina.show();
}
void mousePressed()
{
  dyson.roll();
  diana.roll();
  dieLit.roll();
  daidus.roll();
  diane.roll();
  dion.roll();
  dilan.roll();
  diya.roll();
  dina.roll();
  redraw();
}
class Die //models one single dice cube
{
  //variable declarations here
  int myX, myY, side;
  
  Die(int x, int y) //constructor
  {
    //variable initializations here
    myX = x;
    myY = y;
  }
  
  void roll() {
    side = (int)(Math.random() * 6 + 1);
  }

 void show() {
  pushMatrix();
  translate(myX, myY);
  fill(255);
  rect(0, 0, 50, 50);
  
    if (side == 1) {
      fill(0);
      ellipse(25, 25, 10, 10);
    }
    else if (side == 2) {
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else if (side == 3) {
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(25, 25, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else if (side == 4) {
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else if (side == 5) {
      fill(0);
      ellipse(12.5, 12.5, 10, 10);
      ellipse(37.5, 12.5, 10, 10);
      ellipse(25, 25, 10, 10);
      ellipse(12.5, 37.5, 10, 10);
      ellipse(37.5, 37.5, 10, 10);
    }
    else {
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
