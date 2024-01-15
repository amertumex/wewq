int selectedOption = 0;
boolean drawingCompleted = false;

void setup() {
  size(400, 400);
  background(255);
  drawButtons();
}

void draw() {
  if (drawingCompleted) {
    drawReturnButton();
  }
}

void drawButtons() {
  fill(200);
  rect(50, 50, 160, 40);
  rect(220, 50, 160, 40);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(15);
  text("Нарисовать дом", 135, 70);
  text("Нарисовать машину", 300, 70);
}

void drawReturnButton() {
  fill(200);
  rect(300, 330, 80, 40);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Вернуться", 340, 350);
}

void mousePressed() {
  if (!drawingCompleted) {
    if (mouseX > 50 && mouseX < 150 && mouseY > 50 && mouseY < 90) {
      selectedOption = 1;
      clearCanvas();
      drawHouse();
      drawingCompleted = true;
    } else if (mouseX > 200 && mouseX < 300 && mouseY > 50 && mouseY < 90) {
      selectedOption = 2;
      clearCanvas();
      drawSomethingElse();
      drawingCompleted = true;
    }
  } else {
    if (mouseX > 300 && mouseX < 380 && mouseY > 330 && mouseY < 370) {
      drawingCompleted = false;
      clearCanvas();
      drawButtons();
    }
  }
}

void clearCanvas() {
  background(255);
}

void drawHouse() {
   fill(255, 0, 0);
   rect(100, 200, 200, 150);
   
   fill(100);// Труба
   rect(250, 120, 20, 50);

   fill(0, 0, 255);
   triangle(100, 200, 200, 100, 300, 200);

   fill(255);
   rect(120, 220, 60, 60);

   fill(120, 80, 19);
   rect(200, 220, 40, 130);

}

void drawSomethingElse() {
  fill(0, 150, 255);
  rect(50, 100, 300, 80, 10);

  fill(173, 216, 230);
  rect(260, 110, 70, 30);

  fill(0);
  ellipse(120, 180, 40, 40);
  ellipse(320, 180, 40, 40);

  fill(0, 150, 255);
  rect(190, 100, 60, 80);

  fill(255);
  ellipse(280, 160, 10, 10);
}
