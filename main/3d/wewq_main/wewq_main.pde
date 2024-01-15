int currentDrawing = 1;

void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(255);

  if (currentDrawing == 1) {
    drawDrawing1();
  } else if (currentDrawing == 2) {
    drawDrawing2();
  }
}

void drawDrawing1() {
  float changerate = 0.005;
  float timeslice = 0.005;
  float noiseScale = 0.005;
  translate(width/2, height/2);
  background(150);
  rotateX((mouseY - height/2)*2*PI/width);
  rotateZ((mouseX - width/2)*2*PI/height);
  for (int i = -250; i < 250; i+=10) {
    for (int j = -250; j < 250; j+=10) {
      point(i, j, noise(i * noiseScale, j * noiseScale, timeslice) * 200 - 50);
    }
  }
  timeslice += changerate;
}

float[] x = new float[0];
float[] y = new float[0];
float[] xSpeed = new float[0];
float[] ySpeed = new float[0];
float[] size = new float[0];
float[] r = new float[0];
float[] g = new float[0];
float[] b = new float[0];

void drawDrawing2() {
  size(500, 500);
  background(200);

  for (int i = 0; i < x.length; i++) {
    x[i] += xSpeed[i];
    if (x[i] < 0 || x[i] > width) {
      xSpeed[i] *= -1;
    }

    y[i] += ySpeed[i];
    if (y[i] < 0 || y[i] > height) {
      ySpeed[i] *= -1;
    }

    fill(r[i], g[i], b[i]);
    ellipse(x[i], y[i], size[i], size[i]);
  }
}

void mousePressed() {
  x = append(x, mouseX);
  y = append(y, mouseY);
  xSpeed = append(xSpeed, random(-5, 5));
  ySpeed = append(ySpeed, random(-5, 5));
  size = append(size, random(5, 20));
  r = append(r, random(256));
  g = append(g, random(256));
  b = append(b, random(256));
}

void keyPressed() {
  if (key == '1') {
    currentDrawing = 1;
  } else if (key == '2') {
    currentDrawing = 2;
  }
}
