// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ArrayList<Oscillator> osci; //list of oscillators
int num;   //max nr of oscillators allowed

void setup(){
  size(500,500);
  background(255);
  num = 40;
  osci = new ArrayList<Oscillator>();
  //initialization of the first 10 oscillators with different colors
  for(int i=0; i<10; i++){
    osci.add(new Oscillator(color(150+2*i,150+2*(20-i),150+2*(10-i)), new PVector(0.05*cos(PI/6*(1+i)), 0.05*sin(PI/6*(1+i))),new PVector(width/20+5*i, height/20+5*i))); 
  }
}

void draw(){
  background(255);
  for(Oscillator o: osci){
   o.oscillate();
   o.display();
  }
}

//keyboard interaction. UP to add more oscillators, DOWN to reduce to number of oscillators
void keyPressed(){
 int i = osci.size();
 if(keyCode == UP){
   if(i<num){
     osci.add(new Oscillator(color(150+2*i,150+2*(20-i),150+2*(10-i)), new PVector(0.05*cos(PI/6*(1+i)), 0.05*sin(PI/6*(1+i))),new PVector(width/20+5*i, height/20+5*i)));
   }
 }else if(keyCode == DOWN){
     if(i>0){
      osci.remove(i-1);
     }
 }
 
 
}
