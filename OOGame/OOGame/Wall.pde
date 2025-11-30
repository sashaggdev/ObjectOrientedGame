// Wall class.

class Wall extends GameObject {

  Wall(float x, float y, float w, float h) {
    super(x, y, w, h);
  }

  void update() {}

  void display() {
    fill(120);
    rect(x, y, w, h);
  }

// Ball collisions

void checkCollision(Ball b) {
  if (b.intersects(this)) {

    float overlapLeft   = (b.x + b.w) - x;
    float overlapRight  = (x + w) - b.x;
    float overlapTop    = (b.y + b.h) - y;
    float overlapBottom = (y + h) - b.y;

    float minOverlap = overlapLeft;
    int side = 0;  // 0=left,1=right,2=top,3=bottom

    if (overlapRight < minOverlap) {
      minOverlap = overlapRight;
      side = 1;
    }

    if (overlapTop < minOverlap) {
      minOverlap = overlapTop;
      side = 2;
    }

    if (overlapBottom < minOverlap) {
      side = 3;
    }

    if (side == 0) {
      b.x = x - b.w;
      b.bounceX();
    }
    else if (side == 1) {
      b.x = x + w;
      b.bounceX();
    }
    else if (side == 2) {
      b.y = y - b.h;
      b.bounceY();
    }
    else if (side == 3) {
      b.y = y + h;
      b.bounceY();
    }
  }
}
}
