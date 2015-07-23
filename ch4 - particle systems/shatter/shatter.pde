// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

import java.util.*;

ArrayList<ParticleSystem> ticles;
int num;

void setup(){
  size(500,500);
  ticles = new ArrayList<ParticleSystem>();
  num = 5;
  int x_offset = 50;
  for(int i=0; i<num; i++){
   ticles.add(new ParticleSystem(new PVector(x_offset+40+(80*i),height/2), 40)); 
  }
}

void draw(){
  back();
  Iterator<ParticleSystem> ittit = ticles.iterator();
  //iterates through particle systems to display
  while(ittit.hasNext()){
    ParticleSystem p = ittit.next();
    if(p.isDead()) ittit.remove();
    else{
      //checks if the object is shattered (clicked on)
      if(p.shattered){
         p.run();
      }else p.display();
   }
  }
}

//for shattering
void mouseClicked(){
 for(ParticleSystem p: ticles){
  if(p.clicked(mouseX,mouseY)){
    if(!p.shattered) p.shatter();
    p.shattered = true;
  }
 }
}

//for resetting
void keyPressed(){
  if(keyCode == DOWN){
    ticles = new ArrayList<ParticleSystem>();
    int x_offset = 50;
    for(int i=0; i<num; i++){
     ticles.add(new ParticleSystem(new PVector(x_offset+40+(80*i),height/2), 40)); 
    }
  }
}
  
 //draws background
void back(){
 background(255);
 rectMode(CORNER);
 fill(0);
 rect(0,0,width,height/4);
 rect(0,height*3/4,width,height);
}
