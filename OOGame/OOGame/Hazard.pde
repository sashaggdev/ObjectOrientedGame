// Hazard object.

class Hazard extends GameObject {

  Hazard(float x, float y, float w, float h) {
    super(x, y, w, h);
  }

  void update() {}

  void display() {
    fill(200, 0, 0);
    rect(x, y, w, h);
  }

  boolean hits(Ball b) {
    return b.intersects(this);
  }
}
