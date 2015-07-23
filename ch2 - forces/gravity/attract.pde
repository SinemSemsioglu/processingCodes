// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// modified by Sinem Semsioglu
// A class for a draggable attractive body in our world

class Attractor {
  float mass;          
  float G;            // Gravitational Constant
  PVector location;  
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on

  Attractor() {
    location = new PVector(random(width),random(height), random(100));
    mass = 30;
    G = 1;
    dragOffset = new PVector(0.0,0.0);
  }
  
  Attractor(PVector location_) {
    location = location_;
    mass = 30;
    G = 1;
    dragOffset = new PVector(0.0,0.0);
  }
  


  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d,0.1,10.0);                          // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d );   // Calculate gravitional force magnitude
    if(strength > d) force.mult(d);                    // I don't want to have a vector greater than the distance between the mover and attractor
    else force.mult(strength);                         // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    noStroke();
    if (dragging) fill(220,10,50,200);
    else if (rollover) fill(220,10,50,200);
    else fill(220,20,60);
    ellipse(location.x,location.y,mass*2,mass*2);
  }

  // The methods below are for mouse interaction
  boolean clicked(int mx, int my, boolean swap) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      if(!swap){
        dragging = true;
        dragOffset.x = location.x-mx;
        dragOffset.y = location.y-my;
      }
      return true;
    }
    return false;
  }

  void hover(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }



  void drag() {
    if (dragging) {
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
  
  //useful for switching
  boolean isAttractor(){
   return true; 
  }

}
