/** 
* International DJ who got drugged and now he's Jazz Jackrabbit and he has to collect flowers and dodge bullets to keep his set alive or he'll embarrass himself
* - The Game
*
* by Ray Pohjanheimo
*
* Use LEFT and RIGHT arrow keys to control Jazz.
* 
* In future versions, I wish to have an increasing difficulty slope, have the collectables affect the music and overall have more explosions.
*
*
*/



PImage bullet; // image loading
PImage flower;
PImage jazz;

int gameState; //0= pre game 1= in game 2= game over

int score;
int lastTime = 0;
int flowercounter = 20;
int fc = 1;
int difficulty = 1;

int timer = millis();

Flower f1; 
Bullet b1;

ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

Dude player1;

import ddf.minim.*;

AudioPlayer playerMenu;
AudioPlayer playerGame;
AudioPlayer playerEnd;


Minim minim;//audio context


Flower test;

float x, y;

void mousePressed() {
}

void setup() {

  gameState = 0;

  size(800, 800);
  
  
  for (int i = 0; i < 30; i++) { // putting some flowers in there
    flowers.add(new Flower(random(40,80),random(width),height));
  }
  
  for (int i = 0; i < 15; i++) { // bullets
    bullets.add(new Bullet(random(20,60),random(width)));
  }

//for (int i = 1; i < rabbit.length; i++) {
//  rabbit[i] = loadImage("jazz"+i+".png");
//}
  minim = new Minim(this);
  playerMenu = minim.loadFile("beat0.mp3", 2048);
   playerGame = minim.loadFile("beat1b.mp3", 2048);
        playerEnd = minim.loadFile("end.mp3", 2048);


  // player.play();

  score = 0;
  flower = loadImage("flower.png");
  bullet = loadImage("bullet.png");
  jazz = loadImage("jazz8.png");

  player1 = new Dude(width/2, 100, 25);

  test = new Flower(200, width/2, height);
}

void stop() {
  playerMenu.close();
  playerGame.close();
  minim.stop();
  super.stop();
}



void draw() {

background(150);

  int m = millis()/2;
  int n = millis()/4;
  int o = millis()/6;


  noStroke();
   fill(m % 255, n%255, 255);
   rect(0,0,width,height);

  if (gameState==0) {

  if (!playerMenu.isPlaying()) {
    playerMenu.rewind();
    playerMenu.play();
  }

    
    
    fill(255);
    textSize(20);
    text("You're an international DJ" , 10, 50);
    
      fill(255);
    textSize(20);
    text("Your drink was compromised with an unknown substance", 10,100);

    fill(255);
    textSize(15);
    text("Capture flowers to keep your set going and avoid bullets to keep your composure", 10, 200);

    fill(255);
    textSize(15);
    text("Move with LEFT and RIGHT arrow keys", 10, 300);

    fill(255);
    textSize(15);
    text("Also, you are Jazz Jackrabbit", 10, 400);

    fill(255);
    textSize(20);
    text("PRESS ANY KEY TO CONTINUE", 10, 500);




    if (keyPressed) {
      gameState=1;
    }
  }

  if (gameState == 1) {
    
    difficulty = 1;
 
    
    playerMenu.close();
    
      if (!playerGame.isPlaying()) {
    playerGame.rewind();
    playerGame.play();
  }
  fill(200);
    textSize(50);
    text(score, 280, 85);
  
    float d = dist(player1.x, player1.y, test.x, test.y);


//    if (player1.intersect(f1)) {
  //    score++;
   //   f1.reset();
   // }
    
    
    for (Flower fx : flowers) {
      fx.display();
      fx.ascend();
      fx.top();
   if (player1.intersect(fx)) {
      score++;
      fx.reset();
    }
    }
    
    for (Bullet bx : bullets) {
      bx.display();
      bx.ascend();
      bx.top();
    if (player1.collides(bx)){
      gameState = 2;
    }
    }

 //   f1.display();
  //  f1.ascend();
  //  f1.top();
  //  b1.display();
 //   b1.ascend();
 //   b1.top();

    player1.display();
    player1.movement();
    
 //   if (score % 10 == 0){
  //    difficulty++;
  //  }
  }

if (gameState == 2) {
  
  playerGame.close();
      playerMenu.close();

   playerEnd.play();
     
  
  
  
  keyCode = 0;
   fill(255);
    textSize(50);
    text("Final Score:",20, 85);
    text(score, 290, 85);
    textSize(30);
    text("Play Again?", 20, 157);
    textSize(30);
    text("Press R to Restart", 20, 225);
    fill(0);
    
    flowers.clear();
    bullets.clear();
    
    if (keyPressed && key == 'r') {
      setup();
      gameState = 1;
      
    }
  }

}