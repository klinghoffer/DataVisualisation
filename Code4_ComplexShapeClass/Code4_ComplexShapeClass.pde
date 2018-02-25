class House {
  int positionX;
  int positionY;
  // create a house at a position
  House(int startX, int startY) {
     positionX = startX;
     positionY = startY;
  }
  
  void draw() {
   // draw a rectangle with top left corner at x,y
   rect(positionX,positionY, 50, 50);
   
   // draw a triangle on top of the rectangle
   triangle(
         positionX,positionY,           // the first point should be at the left corner of the house
         positionX+50,positionY,        // the second point should be at the right corner of the house
         positionX+25, positionY - 30); // the last point is above the middle of the house 
  }
  
  // change the position by a bit
  void update() {
    positionX = positionX + 3;
    positionY = positionY + 3;
  }
  
}

void mousePressed() {
   house = new House(mouseX, mouseY); 
  
}

// We want to store a house;
House house;
void setup() {
  //set the size once
   size(640, 360);
   
   // create a new house
   house = new House(0,0);
}


void draw() {
  
  // clear the screen
  background(255);
  
  // draw the house at the position we have stored.
  house.draw();
  // change the position by a bit
  house.update();
}