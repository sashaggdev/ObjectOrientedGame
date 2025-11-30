class Level {
  Ball ball;
  Goal goal;

  ArrayList<Wall> walls = new ArrayList<Wall>();
  ArrayList<Hazard> hazards = new ArrayList<Hazard>();

  Level() {
    reset();

    // Walls
    walls.add(new Wall(200, 150, 300, 25));
    walls.add(new Wall(150, 300, 25, 200));
    walls.add(new Wall(400, 400, 250, 25));

    // Hazards
    hazards.add(new Hazard(350, 200, 50, 50, fireSound));
    hazards.add(new Hazard(600, 100, 50, 50, fireSound));

    // Goal
    goal = new Goal(300, 300, 50, 50);
  }

  void update() {
    ball.update();

    // Wall collision
    for (Wall w : walls) {
      w.checkCollision(ball);
    }

    // Hazard collision
    for (Hazard h : hazards) {
      if (h.hits(ball)) {
        println("DEAD!");
        reset();
      }
    }

    // Goal reached (ADD end screen triger)
    if (goal.reached(ball)) {
      println("YOU WIN!");
    }
  }

  void display() {
    for (Wall w : walls) w.display();
    for (Hazard h : hazards) h.display();
    goal.display();
    ball.display();
  }

  void reset() {
    ball = new Ball(60, 60);
  }
}
