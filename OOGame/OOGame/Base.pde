// Base class for other objects

abstract class GameObject {
  float x, y, w, h;

  GameObject(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  abstract void update();
  abstract void display();

  boolean intersects(GameObject other) {
    return (x < other.x + other.w &&
            x + w > other.x &&
            y < other.y + other.h &&
            y + h > other.y);
  }
}
