class Ball extends GameObject {
  PVector vel;
  SoundFile bounceSound;

  Ball(float x, float y, SoundFile s) {
    super(x, y, 20, 20);
    bounceSound = s;
    vel = new PVector(4, 3); // initial velocity
  }

  void update() {
    PVector nextPos = new PVector(x, y).add(vel);
    boolean bounced = false;

    // Screen edge
    if (nextPos.x < 0) {
      x = 0;
      vel.x *= -1;
      bounced = true;
    } else if (nextPos.x > width - w) {
      x = width - w;
      vel.x *= -1;
      bounced = true;
    }

    if (nextPos.y < 0) {
      y = 0;
      vel.y *= -1;
      bounced = true;
    } else if (nextPos.y > height - h) {
      y = height - h;
      vel.y *= -1;
      bounced = true;
    }

    // Paint edge
    if (paint.isPainted(nextPos.x, nextPos.y)) {
      x = nextPos.x;
      y = nextPos.y;
    } else {
      bounced = true;

      // Try random directions to escape unpainted area
      boolean moved = false;
      for (int i = 0; i < 10; i++) { // try 10 random angles
        PVector testVel = vel.copy().rotate(radians(random(-90, 90)));
        PVector testPos = new PVector(x, y).add(testVel);
        if (paint.isPainted(testPos.x, testPos.y)) {
          vel = testVel;
          x += vel.x;
          y += vel.y;
          moved = true;
          break;
        }
      }

      // If no painted direction found, nudge randomly
      if (!moved) {
        vel = PVector.random2D().setMag(3);
        x += vel.x;
        y += vel.y;
      }
    }

    // Bounce sound
    if (bounced && bounceSound != null) {
      bounceSound.play();
    }
  }

  void bounceX() {
    vel.x *= -1;
    // slight random rotation to avoid repeated paths
    vel.rotate(radians(random(-20, 20)));
    if (bounceSound != null) bounceSound.play();
  }

  void bounceY() {
    vel.y *= -1;
    vel.rotate(radians(random(-20, 20)));
    if (bounceSound != null) bounceSound.play();
  }

  void display() {
    fill(255, 200, 0);
    noStroke();
    ellipse(x + w/2, y + h/2, w, h);
  }
}
