/*Mover circler;
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
*/

