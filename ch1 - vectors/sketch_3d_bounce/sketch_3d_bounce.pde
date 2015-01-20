PVector location;
PVector velocity;
int boxy;
int z;
void setup() {
  size(500, 500, P3D);
  boxy = 300;
  //z is the midpoint for the z-axis movement
  z = 0;
  location = new PVector(width/2, height/2, z);
  velocity = new PVector(2.5, 1.5, 0.3);
}

void draw() {
  background(255,253,252);
  noFill();
  translate(width/2, height/2, z);
  stroke(30, 30, 30);
  box(boxy);
  translate(-width/2, -height/2, -z);
  decoratebox(boxy, width/2, height/2, z, 10);

  location.add(velocity);

  if ((location.x >= (width+boxy)/2) || (location.x <= (width-boxy)/2)) { 
    velocity.x = velocity.x * -1;
  }
  if ((location.y >= (height+boxy)/2) || (location.y <= (height-boxy)/2)) { 
    velocity.y = velocity.y * -1;
  }
  if ((location.z >= z+boxy/2) || (location.z <= z-boxy/2)) { 
    velocity.z = velocity.z * -1;
  }

  stroke(249,5,100);
  fill(175);
  translate(location.x, location.y, location.z);
  sphere(7);
  //  ellipse(location.x,location.y,16,16);
  translate(-location.x, -location.y, -location.z);
}

void decoratebox(int size, float oX, float oY, float oZ, int interval) {

  rectMode(CENTER);
  //top
  translate(oX, oY-size/2, oZ);
  rotateX(PI/2.0);
  fill(120, 100, 100);
  rect(0, 0, size, size);
  rotateX(-PI/2.0);
  translate(-oX,-oY+size/2,-oZ);
  
  //bottom
  translate(oX, oY+size/2, oZ);
  rotateX(PI/2.0);
  fill(60, 50, 50);
  rect(0, 0, size, size);
  rotateX(-PI/2.0);
  translate(-oX,-oY-size/2,-oZ);

  for (float f = oX-size/2; f<oX+size/2; f+=size/interval) {
    stroke(30, 30, 30);
    line(f, oY+size/2, oZ-size/2, f, oY-size/2, oZ-size/2);
    //line(f, oY+size/2, oZ+size/2, f, oY-size/2, oZ+size/2);
  }
  
  for (float f = oY-size/2; f<oY+size/2; f+=size/interval) {
   // 72  209  204  
    stroke(30, 30, 30);
    line(oX+size/2, f, oZ-size/2, oX+size/2, f, oZ+size/2);
    line(oX-size/2, f, oZ-size/2, oX-size/2, f, oZ+size/2);
    line(oX-size/2, f, oZ-size/2, oX+size/2, f+size/interval, oZ-size/2);
  }
}

