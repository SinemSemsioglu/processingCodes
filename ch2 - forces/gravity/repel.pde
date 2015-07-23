class Repeller extends Attractor{
  Repeller(){
    super();
  }
  Repeller(PVector location_){
   super(location_);
  }
 
 PVector attract(Mover m){
  PVector rpl = super.attract(m);
  rpl.mult(-0.5);
  return rpl;
 }
 void display() {
    ellipseMode(CENTER);
    noStroke();
    if (dragging) fill(255,200,100,200);
    else if (rollover) fill(255,200,100,200);
    else fill(255,210,110);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  boolean isAttractor(){
   return false; 
  }
  
  
}
