// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

import java.util.*;
 

/* @pjs preload="/wp-content/uploads/2015/01/grave/space.jpg"; */

ArrayList<Mover> mmm; //to keep track of movers
ArrayList<Attractor> att; //to keep track of attractors/repellers


int numAtt;         //nr of attractors/repellers
int numMov;        //nr of movers;
boolean repel;     //decides if a repeller or a attractor will be added

PImage space;

void setup() {
  size(500,500);
  space = loadImage("space.jpg");
  
  numAtt = 3;
  numMov = 25;
  
  //initialize attractors
  att = new ArrayList<Attractor>();
  for(int i=0; i<numAtt; i++){
     if(i<=numAtt/2) att.add(new Attractor());
     else att.add(new Repeller());
  }
  mmm = new ArrayList<Mover>();
  for(int i=0; i<numMov; i++){
    mmm.add(new Mover());
  }
}

void draw() {
  background(space);

  PVector force;
 
  for(Attractor a: att){
    a.drag();
    a.hover(mouseX,mouseY);
    a.display();   
  }
  

  for(Mover m1: mmm){
    //to see if the movers are out of the screen and get them back
    if(m1.checkEdges()){
       PVector o = new PVector(width/2, height/2);  //mid-screen
       PVector l = m1.location.get();               //location of mover
       o.sub(l);                                    //getting a vector that points from location to mid-screen
       o.normalize();                               //we don't want it too big!
       m1.velocity = o;
   }else{
     //movers attracting movers
      for(Mover m2: mmm){
           if(!m1.equals(m2)){
              m1.applyForce(m2.attract(m1)); 
           }
      }
      //movers getting attracted by attractors/repellers
      for(Attractor a: att){
        force = a.attract(m1);
        m1.applyForce(force); 
      }
   }
   m1.update();
   m1.display();
  }
  
  
}

//to drag
void mousePressed() {
  for(Attractor a: att) a.clicked(mouseX,mouseY,false); 
}

//to stop dragging
void mouseReleased() {
  for(Attractor a: att) a.stopDragging(); 
}

//to switch attractor/repller, delete and add
void keyPressed(){
   if(keyCode == LEFT || keyCode == RIGHT || keyCode == DOWN){
   int len = att.size();
   //this loop is a stupid way to get around the fact that JS doesn't support listiterators.
   for(int i=0; i<len; i++){
      Attractor a = att.get(i);
      if(a.clicked(mouseX,mouseY,true)){
        att.remove(a);
        len--;
        if(keyCode != DOWN){
          if(a.isAttractor()) att.add(new Repeller(a.location)); 
          else att.add(new Attractor(a.location));  
        }
      }
    }
   }if(keyCode == UP){
     att.add(new Attractor(new PVector(mouseX,mouseY)));
   }
}
