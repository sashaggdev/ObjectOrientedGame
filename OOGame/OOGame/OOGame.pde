PaintArea paint;
Level level;
import processing.sound.*;
SoundFile fireSound;
SoundFile bounceSound;

void setup() {
  size(400, 400);
  
  fireSound = new SoundFile(this, "FireSoundEdit.wav");
  bounceSound = new SoundFile(this, "Bounce.wav");
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
  fill(0, 255, 0);
  text("PAINT A PATH TO THE GREEN GOAL", 10, 20);
  //text("RED = DEATH   GREY = WALL", 10, 40);
}

void mouseDragged() {
  paint.paint(mouseX, mouseY, 40);
}
