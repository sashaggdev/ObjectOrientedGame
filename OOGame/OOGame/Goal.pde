// Goal object. Player must reach it.
// ADD: End screen or other levels

class Goal extends GameObject {

  Goal(float x, float y, float w, float h) {
    super(x, y, w, h);
  }

  void update() {}

  void display() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }

  boolean reached(Ball b) {
    return b.intersects(this);
  }
}
