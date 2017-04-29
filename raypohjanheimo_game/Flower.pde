class Flower {
 
  float x;
  float y;
  float diameter;
  float locX;
  
   int pulse = second()*4;

  
  color col;
  
float speed = random(2,5);
  
  boolean display = true;
  
  boolean active = false;
  
  boolean visible = true;
  
  
  
  Flower(float tempD, float tempX, float tempY) {
    x = width/2;
   y = height;
   diameter = tempD;
   x = tempX;
   y = tempY;
visible = true;
   
  }
  
  void display() {
    
         //    tint(pulse&255,0,0);
if (visible) {
    image(flower, x,y,diameter,diameter);
}
    
  //  if (display = true) {
   // stroke(0);
    //fill(0,0,100,50);
   // ellipse(locX,y,diameter,diameter);
    //}
  }
  
  void ascend() {
    y = y - speed;
  //  locX = locX + random(-2,2);
  
}

void top () {
  if (y <= diameter/2) {
   y = width; 
   
  }
  
}

void reset () {
  x = random(width);
  y = random(height/2, height);
}

void col () {
}

void pop() {
  
  display = false;
  
}
}