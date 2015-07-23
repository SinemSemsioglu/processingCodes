// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float lifespan;


  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector(random(-0.1,0.1),random(-0.3,0.3));
    velocity = new PVector(0,0);
    lifespan = 255;
    mass = 8;
    
  }
  
   Particle(PVector l, float m) {
    location = l.get();
    acceleration = new PVector(random(-0.1,0.1),random(-0.3,0.3));
    velocity = new PVector(0,0);
    lifespan = 255;
    mass = m;
    
  }

  //updates velocity and location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  

  void display() {
    noStroke();
    rectMode(CENTER);
    fill(200,100,50,lifespan);
  //  fill(200, 50, 200, lifespan);
    rect(location.x,location.y,mass,mass);
  }
  
  void run(){
   update();
   display();
  }
  
  //applies force to the particle, affects acceleration
  void applyForce(PVector force){
   acceleration.add(force); 
  }
  
  //checks id a particle's lifespan has ended and has become invisible
  boolean isDead(){
     if(lifespan < 0.0) {
       return true; 
     }else return false;
  }
}
