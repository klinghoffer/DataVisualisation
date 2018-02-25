import java.util.List; //<>// //<>//

class Population {
   // a list <of> things...
   List<Thing> things = new ArrayList<Thing>();
  
   void addThing(Thing thing)  {
      things.add(thing); 
   }
   
   // when drawing the things
   void draw() {
     for(Thing thing : things) {
        thing.draw(); 
     }
   }
   
   void update() {
     // for each thing, collide the thing
      for(Thing thing : things)  {
         for(Thing other : things) {
            if(thing.isCollidingWith(other)) {
              thing.repelFrom(other);
            }
         }
        
      }
      
      // then update all the things
      for(Thing thing : things) {
         thing.update(); 
      }
   }

}


void mousePressed() {
  // when we click the mouse, let's move towards a point
  Thing thing = new Thing(mouseX, mouseY, random(1,10), random(1,50));
  thing.applyForce(new PVector(random(-10,10), random(-10,10)));
  population.addThing(thing);
}

// We want to store lots of things
Population population = new Population();

void setup() {
  //set the size once
  size(1280, 720);

}


void draw() {

  // clear the screen
  background(255);

  // draw the things at the position we have stored.
  population.draw();
  
  
  // update everything by a bit
  population.update();
  
}