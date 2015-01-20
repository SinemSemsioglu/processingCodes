/* Mover circler;
int radius;
float angle;
int int_nr;
float interval;
float mag;
float zshift;

void setup(){
   size(600,600,P3D);
   background(0);
   zshift = 0;
   radius = 200;
   int_nr = 20;
   interval = PI/(2*int_nr);
   angle = -PI/2;
   //(perimemeter/4 =) quarter /interval
   mag = PI*radius/(int_nr*2);
   circler = new Mover((float)width/2-radius, (float)height/2, (float)0, (float)mag*cos(angle), (float)mag*sin(angle), (float)0, (float)0,(float)0, (float) 0, radius);
}

void draw(){
  background(0);
   circler.display3d();
  angle += interval;
    //change orientation
   if(angle >= PI/2){
      zshift += interval;
      angle = -PI/2;
      circler.location = new PVector((float)width/2-radius, (float)height/2, (float)0);
      //System.out.println("We're there!");
    }
    if(zshift >PI) noLoop();
    circler.velocity = new PVector(mag*cos(angle),(mag*sin(angle))*cos(zshift),(mag*sin(angle))*sin(zshift)); 
   circler.update(); 
}

*/
