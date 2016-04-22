class Vector
{
  String name;
  PVector position;
  PVector myColor;
  
  Vector(String n, PVector v, PVector c)
  {
    name = n;
    position = v;
    myColor = c;
  }
  
  void updatePosition(PVector v)
  {
    position = v;
  }
}