class Ball extends GameObject {
  float vx = 4;
  float vy = 3;
  SoundFile bounceSound;

  Ball(float x, float y, SoundFile s) {
    super(x, y, 20, 20);
    bounceSound = s;
  }

  void update() {
    float nextX = x + vx;
    float nextY = y + vy;

    boolean bounced = false;  // track if we should play sound

    // Screen Edge
    if (nextX < 0) {
      x = 0;
      vx *= -1;
      bounced = true;
    } else if (nextX > width - w) {
      x = width - w;
      vx *= -1;
      bounced = true;
    }

    if (nextY < 0) {
      y = 0;
      vy *= -1;
      bounced = true;
    } else if (nextY > height - h) {
      y = height - h;
      vy *= -1;
      bounced = true;
    }

    // Paint edge
    if (paint.isPainted(nextX, nextY)) {
      x = nextX;
      y = nextY;
    } else {
      if (!paint.isPainted(x + vx, y)) {
        vx *= -1;
        bounced = true;
      }
      if (!paint.isPainted(x, y + vy)) {
        vy *= -1;
        bounced = true;
      }
    }
    
    // Play bounce sound
    if (bounced && bounceSound != null) {
      bounceSound.play();
    }
  }

  void bounceX() {
    vx *= -1;
    if (bounceSound != null) bounceSound.play();
  }

  void bounceY() {
    vy *= -1;
    if (bounceSound != null) bounceSound.play();
  }

  void display() {
    fill(255, 200, 0);
    noStroke();
    ellipse(x + w / 2, y + h / 2, w, h);
  }
}
