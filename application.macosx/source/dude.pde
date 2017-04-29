class Dude {


  float x;
  float y;
  float diameter;

PImage rabbit;

  float speed = 5;

  Dude () {
    x = width/2;
    y = 100 ;
    diameter = 100;
    
  }

  Dude (float tempX, float tempY, float tempD) {
    x = tempX;
    y = tempY;
    diameter = tempD;
  }

  void keyPressed() {
    x -= speed;
  }


  void display() {


   image(jazz, x, y, 25, diameter+25);
  }

  void movement() {
    if (keyPressed == true && key == CODED && keyCode == LEFT) {
      x -= speed;
    }
    if (keyPressed == true && key == CODED && keyCode == RIGHT) {
      x += speed;
    }
  }

  boolean intersect(Flower f) {
    float distance = dist(x,y,f.x,f.y); // Calculate distance
      
    // Compare distance to sum of radii
    if (distance < diameter/2 + f.diameter/2) {
      return true;
    } else {
      return false;
    }
  }
   
  boolean collides(Bullet b) {
    float distance = dist(x,y,b.x,b.y); // Calculate distance
      
    // Compare distance to sum of radii
    if (distance < (diameter/2 + b.diameter/2) ) {

      println(distance, diameter, b.diameter);
      return true;
 
    } else {
      return false;
    }
  }
  
  
}