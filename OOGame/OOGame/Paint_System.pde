class PaintArea {
  PGraphics layer;

  PaintArea() {
    layer = createGraphics(width, height);
    layer.beginDraw();
    layer.background(0);
    layer.endDraw();
  }
  
  // Clear painted area
  void clear() {
  layer.beginDraw();
  layer.background(0);
  layer.endDraw();
}

  void paint(float x, float y, float size) {
    layer.beginDraw();
    layer.noStroke();
    layer.fill(255);
    layer.ellipse(x, y, size, size);
    layer.endDraw();
  }

  boolean isPainted(float x, float y) {
    return brightness(layer.get(int(x), int(y))) > 200;
  }

  void display() {
    image(layer, 0, 0);
  }
}
