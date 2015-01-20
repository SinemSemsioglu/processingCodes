class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float gradient;
  float reduce;
  int swap;
  
   Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(-0.001, 0.01);
    topspeed = random(5,10);
  }
  
  Mover(float x, float y, float vx, float vy, float ax, float ay, int max){
     location = new PVector(x,y);
     velocity = new PVector(vx,vy);
     acceleration = new PVector(ax,ay);
     topspeed = max;
  }
  
  Mover(float x, float y, float z, float vx, float vy, float vz, float ax, float ay, float az, int max){
    location = new PVector(x,y,z);
    velocity = new PVector(vx,vy,vz);
    acceleration = new PVector(ax,ay,az);
    topspeed = max;
    gradient = 1.5;
    swap = 0;
  }
  
  void update() {
    // The Mover moves.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  

  void display() {
    stroke(0);
    fill(175);
    // The Mover is displayed.
    ellipse(location.x,location.y,16,16);
  }
  
  void display3d(){
     
     translate(location.x, location.y, location.z);
     
     if(reduce>200 || reduce <0) swap += 1;
     
     if(swap%2 == 0){
       stroke(255-reduce,255-(reduce*1.5),255-(reduce*2));
       reduce += gradient;
     }else if(swap%2 == 1){
       stroke(255-reduce,255-(reduce*1.5),255-(reduce*2));
       reduce -= gradient;
     }
     
     sphere(1);
  }
  void checkEdges() {

    //[full] When it reaches one edge, set location to the other.
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
    //[end]

  }
    
  void limit(float max){
     if(velocity.mag() >max) {
        velocity.normalize();
        velocity.mult(10);
        acceleration = new PVector(0,0);
     }
  }
 

}
  
/////////////MAIN////////////

Mover circler;
int radius;
float angle;
int int_nr;
float interval;
float mag;
float zshift;

void setup(){
   size(500,500,P3D);
   background(0);
   zshift = 0;
   radius = 200;
   int_nr = 200;
   interval = PI/(2*int_nr);
   angle = 0;
   //(perimemeter/4 =) quarter /interval
   mag = PI*radius/(int_nr*2);
   
   circler = new Mover((float)width/2, (float)height/2-radius, (float)0, mag*sin(zshift)*sin(angle), mag*sin(zshift)*cos(angle), mag*cos(zshift), (float)0,(float)0, (float) 0, radius);
}

void draw(){
  //circler.update();
    circler.display3d();
    circler.velocity = new PVector(mag*sin(zshift)*sin(angle), mag*sin(zshift)*cos(angle), mag*cos(zshift));
    zshift += interval;
  
  
  
  circler.update();
 
  
}

void keyPressed(){
 if(keyCode == DOWN){
   zshift += interval;
 }else if(keyCode == RIGHT){
  angle += interval;
 }else if(keyCode == LEFT){
   angle -= interval;
 }else if(keyCode == UP){
    zshift -= interval*2; 
 }
  
}

