
class Matrix
{
  float[][] matrix = new float[3][3];
  
  float matrixScaleX = 1, matrixScaleY = 1, angle = 0, translateX = 0, translateY = 0;
  
  PVector[] pass(PVector[] a)
  {
    PVector[] array = a;
    for (PVector v : array)
    {
      v.x = v.x * matrix[0][0] + v.y * matrix[0][1] + matrix[0][2];
      v.y = v.x * matrix[1][0] + v.y * matrix[1][1] + matrix[1][2];
    }
    return array;
  }
  
  void setMatrix()
  {
    matrix[0][0] = matrixScaleX * cos(radians(angle));
    matrix[0][1] = matrixScaleX * sin(radians(angle));
    matrix[0][2] = matrixScaleX * translateX;
  
    matrix[1][0] = -matrixScaleY * sin(radians(angle));
    matrix[1][1] = matrixScaleY * cos(radians(angle));
    matrix[1][2] = matrixScaleY * translateY;
  
    matrix[2][0] = 0;
    matrix[2][1] = 0;
    matrix[2][2] = 1;
  }
  
  void reset()
  {
    matrixScaleX = 1;
    matrixScaleY = 1;
    angle = 0;
    translateX = 0;
    translateY = 0;
  }
}