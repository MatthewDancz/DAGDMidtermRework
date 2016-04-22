
class Square
{
  PVector[] Vertexes = new PVector[4];
  
  Square(PVector x, PVector y, PVector z, PVector w)
  {
    Vertexes[0] = x;
    Vertexes[1] = y;
    Vertexes[2] = z;
    Vertexes[3] = w;
  }
}