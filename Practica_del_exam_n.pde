Ball[] balls = new Ball[10];

void setup() {
  size(400, 400);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), random(height), random(-2, 2), random(-2, 2), color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
    balls[i].bounce();
    balls[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < balls.length; i++) {
    if (balls[i].contains(mouseX, mouseY)) {
      balls[i].changeColor();
    }
  }
}

class Ball {
  float x, y, speedX, speedY;
  color ballColor;
  
  Ball(float x, float y, float speedX, float speedY, color ballColor) {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.ballColor = ballColor;
  }
  
  void move() {
    x += speedX;
    y += speedY;
  }
  
  void bounce() {
    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y < 0 || y > height) {
      speedY *= -1;
    }
  }
  
  void display() {
    fill(ballColor);
    ellipse(x, y, 20, 20);
  }
  
  void changeColor() {
    ballColor = color(random(255), random(255), random(255));
  }
  
  boolean contains(float px, float py) {
    float d = dist(px, py, x, y);
    if (d < 10) {
      return true;
    } else {
      return false;
    }
  }
}
