
int positionX = 0;
int positionY=  0;


void setup() {
  //set the size once
   size(640, 360); 
}


void draw() {
  
  // clear the screen
  background(255);
  
  // draw the circle at the position we have stored.
  ellipse(positionX, positionY, 50, 50);
  
  
  // change the position by a bit
  positionX = positionX + 3;
  positionY = positionY + 3;
}