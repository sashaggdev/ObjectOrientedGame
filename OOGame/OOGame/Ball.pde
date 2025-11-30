class Ball extends GameObject {
  PVector vel;
  SoundFile bounceSound;

  Ball(float x, float y, SoundFile s) {
    super(x, y, 20, 20);
    bounceSound = s;
    vel = new PVector(4, 3); // initial velocity
  }

void update() {
    float nextX = x + vel.x;
    float nextY = y + vel.y;

    boolean bounced = false;

    // Screen edge bounce
    if (nextX < 0 || nextX > width - w) {
        vel.x *= -1;
        bounced = true;
    }
    if (nextY < 0 || nextY > height - h) {
        vel.y *= -1;
        bounced = true;
    }

    // Paint edge bounce
    if (paint.isPainted(nextX, nextY)) {
        x = nextX;
        y = nextY;
    } else {
        if (!paint.isPainted(x + vel.x, y)) {
            vel.x *= -1;
            bounced = true;
        }
        if (!paint.isPainted(x, y + vel.y)) {
            vel.y *= -1;
            bounced = true;
        }
    }

    // Bounce sound
    if (bounced && bounceSound != null) {
        bounceSound.play();

        //Randomize direction
        float angleOffset = radians(random(-20, 20)); // rotate velocity by -20° to 20°
        vel.rotate(angleOffset);
    }
}

  void display() {
    fill(255, 200, 0);
    noStroke();
    ellipse(x + w / 2, y + h / 2, w, h);
  }
}
