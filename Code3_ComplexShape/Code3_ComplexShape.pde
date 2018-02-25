
int positionX = 0;
int positionY=  0;

void drawHouseAtPosition(int x, int y) {
   // draw a rectangle with top left corner at x,y
   rect(x,y, 50, 50);
   
   // draw a triangle on top of the rectangle
   triangle(
         x,y,           // the first point should be at the left corner of the house
         x+50,y,        // the second point should be at the right corner of the house
         x+25, y - 30); // the last point is above the middle of the house
}


void setup() {
  //set the size once
   size(640, 360); 
}


void draw() {
  
  // clear the screen
  background(255);
  
  // draw the house at the position we have stored.
  drawHouseAtPosition(positionX, positionY);
  
  // change the position by a bit
  positionX = positionX + 3;
  positionY = positionY + 3;
}