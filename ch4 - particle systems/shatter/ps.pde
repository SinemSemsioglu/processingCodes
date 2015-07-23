// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
 ArrayList<Particle> particles;
 PVector origin;
 
 float mass;
 boolean shattered;      //checks if the object has been shattered/clicked on
 
 ParticleSystem(PVector origin_){
  particles = new ArrayList<Particle>(); 
  origin = origin_;
  shattered = false;
  mass = 0;
 }
 
 ParticleSystem(PVector origin_, float mass_){
  particles = new ArrayList<Particle>(); 
  origin = origin_;
  shattered = false;
  mass = mass_;
 }
 
 void addParticle(){
  particles.add(new Particle(origin)); 
 }
 
 //adds particle to a given position
 void addParticle(Particle p){
  particles.add(p); 
 }
 
 //shatters the particles accross the scrren
 void run(){
   Iterator<Particle> parts = particles.iterator();
   Particle curr; 
   while(parts.hasNext()){
     curr = parts.next();
     curr.run();
     if (curr.isDead()){
      parts.remove(); 
     }
   }
 }
 
 void display(){
  rectMode(CENTER);
  noStroke();
  fill(200,100,50);
  rect(origin.x, origin.y, mass, mass);
 }
 
//checks if a particle system has been clicked 
boolean clicked(int mx, int my) {
    float d = dist(mx,my,origin.x,origin.y);
    if (d < mass) {
      return true;
    }
    return false;
 }
 
 //initializes a list of particles with their total mass equal to the objects
 void shatter(){
  float m=0;
  while(m<mass*mass){
    float moverMass = random(5,mass/3);
    PVector moverPos = PVector.add(origin, new PVector(random(-mass/2,mass/2),random(-mass/2, mass/2)));
    particles.add(new Particle(moverPos,moverMass)); 
    m+=moverMass*moverMass;
  }
 }
 
 boolean isDead(){
   boolean check = true;
    if(particles.isEmpty())return false;
    else{
      for(Particle p:  particles){
        check = check && p.isDead(); 
      }
    }
    return check;
 }
 

}
