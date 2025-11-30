PaintArea paint;
Level level;

void setup() {
  size(800, 600);
  paint = new PaintArea();
  level = new Level();
}

void draw() {
  background(30);

  // Draw paint layer
  paint.display();

  // Run the level
  level.update();
  level.display();

  // Instructions
  fill(255);
  text("PAINT A PATH TO THE GREEN GOAL", 10, 20);
  //text("RED = DEATH   GREY = WALL", 10, 40);
}

void mouseDragged() {
  paint.paint(mouseX, mouseY, 40);
}
