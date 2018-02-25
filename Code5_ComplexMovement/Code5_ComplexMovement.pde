class Thing {
  PVector position;
  PVector velocity;
  
  // create a thing at a position
  Thing(int startX, int startY) {
     position = new PVector(startX, startY);
     velocity = new PVector(0,0);
  }
  
  // let's make it move towards any position we want.
  void moveTowards(int x, int y) {
     PVector pointToMoveTowards = new PVector(x,y);
     PVector directionToMove    = pointToMoveTowards.sub(position).div(100);
     velocity.add(directionToMove);
  }
  
  void draw() {
   // draw a circle centered at x,y
   ellipse(position.x,position.y, 50, 50);
  }
  
  // change the position by a bit
  void update() {
    position.add(velocity);
  }
  
}


void mousePressed() {
   // when we click the mouse, let's move towards a point
   thing.moveTowards(mouseX,mouseY);   
}

// We want to store a thing
Thing thing;


void setup() {
  //set the size once
   size(640, 360);
   
   // create a new thing
   thing = new Thing(0,0);
}


void draw() {
  
  // clear the screen
  background(255);
  
  // draw the thing at the position we have stored.
  thing.draw();
  // change the position by a bit
  thing.update();
}