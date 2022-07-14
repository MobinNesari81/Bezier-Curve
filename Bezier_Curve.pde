
Point[] points;
Point prevPoint;
float t;

void drawPoint(Point point)
{
  stroke(0);
  strokeWeight(7);
  point(point.getX(), point.getY());
  fill(0);
  text("P" + point.getNum(), point.getX() + 10, point.getY() + 10);
}

void setup_bezier()
{
  for (int i = 0; i < 3; i++)
  {
    drawPoint(points[i]);
  }
  stroke(150);
  strokeWeight(1);
  line(points[0].getX(), points[0].getY(), points[1].getX(), points[1].getY());
  line(points[1].getX(), points[1].getY(), points[2].getX(), points[2].getY());
}

Point find_next_bt(){
  float x = (1-t) * (1-t) * points[0].getX() + 2 * (1-t) * t * points[1].getX() + t * t * points[2].getX();
  float y = (1-t) * (1-t) * points[0].getY() + 2 * (1-t) * t * points[1].getY() + t * t * points[2].getY();
  Point answer = new Point(x, y, -1);
  return answer;
}


void setup()
{
  t = 0;
  points = new Point[3];
  points[0] = new Point(100, 300, 0);
  points[1] = new Point(500 , 100, 1);
  points[2] = new Point(700, 300, 2);
  prevPoint = points[0];
  size(900, 500);
  background(255, 255, 255);
  setup_bezier();
}

void draw()
{
  strokeWeight(3);
  delay(10);
  stroke(190, 0, 0);
  Point nextPoint = find_next_bt();
  line(prevPoint.getX(), prevPoint.getY(), nextPoint.getX(), nextPoint.getY());
  prevPoint = nextPoint;
  t += 0.001;
  if (t > 1.01)
  {
    noLoop();
  }
}

class Point{
  private float x;
  private float y;
  private int num;
  
  public Point(float x, float y, int num)
  {
    this.x = x;
    this.y = y;
    this.num = num;
  }
  
  public float getX()
  {
    return this.x;
  }
  
  public float getY()
  {
    return this.y;
  }
  
  public int getNum(){
    return this.num; 
  }
}
