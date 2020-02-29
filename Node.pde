
class Node {

  private PVector position;
  private int radius = 5;
  
  private color fillC = color(140, 40, 230);
  private int fillA = 255;

  public Node() {
    position = new PVector((float)Math.random() * width, (float) Math.random() * height);
  }

  public PVector getPosition() {
    return position;
  }

  public void draw() {
    noStroke();
    fill(fillC, fillA);
    circle(position.x, position.y, radius);
  }
}
