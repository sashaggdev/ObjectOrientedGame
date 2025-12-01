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
  textSize(32);
  fill(0, 255, 0);
  text("PAINT A PATH TO THE GREEN GOAL", 10, 20);
  //text("RED = DEATH   GREY = WALL", 10, 40);
  
  if (level.won) {
  fill(0, 255, 0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("YOU WIN!", width/2, height/2);
  textAlign(LEFT, BASELINE); // reset align
}

}

void mouseDragged() {
  paint.paint(mouseX, mouseY, 40);
}
