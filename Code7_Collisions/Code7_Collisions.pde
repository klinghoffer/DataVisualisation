class Thing {
  PVector position;
  PVector velocity;
  PVector acceleration;

  // create a thing at a position
  Thing(int startX, int startY) {
    position = new PVector(startX, startY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // let's make it accelerate towards any position we want.
  void moveTowards(int x, int y) {
    PVector pointToMoveTowards = new PVector(x, y);
    PVector directionToMove    = pointToMoveTowards.sub(position).div(100);
    acceleration.add(directionToMove);
  }

  void bounceIfGoingOffScreen() {
    if (position.x > width || position.x < 0) 
      velocity.x =  -1 * velocity.x;
    if (position.y > height || position.y < 0)
      velocity.y = -1 * velocity.y;
  }


  void draw() {
    // draw a circle centered at x,y
    ellipse(position.x, position.y, 50, 50);
  }

  // change the position by a bit
  void update() {
    bounceIfGoingOffScreen();

    velocity.add(acceleration);
    // reset acceleration
    acceleration.mult(0);

    // move the shape
    position.add(velocity);
  }
}


void mousePressed() {
  // when we click the mouse, let's move towards a point
  thing.moveTowards(mouseX, mouseY);
}

// We want to store a thing
Thing thing;


void setup() {
  //set the size once
  size(640, 360);

  // create a new thing
  thing = new Thing(0, 0);
}


void draw() {

  // clear the screen
  background(255);

  // draw the thing at the position we have stored.
  thing.draw();
  // change the position by a bit
  thing.update();
}