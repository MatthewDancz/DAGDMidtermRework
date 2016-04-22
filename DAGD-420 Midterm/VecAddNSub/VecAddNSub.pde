
Vector v1, v2, result;
Vector[] vectors = new Vector[3];

String[] helpText = {"Press h for help.", "Left click to move V1.", "Right click to move V2.", "Press 'A' to see the resultant vector from adding V1 and V2.", "Press 'S' to see the resultant vector from subtracting V1 and V2"};

boolean isHPressed = false, isHPressedPreviously = false, drawText = true;

void setup()
{
  size(800, 800);
  v1 = new Vector("V1", new PVector(0, 0), new PVector(0, 0, 0));
  v2 = new Vector("V2", new PVector(0, 0), new PVector(0, 0, 0));
  result = new Vector("R", new PVector(0, 0), new PVector(0, 255, 0));
  vectors[0] = v1;
  vectors[1] = v2;
  vectors[2] = result;
}

void draw()
{
  background(125);
  
  drawVectors();
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

void drawVectors()
{
  for (Vector v : vectors)
  {
    pushMatrix();
    translate(width/2, height/2);
    
    fill(v.myColor.x, v.myColor.y, v.myColor.z);
    stroke(v.myColor.x, v.myColor.y, v.myColor.z);
    
    if(v.myColor.y == 255)
    {
      strokeWeight(1);
    }
    else
    {
      strokeWeight(3);
    }
    
    line(0, 0, v.position.x, v.position.y);
    float magnitude, theta;
    PVector straight, normR, normL;
    magnitude = sqrt(v.position.x * v.position.x + v.position.y * v.position.y);
    theta = atan2(v.position.y, v.position.x);
    straight = new PVector(10 * cos(theta), 10 * sin(theta));
    normR = new PVector(-5 * sin(theta), 5 * cos(theta));
    normL = new PVector(5 * sin(theta), -5 * cos(theta));
    
    translate((magnitude - 10) * cos(theta), (magnitude - 10) * sin(theta));
    beginShape();
    vertex(straight.x, straight.y);
    vertex(normR.x, normR.y);
    vertex(normL.x, normL.y);
    endShape(CLOSE);
    
    translate(-(magnitude - 10) * cos(theta), -(magnitude - 10) * sin(theta));
    fill(0, 255, 0);
    textAlign(CENTER);
    text(v.name, (magnitude + 10) * cos(theta), (magnitude + 10) * sin(theta));
    
    popMatrix();
    
    
  }
}

void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    result.updatePosition(new PVector(vectors[0].position.x + vectors[1].position.x, vectors[0].position.y + vectors[1].position.y));
    vectors[2] = result;
  }
  if (key == 's' || key == 'S')
  {
    result.updatePosition(new PVector(vectors[0].position.x - vectors[1].position.x, vectors[0].position.y - vectors[1].position.y));
    vectors[2] = result;
  }
  if (key == 'h' || key == 'H')
  {
    isHPressed = true;
  }
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
    v1.updatePosition(new PVector(mouseX - width/2, mouseY - height/2));
    vectors[0] = v1;
  }
  
  if (mouseButton == RIGHT)
  {
    v2.updatePosition(new PVector(mouseX - width/2, mouseY - height/2));
    vectors[1] = v2;
  }
}