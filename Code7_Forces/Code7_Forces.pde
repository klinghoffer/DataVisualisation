class Thing {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius;
  float mass;

  // create a thing at a position
  Thing(int startX, int startY, float mass, float radius) {
    position = new PVector(startX, startY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.radius = radius;
    this.mass = mass;
  }
  
  // apply a force in a direction
  void applyForce(PVector force) { //<>//
    // as force = mass * acceleration
    // acceleration =  force / mass
     acceleration.add(PVector.div(force, mass)); 
  }

  // let's make it accelerate towards any position we want.
  void moveTowards(int x, int y) {
    PVector pointToMoveTowards = new PVector(x, y);
    PVector directionToMove    = pointToMoveTowards.sub(position).div(100);
    applyForce(directionToMove);
  }

  void bounceIfGoingOffScreen() {
    if (position.x > width || position.x < 0) 
      velocity.x =  -1 * velocity.x;
    if (position.y > height || position.y < 0)
      velocity.y = -1 * velocity.y;
  }

 //<>//
  void draw() {
    // draw a circle centered at x,y
    ellipse(position.x, position.y, radius, radius);
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
  thingA.moveTowards(mouseX, mouseY);
  thingB.moveTowards(mouseX, mouseY);
}

// We want to store 2 things
Thing thingA;
Thing thingB;

void setup() {
  //set the size once
  size(640, 360);

  // create a new thing
  thingA = new Thing(0, 0, 50, 10);
  thingB = new Thing(width/2, height/2, 50, 20);
}


void draw() {

  // clear the screen
  background(255);

  // draw the thing at the position we have stored.
  thingA.draw();
  thingB.draw();
  
  // change the position by a bit
  thingA.update();
  thingB.update();
  

}