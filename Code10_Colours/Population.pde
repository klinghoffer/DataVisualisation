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