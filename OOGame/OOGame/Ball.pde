class Ball extends GameObject {
  float vx = 4;
  float vy = 3;
  SoundFile bounceSound;

  Ball(float x, float y) {
    super(x, y, 20, 20);
  }

  void update() {
    float nextX = x + vx;
    float nextY = y + vy;

    // Only move on painted surface
    if (paint.isPainted(nextX, nextY)) {
      x = nextX;
      y = nextY;
    } else {
      if (!paint.isPainted(x + vx, y)) vx *= -1;
      if (!paint.isPainted(x, y + vy)) vy *= -1;
    }
  }
  
  void bounceX() {
    vx *= -1;
  }

  void bounceY() {
    vy *= -1;
  }

  void display() {
    fill(255, 200, 0);
    noStroke();
    ellipse(x + w/2, y + h/2, w, h);
  }
}
