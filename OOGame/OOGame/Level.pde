class Level {
  Ball ball;
  Goal goal;
  boolean won = false;
  int winTime = 0;
  int winDelay = 2000; // 2 seconds before reset

  ArrayList<Wall> walls = new ArrayList<Wall>();
  ArrayList<Hazard> hazards = new ArrayList<Hazard>();

  Level() {
    reset();

    float gap = 200;  // width of the opening in the middle

    // Horizontal wall 
    walls.add(new Wall(0, height/2 - 15, width/2 - gap/2, 30));
    walls.add(new Wall(width/2 + gap/2, height/2 - 15, width/2 - gap/2, 30));
    
    // Vertical wall
    walls.add(new Wall(width/2 - 15, 0, 30, height/2 - gap/2)); 
    walls.add(new Wall(width/2 - 15, height/2 + gap/2, 30, height/2 - gap/2)); 


    // Middle hazard
    float newSize = 25;
    hazards.add(new Hazard(width/2 - newSize/2, height/2 - newSize/2, newSize, newSize, fireSound));


    // Goal
    goal = new Goal(width - 80, height - 80, 50, 50);
  }

  void update() {
    ball.update();

    // Wall collision
    for (Wall w : walls) w.checkCollision(ball);

    // Hazard collision
    for (Hazard h : hazards) {
      if (h.hits(ball)) {
        println("DEAD!");
        reset();
      }
    }

    if (goal.reached(ball) && !won) {
      won = true;
      winTime = millis();
    }
    
    if (won && millis() - winTime > winDelay) {
      reset();
      won = false;
    }
  }

  void display() {
    for (Wall w : walls) w.display();
    for (Hazard h : hazards) h.display();
    goal.display();
    ball.display();
  }

  void reset() {
   
    ball = new Ball(60, 60, bounceSound);

    // Clear all old paint
    paint.clear();

    // Paint a fresh starting area around the ball
    paint.paint(ball.x + ball.w/2, ball.y + ball.h/2, 80);
  }
}
