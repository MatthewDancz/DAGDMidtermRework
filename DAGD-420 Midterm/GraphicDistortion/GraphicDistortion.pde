
Square square;
ArrayList<Square> shapes = new ArrayList<Square>();
Matrix matrix = new Matrix();
float distance = 100;

String[] helpText = {"Press h for help.", 
  "Left click to create a square.",
  "Press 'W' or 'S' to translate the shapes forward or backward.",
  "Press 'A' or 'D' to translate the shapes left or right.",
  "Press 'Q' or 'E' to rotate the shapes around the origin, and shrink.",
  "Press 'R' or 'F' to skew the shapes along the Y axis.",
  "Press 'Z' or 'C' to skew the shapes along the X axis."
};

boolean isHPressed = false, isHPressedPreviously = false, drawText = true;

void setup()
{
  size(800, 800);
  square = new Square(new PVector(distance, distance),
    new PVector(-distance, distance),
    new PVector(-distance, -distance),
    new PVector(distance, -distance));
  shapes.add(square);
  matrix.setMatrix();
}

void draw()
{
  background(125);
  
  noStroke();
  fill(0, 255, 0);
  
  pushMatrix();
  translate(width/2, height/2);
  for (Square s : shapes)
  {
    beginShape();
    vertex(s.Vertexes[0].x, s.Vertexes[0].y);
    vertex(s.Vertexes[1].x, s.Vertexes[1].y);
    vertex(s.Vertexes[2].x, s.Vertexes[2].y);
    vertex(s.Vertexes[3].x, s.Vertexes[3].y);
    endShape();
  }
  popMatrix();
  
  drawHelpText();
}

void drawHelpText()
{
  fill(200);
  textAlign(LEFT);
  if (isHPressed)
  {
    text(helpText[1], 5, 15);
    text(helpText[2], 5, 30);
    text(helpText[3], 5, 45);
    text(helpText[4], 5, 60);
  }
  if (!isHPressed)
  {
    text(helpText[0], 5, 15);
  }
}

void keyPressed()
{
  if (key == 'w' || key == 'W')
  {
    matrix.translateY -= 10;
  }
  if (key == 's' || key == 'S')
  {
    matrix.translateY += 10;
  }
  if (key == 'd' || key == 'D')
  {
    matrix.translateX += 10;
  }
  if (key == 'a' || key == 'A')
  {
    matrix.translateX -= 10;
  }
  if (key == 'q' || key == 'Q')
  {
    matrix.angle += 10;
  }
  if (key == 'e' || key == 'E')
  {
    matrix.angle -= 10;
  }
  
  if (key == 'r' || key == 'R')
  {
    matrix.matrixScaleY += .01;
  }
  if (key == 'f' || key == 'F')
  {
    matrix.matrixScaleY -= .01;
  }
  if (key == 'c' || key == 'C')
  {
    matrix.matrixScaleX += .01;
  }
  if (key == 'z' || key == 'Z')
  {
    matrix.matrixScaleX -= .01;
  }
  if (key == 'h' || key == 'H')
  {
    isHPressed = true;
  }
  
  matrix.setMatrix();
  for (Square s : shapes)
  {
    s.Vertexes = matrix.pass(s.Vertexes);
  }
  matrix.reset();
}

void keyReleased()
{
  if (key == 'h' || key == 'H')
  {
    isHPressed = false;
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    Square square = new Square(new PVector(mouseX - width/2 + distance, mouseY - height/2 + distance),
    new PVector(mouseX - width/2 - distance, mouseY - height/2 + distance),
    new PVector(mouseX - width/2 - distance, mouseY - height/2 - distance),
    new PVector(mouseX - width/2 + distance, mouseY - height/2 - distance));
    shapes.add(square);
  }
}