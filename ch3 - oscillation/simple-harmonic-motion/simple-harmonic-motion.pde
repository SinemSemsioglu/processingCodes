// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Oscillator  {

  // Using a PVector to track two angles!
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  color col;

 
  Oscillator()  {
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    //[offset-down] Random velocities and amplitudes
    amplitude = new PVector(random(width/2),random(height/2));
  }
  
  //initializing an Oscillator object with a given color, vel. and amplitude
  //this constructor is used in this sketch
  Oscillator(color col, PVector velocity, PVector amplitude){
   angle = new PVector();
   this.velocity = velocity;
   this.amplitude = amplitude;
   this.col = col;
  }

  //changes the velocity, thus the movement of the osciallator
  void oscillate()  {
    angle.add(velocity);
  }

  void display()  {
    // Oscillating on the x-axis
    float x = sin(angle.x)*amplitude.x;
    // Oscillating on the y-axis
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    fill(col);
    // Drawing the Oscillator as a line connecting a circle
    line(0,0,x,y);
    noStroke();
    ellipse(x,y,16,16);
    popMatrix();
  }
}
