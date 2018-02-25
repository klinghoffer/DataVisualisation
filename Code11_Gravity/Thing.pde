class Thing {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius;
  float mass;
  float gravitationalRange = 20;

  // create a thing at a position
  Thing(int startX, int startY, float mass, float radius) {
    position = new PVector(startX, startY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.radius = radius;
    this.mass = mass;
  }
  
  // apply a force in a direction
  void applyForce(PVector force) {
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
  
    boolean isCollidingWith(Thing other) {
     // two shapes are colliding if the distance between them is less than their radial sum
     return PVector.dist(position, other.position) < radius + other.radius;
  }
  
  void repelFrom(Thing other) {
   applyForce(PVector.mult(PVector.sub(position, other.position), 0.1)); 
  }
  
  
  void attractOther(Thing other)  {
    // attract towards self
     float distance = PVector.sub(position, other.position).mag();
     if(distance < gravitationalRange * radius && distance > radius + other.radius) {
       other.applyForce(PVector.sub(position, other.position).normalize().mult(100 * mass * other.mass/(distance * distance)));
     }
  }



  void draw() {
    // fill colours the next item - takes in red, green, blue, alpha
    float energyValue = map(velocity.mag(), 0, 100, 0,255);
    float accelerationValue = map(acceleration.mag(), 0, 10,1, 255);
    
    noStroke();
    
    
    fill(153, 225, 102, 10);
    ellipse(position.x, position.y, radius * gravitationalRange * 2, radius*2 * gravitationalRange);
    
    
    fill(energyValue * energyValue * energyValue , energyValue * energyValue, energyValue , 100/(gravitationalRange * radius));
    ellipse(position.x, position.y, mass * velocity.mag() + radius*2, mass * velocity.mag() + radius*2);
    
    
    stroke(1);
    fill(energyValue * energyValue * energyValue , energyValue * energyValue, energyValue , 255); 
    
    // draw a circle centered at x,y
    ellipse(position.x, position.y, radius*2, radius*2);
    

    
  }

  // change the position by a bit
  void update() {
    bounceIfGoingOffScreen();

    velocity.add(acceleration);
    // reset acceleration
    acceleration.mult(0);

    // move the shape
    position.add(velocity);
    applyForce(PVector.mult(velocity, -0.01));
  }
}