// Hazard object.

class Hazard extends GameObject {
  
  SoundFile fireSound;

  Hazard(float x, float y, float w, float h, SoundFile s) {
    super(x, y, w, h);
    fireSound = s;
  }

  void update() {}

  void display() {
    fill(200, 0, 0);
    rect(x, y, w, h);
  }

  boolean hits(Ball b) {
       if (b.intersects(this)) {
      fireSound.play();
      return true;
    }
    return false;
  }
}
