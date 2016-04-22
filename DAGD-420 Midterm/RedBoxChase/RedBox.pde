class RedBox
{
  PVector Position;
  PVector MyColor;
  String Text;
  float MyWidth, MyHeight;
  float Xmin, Xmax, Ymin, Ymax;
  boolean IsHit;
  
  RedBox(PVector v, PVector c, String s, float w, float h)
  {
    Position = v;
    MyColor = c;
    Text = s;
    MyWidth = w;
    MyHeight = h;
    updateBoundary();
  }
  
  void updatePosition(PVector v)
  {
    Position = v;
    updateBoundary();
  }
  
  void updateBoundary()
  {
    Xmin = Position.x;
    Xmax = Position.x + MyWidth;
    Ymin = Position.y;
    Ymax = Position.y + MyHeight;
  }
  
  void drawBox()
  {
    noStroke();
    fill(MyColor.x, MyColor.y, MyColor.z);
    rect(Position.x, Position.y, MyWidth, MyHeight);
    if(IsHit == true)
    {
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(255);
      text(Text, Position.x + MyWidth/2, Position.y + MyHeight/2);
    }
  }
  
  void checkCollision(PVector v)
  {
    IsHit = AABB(v);
  }
  
  boolean AABB(PVector v)
  {
    if (v.x > this.Xmax) return false;
    if (v.x < this.Xmin) return false;
    if (v.y > this.Ymax) return false;
    if (v.y < this.Ymin) return false;
    else return true;
  }
}