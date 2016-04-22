
RedBox MyBox;

PVector mousePosition;

String[] helpText = {"Press h for help.", "Left click inside the box to watch the magic happen."};

boolean isHPressed = false, isHPressedPreviously = false, drawText = true;

void setup()
{
  size(800, 800);
  MyBox = new RedBox(new PVector(width/2, height/2), new PVector(255, 0, 0), "Click Me!", 100, 40);
  mousePosition = new PVector(0, 0);
}

void draw()
{
  background(125);
  
  stroke(0);
  line(20, 0, 20, 800);
  line(0, 20, 800, 20);
  
  stroke(0, 255, 0);
  line(MyBox.Xmin, 20, MyBox.Position.x, MyBox.Position.y);
  line(MyBox.Xmax, 20, MyBox.Position.x + MyBox.MyWidth, MyBox.Position.y);
  line(MyBox.Position.x, 20, MyBox.Position.x + MyBox.MyWidth, 20);
  line(20, MyBox.Ymin, MyBox.Position.x, MyBox.Position.y);
  line(20, MyBox.Ymax, MyBox.Position.x, MyBox.Position.y + MyBox.MyHeight);
  line(20, MyBox.Position.y, 20, MyBox.Position.y + MyBox.MyHeight);  
  
  mousePosition.x = mouseX;
  mousePosition.y = mouseY;
  
  MyBox.checkCollision(mousePosition);
  fill(0, 255, 0);
  MyBox.drawBox();
  drawHelpText();
}

void drawHelpText()
{
  fill(200);
  textAlign(LEFT);
  textSize(12);
  if (isHPressed)
  {
    text(helpText[1], 5, 15);
  }
  if (!isHPressed)
  {
    text(helpText[0], 5, 15);
  }
}

void mousePressed()
{
  if (mouseButton == LEFT && MyBox.IsHit)
  {
    MyBox.updatePosition(new PVector(random(0, width - MyBox.MyWidth), random(0, height - MyBox.MyHeight)));
  }
}

void keyPressed()
{
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