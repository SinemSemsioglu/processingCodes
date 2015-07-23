// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// modified by Sinem Semsioglu

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G=0.5;

  Mover() {
    location = new PVector(random(400),random(50),random(100));
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  
  void applyForce(PVector force) {
    PVector f = force.get(); 
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    checkEdges();
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255,230,200);
    ellipse(location.x,location.y,5,5);
  }

  //checks if the mover is off the screen+100 offset from all sides
  boolean checkEdges() {
    if (location.x > width +100 || location.x< -100 || location.y > height+100 || location.y <-100) {
      return true;
    }else return false;

  }
  
    
  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d,5.10,10.0);                          // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);     // Calculate gravitional force magnitude
    force.mult(strength);     // Get force vector --> magnitude * direction
    return force;
  }

}
