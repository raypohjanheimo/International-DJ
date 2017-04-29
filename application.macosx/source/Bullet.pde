class Bullet {
 
  float x;
  float y;
  float diameter;
  
float speed = random(2,5);

  Bullet(float tempD, float tempX) {
    x = tempX;
   y = height;
   diameter = tempD;
  
  }
  
  Bullet(){
  }
  
  void display() {
    image(bullet, x,y,diameter,diameter);
    
    
  //  if (display = true) {
   // stroke(0);
    //fill(0,0,100,50);
   // ellipse(locX,y,diameter,diameter);
    //}
  }
  
  void ascend() {
    y = y - speed;
  // x = x + random(-2,2);
  
}

void top () {
  if (y <= diameter/2) {
   y = width; 
   
  }
  
}



}