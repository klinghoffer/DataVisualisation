import java.util.List; //<>//

// we want a dataset;
DataSet dataset = new DataSet();
// we want to incrementally add items from our dataset, so we keep track of how far through our dataset we are.
int index = 0;

void mousePressed() {
  // when we click the mouse, let's add the next point from the dataset
  if(index < dataset.dateStrings.length) {
    Thing thing = new Thing(mouseX, mouseY, random(1,10), map( dataset.precipitationValues[index],1,2, 1, 50), map( dataset.precipitationValues[index],1,2, 1, 10), dataset.dateStrings[index] + " - " + dataset.precipitationValues[index]);
    thing.applyForce(new PVector(random(-10,10), random(-10,10)));
    population.addThing(thing);
    index = index + 1;
  }
  
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